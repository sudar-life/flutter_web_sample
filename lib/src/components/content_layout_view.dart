import 'package:flutter/material.dart';

class ContentLayoutView extends StatelessWidget {
  final Widget? contentWidget;
  final Widget? leftMenu;
  ContentLayoutView({this.contentWidget, this.leftMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: contentWidget,
            ),
          ),
          SizedBox(width: 50),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 150),
            child: Container(
              child: leftMenu,
            ),
          )
        ],
      ),
    );
  }
}
