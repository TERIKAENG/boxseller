import 'package:boxseller/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/Palette.dart';

class Edittext {
  static Widget edittextGeneral(
      String title,
      String unit,
      Function(String)? onChanged,
      bool validate,
      TextEditingController controller) {
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
                controller: controller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  errorText: validate ? null : 'กรุณากรอก$title',
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(width: 3, color: brownDark), //<-- SEE HERE
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(width: 3, color: brownDark), //<-- SEE HERE
                  ),
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

  static Widget edittextNumber(
      String title,
      String unit,
      Function(String)? onChanged,
      bool validate,
      TextEditingController controller) {
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
                controller: controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                onChanged: onChanged,
                decoration: InputDecoration(
                  errorText: validate ? null : 'กรุณากรอก$title',
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(width: 3, color: brownDark), //<-- SEE HERE
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(width: 3, color: brownDark), //<-- SEE HERE
                  ),
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

  static Widget textAreaGeneral(
      String title,
      String unit,
      Function(String)? onChanged,
      bool validate,
      TextEditingController controller) {
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
                controller: controller,
                onChanged: onChanged,
                maxLines: 8,
                decoration: InputDecoration(
                  errorText: validate ? null : 'กรุณากรอก$title',
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(width: 3, color: brownDark), //<-- SEE HERE
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(width: 3, color: brownDark), //<-- SEE HERE
                  ),
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
