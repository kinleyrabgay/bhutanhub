import 'dart:convert';
import 'package:bhutanhub/core/constants/enums.dart';
import 'package:bhutanhub/core/constants/store.dart';
import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/errors/firebase.auth.dart';
import 'package:bhutanhub/core/errors/firebase.platform.dart';
import 'package:bhutanhub/core/services/api/v1/constant.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/data/models/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  Future<void> forgotPassword(String email);

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<void> register({
    required String name,
    required String email,
    required String password,
  });

  Future<void> updateUser({
    required UpdateUserAction action,
    dynamic userData,
  });

  Future<UserModel> googleSSO();

  Future<UserModel> getCurrentUser();
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImplementation({
    required FirebaseAuth authClient,
    required FirebaseFirestore cloudStoreClient,
    required http.Client client,
    required Dio dio,
    required SharedPreferences pref,
  })  : _authClient = authClient,
        _cloudStoreClient = cloudStoreClient,
        _client = client,
        _dio = dio,
        _pref = pref;
  final FirebaseAuth _authClient;
  final FirebaseFirestore _cloudStoreClient;
  final http.Client _client;
  final Dio _dio;
  final SharedPreferences _pref;

  @override
  Future<UserModel> getUser() async {
    try {
      final response = await _client.get(Uri.https('uri'));
      return jsonDecode(response.body) as UserModel;
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<UserModel> googleSSO() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw const APIException(
            message: 'Google Sign-In cancelled', statusCode: 400);
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _authClient.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user == null) {
        throw const APIException(
            message: 'User not found after Google Sign-In', statusCode: 404);
      }

      // Check if user data exists
      var userData = await _getUserData(user.uid);
      if (!userData.exists) {
        await _setUserData(user, user.email!);
        userData = await _getUserData(user.uid);
      }

      // Return UserModel
      return UserModel.fromMap(userData.data()!);
    } on FirebaseAuthException catch (e) {
      throw APIException(
        message: e.message ?? 'Google Sign-In failed',
        statusCode: 500,
      );
    } on FirebaseException catch (e) {
      throw APIException(
        message: BHFirebaseAuthException(e.code).message,
        statusCode: 500,
      );
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw APIException(
        message: BHFirebasePlatformException(e.code).message,
        statusCode: 500,
      );
    } catch (e) {
      throw const APIException(
        message: 'Something went wrong, Please try again',
        statusCode: 500,
      );
    }
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      APITestService.login,
      data: {
        'email': email,
        'password': password,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    if ([200, 201].contains(response.data['statusCode'])) {
      _pref.setString(StoreKey.token, response.data['data']['token']);
      return UserModel.fromMap(response.data['data']);
    } else {
      throw APIException(
        message: response.data['message'],
        statusCode: response.data['statusCode'],
      );
    }
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      APITestService.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if ([200, 201].contains(response.data['statusCode'])) {
      return;
    } else {
      throw APIException(
        message: response.data['message'],
        statusCode: response.data['statusCode'],
      );
    }
  }

  @override
  Future<void> logout() async {
    try {} on FirebaseAuthException catch (e) {
      throw APIException(
        message: BHFirebaseAuthException(e.code).message,
        statusCode: 505,
      );
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser({required UpdateUserAction action, userData}) {
    throw UnimplementedError();
  }

  Future<DocumentSnapshot<DataMap>> _getUserData(String uid) async {
    return _cloudStoreClient.collection('users').doc(uid).get();
  }

  Future<void> _setUserData(User user, String fallbackEmail) async {
    await _cloudStoreClient.collection('users').doc(user.uid).set(
          UserModel(
            token: user.uid,
            email: user.email ?? fallbackEmail,
            name: user.displayName ?? '',
            avatar: user.photoURL ?? '',
          ).toMap(),
        );
  }

  // TODO
  Future<void> _updateUserData(DataMap data) async {
    await _cloudStoreClient
        .collection('users')
        .doc(_authClient.currentUser?.uid)
        .update(data);
  }

  @override
  Future<UserModel> getCurrentUser() async {
    // --- Get the token
    final token = _pref.getString(StoreKey.token) ?? '';

    if (token.isEmpty) {
      throw const APIException(
        message: 'You need to be logged in to perform this action',
        statusCode: 404,
      );
    }

    final response = await _dio.get(
      APITestService.current,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if ([200, 201].contains(response.data['statusCode'])) {
      return UserModel.fromMap(response.data['data']);
    } else {
      throw APIException(
        message: response.data['message'],
        statusCode: response.data['statusCode'],
      );
    }
  }
}
