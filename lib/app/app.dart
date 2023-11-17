import 'package:flutter/material.dart';

import '../presentation/resources/route_manager.dart';
import '../presentation/resources/theme_manager.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const instance = MyApp._internal(); //singleton instance
  factory MyApp() => instance;
  

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppThemeData(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
