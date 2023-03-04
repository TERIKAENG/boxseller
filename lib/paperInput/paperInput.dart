import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widget/text_widget.dart';

class PaperInputPage extends StatefulWidget {
  const PaperInputPage({super.key});

  @override
  State<PaperInputPage> createState() => _PaperInputPageState();
}

class _PaperInputPageState extends State<PaperInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.fromLTRB(400, 50, 400, 50),
      child: ListView(
        children: [
          header(),
  
        ],
      ),
    )));
  }

  Widget header() {
    return TextWidget.textGeneral('รายการวัตถุดิบกระดาษ');
  }
}
