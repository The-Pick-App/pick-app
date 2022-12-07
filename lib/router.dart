import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pickapp/app/modules/home/home_screen.dart';
import 'package:pickapp/app/modules/login/login_screen.dart';
import 'package:pickapp/app/modules/register/register_screen.dart';
import 'package:pickapp/app/modules/welcome/welcome_screen.dart';

import 'package:routemaster/routemaster.dart';

final box = GetStorage();
final routes = RouteMap(routes: {
  '/': (_) => canUserAccessPage()
      ? const MaterialPage(child: HomeScreen())
      : const MaterialPage(child: WelcomeScreen()),
  '/login': (_) => const MaterialPage(child: LoginScreen()),
  '/register': (_) => const MaterialPage(child: RegisterScreen()),
  '/home': (_) => canUserAccessPage()
      ? const MaterialPage(child: HomeScreen())
      : const Redirect('/welcome'),
});

canUserAccessPage() {
  bool canAccess = false;
  var accessToken = box.read("accessToken");
  debugPrint('abbas: $accessToken');

  if (accessToken != null && accessToken != "") {
    canAccess = true;
  }
  return canAccess;
}
