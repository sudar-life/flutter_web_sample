import 'package:flutter/material.dart';
import 'package:web_sample_02/src/components/right_menu.dart';
import 'package:web_sample_02/src/controller/screen_layout_controller.dart';

class FlutterContents extends StatelessWidget {
  final ScreenSizeType screenSizeType;
  FlutterContents(this.screenSizeType);
  final ScrollController scrollController = ScrollController();

  Widget _contentsDetail() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '[ flutter web ] 플러터 프로젝트를 웹과 애뮬레이터로 돌려보자~! / vscode 세팅법',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: screenSizeType == ScreenSizeType.MOBILE
                  ? TextAlign.center
                  : TextAlign.left,
            ),
            SizedBox(height: 15),
            Text(
              '여기서 만일 위 이미지처럼 Chrome (web) 이 리스트에서 보인다면 설정할 필요가 없이 바로 이용이 가능한 상태입니다.Web 디바이스가 없다라면 계속 이어서 설정해주시면 됩니다.플러터 디바이스에 web을 추가하기 위해서는 web 설정을 활성화시켜줘야 합니다.',
              style: TextStyle(fontSize: 14),
              textAlign: screenSizeType == ScreenSizeType.MOBILE
                  ? TextAlign.center
                  : TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _contents({bool hasScroll = true}) {
    if (!hasScroll) {
      return _contentsDetail();
    } else {
      return Scrollbar(
        isAlwaysShown: true,
        controller: scrollController,
        child: _contentsDetail(),
      );
    }
  }

  Widget _mobileLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _contents(hasScroll: false)),
        ],
      ),
    );
  }

  Widget _tabletLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _contents()),
          RightMenu(width: 100),
        ],
      ),
    );
  }

  Widget _desktopLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: _contents()), RightMenu()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (screenSizeType) {
      case ScreenSizeType.MOBILE:
        return _mobileLayout();
      case ScreenSizeType.TABLET:
        return _tabletLayout();
      case ScreenSizeType.DESKTOP:
        return _desktopLayout();
    }
  }
}
