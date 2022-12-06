import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pickapp/router.dart';
import 'package:pickapp/theme/palette/pallette.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  await GetStorage.init();
  final getStorge = GetStorage();
  runApp(
    GetMaterialApp.router(
      title: 'Pick App',
      debugShowCheckedModeBanner: false,
      theme: Pallete.lightModeAppTheme,
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) {
          debugPrint("abbas: ${getStorge.read("accessToken")} ");
          if (getStorge.read("accessToken") != null &&
              getStorge.read("accessToken") != "") {
            return loggedInRoute;
          } else {
            return loggedOutRoute;
          }
        },
      ),
      routeInformationParser: const RoutemasterParser(),
    ),
  );
}
