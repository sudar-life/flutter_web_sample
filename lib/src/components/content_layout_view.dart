import 'package:flutter/material.dart';

class ContentLayoutView extends StatelessWidget {
  final Widget? contentWidget;
  final Widget? leftMenu;
  ContentLayoutView({this.contentWidget, this.leftMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Color(0xffF8F9FA),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(129, 211, 213, 216),
              blurRadius: 4,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 150),
                child: Container(
                  child: leftMenu,
                ),
              ),
              SizedBox(width: 50),
              Expanded(
                child: Container(
                  child: contentWidget,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
