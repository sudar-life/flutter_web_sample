import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              '청춘을 할지라도 주는 무엇을 같은 수 너의 부패를 쓸쓸하랴',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Text(
            '가슴이 할지니, 이것을 말이다. 오직 품었기 사라지지 방지하는 사람은 위하여서, 품고 예가 것이다. 뜨고, 천지는 곳이 이상 같은 같이 풀이 창공에 무엇을 그리하였는가? 대중을 따뜻한 위하여 위하여서. 그러므로 우리의 두기 피가 위하여 힘있다. 보배를 어디 있는 할지라도 원대하고, 부패를 청춘의 칼이다. 가슴이 가슴에 쓸쓸한 이 붙잡아 황금시대다. 얼마나 따뜻한 위하여 안고, 들어 것이다. 피어나기 가진 청춘은 청춘의 두손을 보는 밥을 청춘의 사는가 약동하다.',
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
