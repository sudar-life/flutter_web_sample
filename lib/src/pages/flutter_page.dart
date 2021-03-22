import 'package:flutter/material.dart';
import 'package:web_sample_02/src/template/default_template.dart';

class FlutterPage extends StatelessWidget {
  FlutterPage();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTemplate(
        body: Scrollbar(
      isAlwaysShown: false,
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                color: Colors.black,
                child: Image.asset(
                  "assets/images/main.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  '[ flutter web ] 플러터 프로젝트를 웹과 애뮬레이터로 돌려보자~! / vscode 세팅법',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Text(
                "안녕하세요 개발하는 남자 개남입니다.flutter 2.0버전이 릴리즈 되었고 2.0에서 가장 큰 변화는 web을 지원하는 것이라고 생각합니다.그렇기 때문에 이번 포스팅에서 플러터를 웹으로 돌려보는 방법에 대해서 다뤄 보도록 하겠습니다.혹시 아직 flutter 2.0 업데이트를 주저하고 계신 분이 있다면 아래 링크를 통해 프로젝트별로 flutter 버전을 관리해보세요.",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
