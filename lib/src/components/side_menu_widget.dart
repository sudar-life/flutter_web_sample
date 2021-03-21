import 'package:flutter/material.dart';
import 'package:web_sample_02/src/common/screen_layout.dart';
import 'package:web_sample_02/src/pages/flutter_page.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget();

  @override
  _SideMenuWidgetState createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
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
          _subMenu("당근마켓 클론 코딩", () {}),
          _subMenu("Bloc 패턴", () {}),
          _subMenu("Provider 사용", () {}),
          _subMenu("Firebase Sns 로그인", () {}),
          _subMenu("GetX 설명", () {}),
        ],
      );

  Widget _mobileLayout() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
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
    return ScreenLayout(
      mobile: _mobileLayout(),
      tablet: _desktopLayout(),
      desktop: _desktopLayout(),
    );
  }
}
