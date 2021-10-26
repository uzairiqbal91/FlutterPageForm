library flutterformpackage;

import 'package:flutter/cupertino.dart';
import 'package:flutterformpackage/page_form.dart';

import 'AnswerModel.dart';

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
    );
  }
}

