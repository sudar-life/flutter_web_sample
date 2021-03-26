import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ScreenSizeType { MOBILE, TABLET, DESKTOP }

class ScreenLayoutController extends GetxController {
  static ScreenLayoutController get to => Get.find();
  Rx<ScreenSizeType> _screenType = ScreenSizeType.DESKTOP.obs;
  Rx<ScreenSizeType> type = ScreenSizeType.DESKTOP.obs;

  @override
  void onInit() {
    debounce(_screenType, (_) {
      type(_screenType.value);
    }, time: Duration(milliseconds: 200));
    super.onInit();
  }

  void builder(BoxConstraints constraints) {
    if (constraints.biggest.width <= 480) {
      _screenType(ScreenSizeType.MOBILE);
    } else if (constraints.biggest.width > 480 &&
        constraints.biggest.width < 768) {
      _screenType(ScreenSizeType.TABLET);
    } else {
      _screenType(ScreenSizeType.DESKTOP);
    }
  }
}
