import 'package:flutter/material.dart';
import 'package:pickapp/features/auth/screens/login_screen.dart';
import 'package:pickapp/features/auth/screens/register_screen.dart';
import 'package:pickapp/features/auth/screens/welcome_screen.dart';
import 'package:pickapp/features/auth/screens/demo_screen.dart';
import 'package:pickapp/features/home/screens/home_screen.dart';
import 'package:routemaster/routemaster.dart';

//If we have splash screen make '/' to spash screen
final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: WelcomeScreen()),
  '/login': (_) => const MaterialPage(child: LoginScreen()),
  '/register': (_) => const MaterialPage(child: RegisterScreen()),
  '/demo': (_) => const MaterialPage(child: DemoScreen()),
});
final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: DemoScreen()),
});
