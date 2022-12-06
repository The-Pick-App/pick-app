import 'package:flutter/material.dart';
import 'package:pickapp/app/modules/home/home_screen.dart';
import 'package:pickapp/app/modules/login/login_screen.dart';
import 'package:pickapp/app/modules/register/register_screen.dart';
import 'package:pickapp/app/modules/welcome/welcome_screen.dart';

import 'package:routemaster/routemaster.dart';

//If we have splash screen make '/' to spash screen
final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: WelcomeScreen()),
  '/login': (_) => const MaterialPage(child: LoginScreen()),
  '/register': (_) => const MaterialPage(child: RegisterScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
});
