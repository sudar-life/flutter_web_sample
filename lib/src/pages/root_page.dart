import 'package:flutter/material.dart';
import 'package:web_sample_02/src/template/default_template.dart';

class RootPage extends StatelessWidget {
  RootPage();
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
                  "assets/images/title_thumbnail.png",
                  width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Text(
                '"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"',
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
