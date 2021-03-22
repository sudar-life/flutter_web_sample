import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_sample_02/src/controller/screen_layout_controller.dart';
import 'dart:html' as html;

class NavigationMenu extends GetView<ScreenLayoutController> {
  const NavigationMenu();

  Widget menu(String menu, GestureTapCallback onTap) {
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          menu,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  List<Widget> get menus => [
        menu("홈", () {}),
        menu("블로그", () {
          html.window.open('https://sudarlife.tistory.com/', '');
        }),
        menu("유튜브", () {
          html.window.open(
              'https://www.youtube.com/channel/UCbMGBIayK26L4VaFrs5jyBw', '');
        }),
      ];

  Widget _mobileLayout() {
    return Column(
      children: [
        Image.asset("assets/images/logo.png", width: 60),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: menus,
        ),
      ],
    );
  }

  Widget _desktopLayout() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/logo.png", width: 80),
            Row(children: menus)
          ],
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
