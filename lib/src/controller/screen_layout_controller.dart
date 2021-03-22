import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ScreenSizeType { MOBILE, TABLET, DESKTOP }

class ScreenLayoutController extends GetxController {
  static ScreenLayoutController get to => Get.find();
  Rx<ScreenSizeType> screenType = ScreenSizeType.DESKTOP.obs;

  void builder(BoxConstraints constraints) {
    if (constraints.biggest.width <= 480) {
      screenType(ScreenSizeType.MOBILE);
    } else if (constraints.biggest.width > 480 &&
        constraints.biggest.width <= 768) {
      screenType(ScreenSizeType.TABLET);
    } else {
      screenType(ScreenSizeType.DESKTOP);
    }
  }
}
