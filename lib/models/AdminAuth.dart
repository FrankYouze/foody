import 'package:flutter/material.dart';

class AdminAuth extends ChangeNotifier{

String? _user;
String _pass = "admin123";
bool _isAuthenticated = false; 


  bool get isAuthenticated => _isAuthenticated;
  String? get user => _user;
  String get pass => _pass;


    void login(String username, String password) {
    // Replace this with actual authentication logic
    if (username == 'admin' && password == _pass) {
      _isAuthenticated = true;
      _user = username;
      notifyListeners();
    }
  }

  void logout() {
    _isAuthenticated = false;
    _user = null;
    notifyListeners();
  }

  void changePassword(String newPassword) {
    _pass = newPassword;
    notifyListeners();
  }

}