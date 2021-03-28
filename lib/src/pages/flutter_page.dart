import 'package:flutter/material.dart';
import 'package:web_sample_02/src/pages/flutter_contents.dart';
import 'package:web_sample_02/src/template/default_template.dart';

class FlutterPage extends StatelessWidget {
  FlutterPage();

  @override
  Widget build(BuildContext context) {
    return DefaultTemplate(
      contents: FlutterContents(),
    );
  }
}
