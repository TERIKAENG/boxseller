import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonApp {
  static Widget buttonMain(
      BuildContext context, String title, GestureTapCallback onPressed) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: brownlight,
              border: Border.all(
                color: brownlight,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(
              child: TextWidget.textGeneralWithColor(title, Colors.white)),
        ));
  }

  static Widget buttonSecondary(
      BuildContext context, String title, GestureTapCallback onPressed) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(
              child: TextWidget.textGeneralWithColor(title, blueSelected)),
        ));
  }

  static Widget buttonOutline(
      BuildContext context, String title, GestureTapCallback onPressed) {
    return OutlinedButton(
        onPressed: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              // color: blueSelected,
              border: Border.all(
                color: blueSelected,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(
              child: TextWidget.textGeneralWithColor(title, blueSelected)),
        ));
  }

  static Widget buttonTest() {
    return // Figma Flutter Generator IconWidget - GROUP
        Container(
            width: 358,
            height: 53,
            child: Stack(children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 358,
                      height: 53,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                                width: 358,
                                height: 53,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.019999999552965164),
                                        offset: Offset(0, 3.499999761581421),
                                        blurRadius: 5.5)
                                  ],
                                  color: Color.fromRGBO(202, 158, 109, 1),
                                ))),
                        Positioned(
                            top: 9,
                            left: 131,
                            child: Text(
                              'เข้าสู่ระบบ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'ThaiSans Neue',
                                  fontSize: 30,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                      ]))),
            ]));
  }
}
