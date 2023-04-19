import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 2, color: Color(0xff4074FB))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/logo.png", height: 20),
            Row(
              children: [
                menu("홈", () {}),
                menu("등하원관리", () {}),
                menu("문서함", () {}),
                menu("나의정보", () {}),
                menu("관리자설정", () {}),
                menu("로그아웃", () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
