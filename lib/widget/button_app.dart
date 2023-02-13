import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonApp {
  static Widget buttonMain(BuildContext context,String title, GestureTapCallback onPressed) {
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

   static Widget buttonSecondary(BuildContext context,String title, GestureTapCallback onPressed) {
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


   static Widget buttonOutline
   (BuildContext context,String title, GestureTapCallback onPressed) {
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
}
