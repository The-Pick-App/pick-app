import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pickapp/models/login.dart';
import 'package:pickapp/models/register.dart';
import 'package:pickapp/utils/utils.dart';
import 'package:routemaster/routemaster.dart';

class AuthService {
  void registerUser({
    required BuildContext context,
    required Register registerData,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://10.0.2.2:8081/api/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: registerData.toJson(),
      );

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
            Colors.green,
          );
          Routemaster.of(context).push('/login');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }

  void loginUser({
    required BuildContext context,
    required Login loginData,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://10.0.2.2:8081/api/sessions'),
        body: loginData.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // tokenProvider.setToken(jsonDecode(response.body));
          // await prefs.setString(
          //     'x-auth-token', jsonDecode(response.body)['accessToken']);
          // ignore: use_build_context_synchronously
          Routemaster.of(context).replace('/');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }
}
