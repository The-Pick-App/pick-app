import 'package:flutter/material.dart';
import 'package:pickapp/models/token.dart';

class TokenProvider extends ChangeNotifier {
  Token _token = Token(accessToken: "");

  Token get token => _token;

  void setToken(Map<String, dynamic> token) {
    _token = Token.fromJson(token);
    notifyListeners();
  }

  void setUserFromModel(Token token) {
    _token = token;
    notifyListeners();
  }
}
