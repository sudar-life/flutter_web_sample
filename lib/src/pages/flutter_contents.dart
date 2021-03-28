import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_sample_02/src/controller/screen_layout_controller.dart';

class FlutterContents extends GetView<ScreenLayoutController> {
  FlutterContents();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Obx(
          () => Padding(
            padding: controller.type.value == ScreenSizeType.MOBILE
                ? const EdgeInsets.all(15)
                : const EdgeInsets.only(right: 20.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '[ flutter web ] 플러터 프로젝트를 웹과 애뮬레이터로 돌려보자~! / vscode 세팅법',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: controller.type.value == ScreenSizeType.MOBILE
                      ? TextAlign.center
                      : TextAlign.left,
                ),
                SizedBox(height: 15),
                Text(
                  '여기서 만일 위 이미지처럼 Chrome (web) 이 리스트에서 보인다면 설정할 필요가 없이 바로 이용이 가능한 상태입니다.Web 디바이스가 없다라면 계속 이어서 설정해주시면 됩니다.플러터 디바이스에 web을 추가하기 위해서는 web 설정을 활성화시켜줘야 합니다.',
                  style: TextStyle(fontSize: 14),
                  textAlign: controller.type.value == ScreenSizeType.MOBILE
                      ? TextAlign.center
                      : TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
