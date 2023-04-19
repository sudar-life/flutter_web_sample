import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Color(0xffE9EBEE),
        ),
        child: Text(
          "Copyright 2023 EOBUBA All Rights Reserved.",
          style: TextStyle(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
