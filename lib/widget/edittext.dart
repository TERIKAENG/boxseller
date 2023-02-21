import 'package:boxseller/widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../Utils/Palette.dart';

class Edittext {
  static Widget edittextGeneral(String title, String unit) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget.textSubTitle(title),
          const SizedBox(
            height: 3,
          ),
          Stack(
            children: [
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(width: 3, color: brownDark), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(width: 3, color: brownDark),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  height: 50,
                  alignment: Alignment.centerRight,
                  child: TextWidget.textGeneralWithColor(unit, Colors.grey)),
            ],
          )
        ],
      ),
    );
  }

  static Widget textAreaGeneral(String title, String unit) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget.textSubTitle(title),
          const SizedBox(
            height: 3,
          ),
          Stack(
            children: [
              TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(width: 3, color: brownDark), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(width: 3, color: brownDark),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  height: 50,
                  alignment: Alignment.centerRight,
                  child: TextWidget.textGeneralWithColor(unit, Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
