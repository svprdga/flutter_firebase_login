import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

enum LoginSection {
  welcome,
  welcomeToUsername,
  username,
  usernameToPassword,
  password,
}

class LoginModel extends ChangeNotifier {
  final Logger _log;

  LoginSection _section = LoginSection.welcome;

  LoginSection get section => _section;

  set section(LoginSection value) {
    if (value != _section) {
      _section = value;
      notifyListeners();
    }
  }

  LoginModel(this._log);

  Future<void> login({required String user, required String password}) async {}
}
