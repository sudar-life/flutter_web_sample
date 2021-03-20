import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget();

  @override
  _SideMenuWidgetState createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _mainMenu("Flutter"),
          _subMenu("당근마켓 클론 코딩", () {}),
          _subMenu("Bloc 패턴", () {}),
          _subMenu("Provider 사용", () {}),
          _subMenu("Firebase Sns 로그인", () {}),
          _subMenu("GetX 설명", () {}),
        ],
      ),
    );
  }
}
