import 'package:flutter/material.dart';
import 'package:web_sample_02/src/components/footer.dart';
import 'package:web_sample_02/src/components/navigation_menu.dart';
import 'package:web_sample_02/src/components/side_menu_widget.dart';
import 'package:web_sample_02/src/pages/root_page.dart';

import 'components/content_layout_view.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              NavigationMenu(),
              Expanded(
                child: ContentLayoutView(
                  contentWidget: RootPage(),
                  leftMenu: SideMenuWidget(),
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
