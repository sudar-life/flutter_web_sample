import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_sample_02/src/controller/screen_layout_controller.dart';
import 'package:web_sample_02/src/pages/flutter_page.dart';
import 'package:web_sample_02/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(ScreenLayoutController());
      }),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => HomePage(),
        ),
        GetPage(
          name: "/flutter",
          page: () => FlutterPage(),
        )
      ],
    );
  }
}
