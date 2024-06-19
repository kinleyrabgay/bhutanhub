import 'dart:convert';
import 'package:bhutanhub/core/constants/enums.dart';
import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/errors/firebase.auth.dart';
import 'package:bhutanhub/core/errors/firebase.platform.dart';
import 'package:bhutanhub/core/services/api/v1/constant.dart';
import 'package:bhutanhub/core/utils/typedef.dart';
import 'package:bhutanhub/src/features/authentication/data/models/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<UserModel> getUser();

  Future<void> forgotPassword(String email);

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<void> register({
    required String name,
    required String email,
    required String password,
  });

  Future<void> updateUser({
    required UpdateUserAction action,
    dynamic userData,
  });

  Future<void> googleSSO();
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImplementation({
    required FirebaseAuth authClient,
    required FirebaseFirestore cloudStoreClient,
    required FirebaseStorage dbClient,
    required http.Client client,
  })  : _authClient = authClient,
        _cloudStoreClient = cloudStoreClient,
        _dbClient = dbClient,
        _client = client;
  final FirebaseAuth _authClient;
  final FirebaseFirestore _cloudStoreClient;
  final FirebaseStorage _dbClient;
  final http.Client _client;

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
  Future<void> googleSSO() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _authClient.signInWithCredential(credential);

      final User? user = userCredential.user;

      var userData = await _getUserData(user!.uid);

      if (!userData.exists) {
        await _setUserData(user, user.email!);
      }
    } on FirebaseAuthException catch (e) {
      throw APIException(
        message: e.message ?? 'Google Sign-In failed',
        statusCode: 500,
      );
    } on FirebaseException catch (e) {
      throw BHFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw BHFirebasePlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authClient.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userData = await _getUserData(result.user!.uid);
      return UserModel.fromMap(userData.data()!);
    } on FirebaseAuthException catch (e) {
      throw APIException(
        message: BHFirebaseAuthException(e.code).message,
        statusCode: 505,
      );
    } on FirebaseException catch (e) {
      throw APIException(
        message: BHFirebaseAuthException(e.code).message,
        statusCode: 505,
      );
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw APIException(
        message: BHFirebasePlatformException(e.code).message,
        statusCode: 505,
      );
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authClient.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;
      await user?.updateDisplayName(name);
      var userData = await _getUserData(user!.uid);

      if (!userData.exists) {
        await _setUserData(user, email);
        userData = await _getUserData(user.uid);
      }
    } on FirebaseAuthException catch (e) {
      throw APIException(
        message: e.message ?? 'Registration error',
        statusCode: 505,
      );
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    print(email);
    final response = await _client.get(Uri.https(APIService.greeting));
    print(response);

    // throw UnimplementedError();
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
            uid: user.uid,
            email: user.email ?? fallbackEmail,
            name: user.displayName ?? '',
            avatar: user.photoURL ?? '',
          ).toMap(),
        );
  }

  Future<void> _updateUserData(DataMap data) async {
    await _cloudStoreClient
        .collection('users')
        .doc(_authClient.currentUser?.uid)
        .update(data);
  }
}
