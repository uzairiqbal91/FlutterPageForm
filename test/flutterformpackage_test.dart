library flutterformpackage;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterformpackage/AnswerModel.dart';
import 'package:flutterformpackage/page_form.dart';


/// A Calculator.
class PageForm extends StatefulWidget {
  const PageForm({Key? key}) : super(key: key);

  @override
  _PageFormState createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  @override
  Widget build(BuildContext context) {
    return pageForm(
      inputJson: {
        "data": [
          {
            "questions": [
              {
                "question": "what are your sleeping preferences?",
                "options": [
                  {"option": "Morning"},
                  {"option": "Night"},
                  {"option": "Neither, It depends on the day"},
                  {"option": "Non, I work on off shift"}
                ]
              },
              {
                "question": "what are your sleeping preferenc?",
                "options": [
                  {"option": "Morning"},
                  {"option": "Night"},
                  {"option": "Neither, It depends on the day"},
                  {"option": "Non, I work on off shift"}
                ]
              },
              {
                "question": "what are your sleeping prefer?",
                "options": [
                  {"option": "Morning"},
                  {"option": "Night"},
                  {"option": "Neither, It depends on the day"},
                  {"option": "Non, I work on off shift"}
                ]
              }
            ]
          },
        ]
      },
      isFinishClick: () {
        print("finish callback");
      },
      answerModelFunction: (pageAnswers) {
        List<AnswerModel> answerModel = pageAnswers as List<AnswerModel>;

        answerModel.asMap().forEach((key, value) {
          print("index is " + value.selectedIndex.toString());
          print("value is " + value.buttonText);
        });
      },
        selectionColor: Colors.blueGrey,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      buttonTextColor: Colors.black,
      bottomBackgroundColor: Colors.white,
      buttonTextFontSize: 15.0 ,
      questionTitleFontSize: 20.0,
      questionTextFontSize: 15.0,

    );
  }
}