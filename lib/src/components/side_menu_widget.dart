import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:web_sample_02/src/controller/screen_layout_controller.dart';

class SideMenuWidget extends GetView<ScreenLayoutController> {
  SideMenuWidget();
  final ScrollController scrollController = ScrollController();

  Widget _mainMenu(String menu) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        menu,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Color getForegroundColor(Set<MaterialState> states) {
    const interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Widget _subMenu(String menu, GestureTapCallback onPressed) {
    return TextButton(
      style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.resolveWith(getForegroundColor),
          overlayColor: MaterialStateProperty.resolveWith(
            (state) => Colors.transparent,
          )),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          "- $menu",
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  Widget get sideMenu => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _mainMenu("Flutter"),
          _subMenu("당근마켓 클론 코딩", () {
            Get.toNamed("/flutter");
          }),
          _subMenu("Bloc 패턴", () {}),
          _subMenu("Provider 사용", () {}),
          _subMenu("Firebase Sns 로그인", () {}),
          _subMenu("GetX 설명", () {}),
        ],
      );

  Widget _mobileLayout() {
    return Container(
      width: Get.size.width * 0.7,
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: sideMenu,
        ),
      ),
    );
  }

  Widget _desktopLayout() {
    return Scrollbar(
      isAlwaysShown: false,
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          child: sideMenu,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (controller.screenType.value) {
      case ScreenSizeType.MOBILE:
        return _mobileLayout();
      case ScreenSizeType.TABLET:
        return _desktopLayout();
      case ScreenSizeType.DESKTOP:
      default:
        return _desktopLayout();
    }
  }
}
