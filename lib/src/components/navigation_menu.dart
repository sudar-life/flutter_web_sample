import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_sample_02/src/controller/screen_layout_controller.dart';

class NavigationMenu extends GetView<ScreenLayoutController> {
  ScreenSizeType screenSizeType;
  NavigationMenu(this.screenSizeType);

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
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _menuGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        menu("홈", () {
          Get.toNamed("/");
        }),
        menu("블로그", () {
          launch("https://sudarlife.tistory.com/");
        }),
        menu("유튜브", () {
          launch("https://www.youtube.com/channel/UCbMGBIayK26L4VaFrs5jyBw");
        }),
      ],
    );
  }

  Widget _mobileLayout() {
    return Container(
      child: Column(
        children: [
          Image.asset("assets/images/logo.png", width: 80),
          SizedBox(height: 20),
          _menuGroup(),
        ],
      ),
    );
  }

  Widget _desktopLayout() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/logo.png", width: 80),
          _menuGroup(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (screenSizeType) {
      case ScreenSizeType.MOBILE:
        return _mobileLayout();
      case ScreenSizeType.TABLET:
        return _desktopLayout();
      case ScreenSizeType.DESKTOP:
        return _desktopLayout();
    }
  }
}
