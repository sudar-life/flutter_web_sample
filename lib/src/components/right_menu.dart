import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RightMenu extends StatelessWidget {
  final double width;
  const RightMenu({this.width = 150});

  Color getForegroundColor(Set<MaterialState> states) {
    const interactiveStates = <MaterialState>{
      MaterialState.hovered,
      MaterialState.pressed,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return Colors.black;
  }

  EdgeInsets getPadding(Set<MaterialState> states) {
    const interactiveStates = <MaterialState>{
      MaterialState.hovered,
    };
    if (states.any(interactiveStates.contains)) {
      return EdgeInsets.only(left: 15);
    }
    return EdgeInsets.all(0);
  }

  Widget _sideMenu(String menuName, VoidCallback onPressed) {
    return TextButton(
      style: ButtonStyle(
          alignment: Alignment.centerLeft,
          padding: MaterialStateProperty.resolveWith(getPadding),
          foregroundColor:
              MaterialStateProperty.resolveWith(getForegroundColor),
          overlayColor:
              MaterialStateProperty.resolveWith((state) => Colors.transparent)),
      onPressed: onPressed,
      child: Text(
        menuName,
        style: TextStyle(fontSize: 13),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "대 메뉴",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          _sideMenu("메뉴1", () {
            Get.toNamed("/flutter");
          }),
          _sideMenu("메뉴2", () {}),
          _sideMenu("메뉴3", () {}),
          _sideMenu("메뉴4", () {}),
          _sideMenu("메뉴5", () {}),
          _sideMenu("메뉴6", () {}),
        ],
      ),
    );
  }
}
