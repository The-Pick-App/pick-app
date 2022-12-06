// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    required this.accessToken,
  });

  String accessToken;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["accessToken"],
      );

  String toJson() => json.encode({
        "accessToken": accessToken,
      });
}
