import 'package:core/core/utilities/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/app_binding.dart';
import 'core/utilities/config/route_config.dart';

/*
 * This class is the root of the application.
 * It builds the GetMaterialApp widget that sets up the application's theme, initial route, and routes.
 * It also sets the title of the application.
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Builds the GetMaterialApp widget.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Supabase Auth",
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.lightThemeData,
      darkTheme: ThemeConfig.darkThemeData,
      initialRoute: AppRoutes.LOGIN,
      routes: getAppRoutes(context),
      initialBinding: AppBinding(),
    );
  }
}
