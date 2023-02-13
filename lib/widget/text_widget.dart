import 'package:flutter/material.dart';

class TextWidget {

  static Widget textGeneral(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    );
  }

    static Widget textGeneralWithColor(String title,Color color) {
    return Text(
      title,
      style:  TextStyle(
        fontSize: 16,
        // fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }





static Widget textTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    );
  }

  static Widget textTitleWithColor(String title,Color color) {
    return Text(
      title,
      style:  TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
      ),
    );
  }

static Widget textSubTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    );
  }


}
