import 'package:flutter/material.dart';

class AnswerModel {

  int selectedIndex;
  String buttonText;


  AnswerModel(@required this.selectedIndex, @required this.buttonText);


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['selectedIndex'] = selectedIndex;
    _data['buttonText'] = buttonText;
    return _data;
  }

}