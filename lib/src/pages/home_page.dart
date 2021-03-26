import 'package:flutter/material.dart';
import 'package:web_sample_02/src/controller/screen_layout_controller.dart';
import 'package:web_sample_02/src/pages/root_contents.dart';
import 'package:web_sample_02/src/template/default_template.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return DefaultTemplate(
      contents: RootContents(ScreenLayoutController.to.type.value!),
    );
  }
}
