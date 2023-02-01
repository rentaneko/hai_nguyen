import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:hai_nguyen/@share/routes/pages.dart';
import 'package:hai_nguyen/@share/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: RoutesApp.route,
      debugShowCheckedModeBanner: false,
      initialRoute: ROUTE_LOGIN,
      builder: (_, child) => FlutterEasyLoading(child: child),
    );
  }
}
