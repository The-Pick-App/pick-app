import 'package:flutter/material.dart';
import 'package:pickapp/app/modules/home/home_screen.dart';
import 'package:pickapp/app/modules/login/login_screen.dart';
import 'package:pickapp/app/modules/register/register_screen.dart';
import 'package:pickapp/app/modules/splash/splash_screen.dart';
import 'package:pickapp/app/modules/welcome/welcome_screen.dart';

import 'package:routemaster/routemaster.dart';

final routes = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: SplashScreen()),
  '/welcome': (_) => const MaterialPage(child: WelcomeScreen()),
  '/login': (_) => const MaterialPage(child: LoginScreen()),
  '/register': (_) => const MaterialPage(child: RegisterScreen()),
  '/home': (_) => canUserAccessPage()
      ? const MaterialPage(child: HomeScreen())
      : const Redirect('/welcome'),
});

canUserAccessPage() {
  return false;
}
