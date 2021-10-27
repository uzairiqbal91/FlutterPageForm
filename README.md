
# Flutter Form

The easy way to develop form application in Flutter.

<img src="https://github.com/uzairiqbal91/FlutterPageForm/blob/main/asset/file.gif" />

## Getting Started

Add dependency to your flutter project:

```
$ flutter pub add flutterformpackage
```

or

```yaml
dependencies:
  flutterformpackage: ^0.0.3
```

Then run `flutter pub get`.


## Usage

```dart
import 'package:flutterformpackage/flutterformpackage.dart';
```

Call the widget and put questions in json form and make sure json is valid , it will return finish call back when finish button click , also it will return answer model of each page .

```dart
pageForm(
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
```

## Example

Learn more from example project [here](example).

# License

    Copyright 2021 Muhammad Uzair

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
