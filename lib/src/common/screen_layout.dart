import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  const ScreenLayout({this.mobile, this.tablet, this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.biggest.width <= 480) {
          return this.mobile ?? Container();
        }
        if (constraints.biggest.width > 480 &&
            constraints.biggest.width <= 768) {
          return this.tablet ?? Container();
        }
        return this.desktop ?? Container();
      },
    );
  }
}
