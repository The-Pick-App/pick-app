import 'package:flutter/material.dart';
import 'package:pickapp/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    email: '',
    firstName: '',
    lastName: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    iat: 0,
  );

  User get user => _user;

  void setUser(Map<String, dynamic> user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
