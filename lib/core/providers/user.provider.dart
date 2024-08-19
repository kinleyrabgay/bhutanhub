import 'package:bhutanhub/src/features/authentication/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserEntity? _user;

  UserEntity? get user => _user;

  void initUser(UserEntity? user) {
    if (_user != user) _user = user;
  }

  // void setUser(UserEntity user) {
  //   _user = user;
  //   notifyListeners();
  // }

  set user(UserEntity? user) {
    if (_user != user) {
      _user = user;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
