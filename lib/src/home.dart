import 'package:flutter/material.dart';
import 'package:web_sample_02/src/common/screen_layout.dart';
import 'package:web_sample_02/src/components/footer.dart';
import 'package:web_sample_02/src/components/navigation_menu.dart';
import 'package:web_sample_02/src/components/side_menu_widget.dart';
import 'package:web_sample_02/src/pages/root_page.dart';

import 'components/content_layout_view.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  HomePage();

  Widget _desktopLayout() {
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

  Widget _mobileLayout() {
    return Scaffold(
      key: _key,
      drawer: SideMenuWidget(),
      body: Container(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: InkWell(
                      onTap: () {
                        _key.currentState!.openDrawer();
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Icon(Icons.menu),
                      ),
                    ),
                  ),
                  NavigationMenu(),
                ],
              ),
              Expanded(
                child: ContentLayoutView(
                  contentWidget: RootPage(),
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      mobile: _mobileLayout(),
      tablet: _desktopLayout(),
      desktop: _desktopLayout(),
    );
  }
}
