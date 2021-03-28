import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_sample_02/src/components/footer.dart';
import 'package:web_sample_02/src/components/navigation_menu.dart';
import 'package:web_sample_02/src/components/right_menu.dart';
import 'package:web_sample_02/src/controller/screen_layout_controller.dart';

class DefaultTemplate extends StatelessWidget {
  Widget? contents;
  DefaultTemplate({this.contents});
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  Widget _contentView() {
    List<Widget> list = [contents!];
    if (ScreenLayoutController.to.type.value != ScreenSizeType.MOBILE) {
      list.add(RightMenu(
          width: ScreenLayoutController.to.type.value == ScreenSizeType.TABLET
              ? 100
              : 150));
    }
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: list);
  }

  Widget _body() {
    return Container(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280),
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    _key.currentState?.openDrawer();
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Icon(Icons.menu),
                  ),
                ),
                NavigationMenu(ScreenLayoutController.to.type.value!),
              ],
            ),
            Expanded(child: _contentView()),
            Placeholder(
              fallbackHeight: 150,
              fallbackWidth: double.infinity,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _layout({bool hasDrawer = false}) {
    return Scaffold(
      key: _key,
      drawer: hasDrawer
          ? Container(
              width: Get.size.width * 0.7,
              color: Colors.white,
              child: Container(
                  margin: const EdgeInsets.only(top: 50, left: 20),
                  child: RightMenu()),
            )
          : null,
      body: _body(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            ScreenLayoutController.to.builder(constraints);
            return Container();
          },
        ),
        Obx(() {
          switch (ScreenLayoutController.to.type.value) {
            case ScreenSizeType.MOBILE:
              return _layout(hasDrawer: true);
            case ScreenSizeType.TABLET:
            case ScreenSizeType.DESKTOP:
            default:
              return _layout();
          }
        }),
      ],
    );
  }
}
