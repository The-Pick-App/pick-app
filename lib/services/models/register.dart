// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  String firstName;
  String lastName;
  String email;
  String password;
  String passwordConfirmation;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["passwordConfirmation"],
      );

  String toJson() => json.encode({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "passwordConfirmation": passwordConfirmation,
      });
}
