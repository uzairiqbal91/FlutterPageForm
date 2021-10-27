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
                "question": "what is your gender ?",
                "options": [
                  {"option": "Male"},
                  {"option": "Female"}
                ]
              },
              {
                "question": "Entomology is the science that studies?",
                "options": [
                  {"option": "Behavior of human beings"},
                  {"option": "Insects"},
                  {"option": "The origin and history of technical and scientific terms"},
                  {"option": "The formation of rocks"}
                ]
              },
              {
                "question": "Eritrea, which became the 182nd member of the UN in 1993, is in the continent of?",
                "options": [
                  {"option": "Asia"},
                  {"option": "Africa"},
                  {"option": "Europe"},
                  {"option": "Australia"}
                ]
              }
            ]
          },
          {
            "questions": [
              {
                "question": "Garampani sanctuary is located at ?",
                "options": [
                  {"option": "Junagarh, Gujarat"},
                  {"option": "Diphu, Assam"},
                  {"option": "Gangtok, Sikkim"},

                ]
              },
              {
                "question": "For which of the following disciplines is Nobel Prize awarded ?",
                "options": [
                  {"option": "Physics and Chemistry"},
                  {"option": "Physiology or Medicine"},
                  {"option": "Literature, Peace and Economics"},
                  {"option": "All of the above"}
                ]
              },
              {
                "question": "Hitler party which came into power in 1933 is known as ?",
                "options": [
                  {"option": "Labour Party"},
                  {"option": "Nazi Party"},
                  {"option": "Ku-Klux-Klan"},
                  {"option": "Democratic Party"}
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