import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pickapp/services/models/login.dart';
import 'package:pickapp/services/models/register.dart';
import 'package:pickapp/utils/utils.dart';
import 'package:routemaster/routemaster.dart';

class AuthService {
  final getStorge = GetStorage();

  void registerUser({
    required BuildContext context,
    required Register registerData,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
            'https://pickapp-backend-production.up.railway.app/api/users'),
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
        Uri.parse(
            'https://pickapp-backend-production.up.railway.app/api/sessions'),
        body: loginData.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          getStorge.write(
            "accessToken",
            jsonDecode(response.body)['accessToken'],
          );
          Routemaster.of(context).replace('/home');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }

  void logout({required BuildContext context}) {
    getStorge.remove('accessToken');
    Routemaster.of(context).replace('/');
  }
}
