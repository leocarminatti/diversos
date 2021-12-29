import 'package:benchmark_millions/app/routes/app_pages.dart';
import 'package:benchmark_millions/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/network_binding.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: 'Bunker',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Colors.black,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.indigo[50],
      ),
      initialBinding: NetworkBinding(),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
