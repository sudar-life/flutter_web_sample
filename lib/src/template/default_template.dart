import 'package:flutter/material.dart';
import 'package:web_sample_02/src/components/content_layout_view.dart';
import 'package:web_sample_02/src/components/footer.dart';
import 'package:web_sample_02/src/components/navigation_menu.dart';
import 'package:web_sample_02/src/components/side_menu_widget.dart';
import 'package:web_sample_02/src/controller/screen_layout_controller.dart';

class DefaultTemplate extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  final Widget? body;
  DefaultTemplate({this.body});

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
                  contentWidget: body,
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
                  contentWidget: body,
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
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      ScreenLayoutController.to.builder(constraints);
      switch (ScreenLayoutController.to.screenType.value) {
        case ScreenSizeType.MOBILE:
          return _mobileLayout();
        case ScreenSizeType.TABLET:
          return _desktopLayout();
        case ScreenSizeType.DESKTOP:
        default:
          return _desktopLayout();
      }
    });
  }
}
