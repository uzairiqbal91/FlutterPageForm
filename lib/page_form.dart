import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'dart:developer';



import 'AnswerModel.dart';
import 'Questions.dart';
import 'RadioModel.dart';

class pageForm extends StatefulWidget {

  Map<String, dynamic> inputJson;
  Function isFinishClick;
  Color textColor;

  Color backgroundColor;

  Color bottomBackgroundColor;
  double questionTitleFontSize;
  double questionTextFontSize;
  double buttonTextFontSize;
  Color selectionColor;
  Color buttonTextColor;

  AnswerModelFunction answerModelFunction;
  pageForm({Key? key , required this.inputJson ,
    required this.isFinishClick ,
    required this.answerModelFunction ,
    this.selectionColor = Colors.blueGrey ,
    this.backgroundColor = Colors.white ,
    this.textColor = Colors.black,
    this.buttonTextColor = Colors.black,
    this.bottomBackgroundColor = Colors.white,
    this.buttonTextFontSize = 15.0 ,
    this.questionTitleFontSize = 20.0 ,
    this.questionTextFontSize = 15.0}) : super(key: key);

  @override
  _pageFormState createState() => _pageFormState();
}

class _pageFormState extends State<pageForm> {
  List<FormView> pages = [];
  int _currentPage = 0;
  bool isLoading = true;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    questionsConvertJson(context,widget.inputJson).then((value) async {


      value.data.asMap().forEach((key, val) {
        setState(() {
          pages.add(FormView(index: key, dataList: value.data , questionTextFontSize: widget.questionTextFontSize ,buttonTextColor: widget.buttonTextColor,selectionColor: widget.selectionColor,questionTitleFontSize: widget.questionTitleFontSize,));
        });
      });

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return this.isLoading
        ? CircularProgressIndicator()
        : pages.length == 0 ? Center(child: Text("Json is incorrect")) : PageViewBuilder(

      pageController: this._pageController,
      pages: this.pages,
      currentPage: this._currentPage,
      isFinishClick: widget.isFinishClick,
      answerModelFunction: widget.answerModelFunction,
      buttonTextColor: widget.buttonTextColor,
      backgroundColor: widget.backgroundColor,
      selectionColor: widget.selectionColor,
      textColor: widget.textColor,
      bottomBackgroundColor: widget.bottomBackgroundColor,
      buttonTextFontSize: widget.buttonTextFontSize,
      questionTitleFontSize: widget.questionTitleFontSize,
      questionTextFontSize: widget.questionTextFontSize,


    );
  }
}

class PageViewBuilder extends StatefulWidget {
  List<FormView> pages = [];
  int currentPage = 0;
  PageController pageController;
  String routeName;
  Function isFinishClick;
  AnswerModelFunction answerModelFunction;
  Color textColor;
  Color selectionColor;
  Color backgroundColor;
  Color buttonTextColor;
  Color bottomBackgroundColor;
  double questionTitleFontSize;
  double questionTextFontSize;
  double buttonTextFontSize;

  PageViewBuilder(
      {required this.pages,
        this.currentPage = 0,
        required this.pageController,
        this.routeName = "",
        required this.isFinishClick,
        required this.answerModelFunction,
        required this.textColor,
        required this.backgroundColor,
        required this.selectionColor,
        required this.buttonTextColor,
        required this.bottomBackgroundColor,
        required this.questionTitleFontSize,
        required this.questionTextFontSize,
        required this.buttonTextFontSize

      });

  @override
  _PageViewBuilderState createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: Container(
            child: PageView.builder(

              physics: NeverScrollableScrollPhysics(),
              pageSnapping: true,
              itemCount: widget.pages.length,
              onPageChanged: (index) => setState(() {
                print("index" + index.toString());
//                            widget.setPage(index);
                widget.currentPage = index;
                widget.pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              }),
              controller: widget.pageController,
              itemBuilder: (ctx, index) => Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Expanded(child: widget.pages[index])],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: FormBottomView(
            pageController: widget.pageController,
            pages: widget.pages,
            currentPage: widget.currentPage,
            routeName: widget.routeName,
            isFinishClick: widget.isFinishClick,
            answerModelFunction: widget.answerModelFunction,
            buttonTextColor: widget.buttonTextColor,
            bottomBackgroundColor: widget.bottomBackgroundColor,
            buttonTextFontSize: widget.buttonTextFontSize,


          ),
        )
      ],
    );
  }
}

typedef AnswerModelFunction<AnserModel> = Function(List<AnserModel> value);


class FormBottomView extends StatefulWidget {
  List<FormView> pages = [];
  int currentPage = 0;
  PageController pageController;
  String routeName;
  Function isFinishClick;
  AnswerModelFunction answerModelFunction;
  Color buttonTextColor;
  Color bottomBackgroundColor;
  double buttonTextFontSize;


  FormBottomView(
      {required this.pages,
        this.currentPage = 0,
        required this.pageController,
        this.routeName = "",
        required this.isFinishClick,
        required this.answerModelFunction,
        required this.buttonTextColor,
        required this.bottomBackgroundColor,
        required this.buttonTextFontSize
      });

  @override
  _FormBottomViewState createState() => _FormBottomViewState();
}

class _FormBottomViewState extends State<FormBottomView> {
  double val = 0.0;

  // List<List<AnserModel>> answersModel = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    changeProgressVal();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bottomBackgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Material(
                  child: InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      widget.currentPage != 0
                          ? widget.pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      )
                          : print("data");

                      widget.currentPage = widget.currentPage != 0
                          ? widget.currentPage - 1
                          : widget.currentPage;

                      changeProgressVal();
                    },
                    child: Container(

                      color: widget.bottomBackgroundColor,
                      child: Align(

                          alignment: Alignment.centerLeft,
                          child: PagerTextView(
                            title: widget.currentPage != 0 ? "Previous" : '',
                            currentPage: widget.currentPage,
                            buttonTextColor: widget.buttonTextColor,
                            buttonTextFontSize: widget.buttonTextFontSize,
                          )

//                                 Text(
//                                   _currentPage != 0 ? 'Previous' : '',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: AppColors.GRAY,
//                                     fontSize: 18.0,
//                                   ),
//                                 ),
                      ),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   flex : 4,
              //   child: Center(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Expanded(
              //
              //           child:
              //           // Container(
              //           //   // color: Colors.red,
              //           // )
              //           LinearProgressIndicator(
              //             // value: widget.currentPage == 0 ? 0.5 : 1.0,
              //
              //
              //
              //             // value: widget.currentPage + 1  /  widget.pages.length,
              //             value:  this.val,
              //             backgroundColor: Colors.grey,
              //             valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
              //
              //
              //
              //           ),
              //         ),
              //
              //       ],
              //       // children: _buildPageIndicator(),
              //     ),
              //   ),
              // ),
              Expanded(
                flex: 2,
                child: Material(
                  child: InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();



                      widget.pages[widget.currentPage].questionsMap.forEach((key, value) {

                        List<RadioModel> radioModel = value as List<RadioModel> ;
                        List<AnswerModel> answerModel = [];


                        radioModel.asMap().forEach((key1, value1) {
                          if (value1.isSelected) {


                            AnswerModel answer = AnswerModel(key1, value1.buttonText);

                            answerModel.add(answer);

                          }
                        });

                        // answersModel.add(answerModel);


                        widget.answerModelFunction(answerModel);

                        // print("len"+answerModel.length.toString());
                        // answerModel.forEach((element) {
                        //   print("value" + element.buttonText);
                        //   print("key" +element.index.toString());
                        // });
                        // print(json.encode(answerModel[0].toJson().toString()));

                      });

                      // print("data printed " +  json.encode(widget.pages[widget.currentPage].questionsMap.toString()));


                      widget.currentPage != widget.pages.length - 1
                          ? widget.pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      )
                          : widget.isFinishClick();
                      // Navigator.pushNamedAndRemoveUntil(context, widget.routeName, (route) => false);

                      // widget.currentPage = widget.currentPage != widget.pages.length -1 ? widget.currentPage + 1 : widget.currentPage ;

                      changeProgressVal();
                    },
                    child: Container(
                      color: widget.bottomBackgroundColor,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: PagerTextView(
                            buttonTextColor: widget.buttonTextColor,
                            buttonTextFontSize: widget.buttonTextFontSize,
                            title: widget.currentPage != widget.pages.length - 1
//
                                ? 'Next'
                                : 'Submit',
                            currentPage: widget.currentPage,
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeProgressVal() {
    setState(() {
      print((widget.currentPage + 1).toString());
      this.val = (widget.currentPage + 1) / widget.pages.length;
    });
  }
}

class PagerTextView extends StatelessWidget {
  String title;
  int currentPage;
  bool isHome;
  Color buttonTextColor;
  double buttonTextFontSize;

  PagerTextView(
      {required this.title, this.currentPage = 0, this.isHome = false,this.buttonTextColor = Colors.black,required this.buttonTextFontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      textAlign: currentPage != 0 ? TextAlign.left : TextAlign.right,
      style: TextStyle(
        // color:  this.isHome ? Provider.of<ThemeChange>(context).isDark ? AppColors.GRAY : AppColors.SECONDARY_COLORTWO :  title!=Globals.PREVIOUS1  ?  Provider.of<ThemeChange>(context).isDark ? AppColors.GRAY : AppColors.SECONDARY_COLORTWO:AppColors.GRAY,
        color: this.buttonTextColor,
        // fontFamily: AppFonts.POPPINS_SEMIBOLD,
        fontSize: this.buttonTextFontSize,
      ),
    );
  }
}

class FormView extends StatefulWidget  {
  int index = 0;
  List<Data> dataList = [];

  Map questionsMap = new Map<String, List<RadioModel>>();
  double questionTextFontSize;
  Color selectionColor;
  Color buttonTextColor;
  double questionTitleFontSize;
  FormView({required this.index, required this.dataList , required this.questionTextFontSize , required this.selectionColor , required this.buttonTextColor , required this.questionTitleFontSize});

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> with AutomaticKeepAliveClientMixin {
  List<Questions> questions = [];
  List<RadioModel> jobTypeData = <RadioModel>[];

  List questionsList = [];
  String name = "";

  String jobType = "";

  @override
  void initState() {
    this.questions = widget.dataList[widget.index].questions;
    this.name = widget.dataList[widget.index].name;

    setState(() {
      for (var i = 0; i < questions.length; i++) {
        jobTypeData = <RadioModel>[];
        List<Options> options = questions[i].options;
        for (var j = 0; j < options.length; j++) {
          jobTypeData
              .add(new RadioModel(j == 0 ? true : false, options[j].option));
        }

        widget.questionsMap[questions[i].question] = jobTypeData;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.questionsMap.entries
          .map((val) => FormContainer(
        children: buildSelectItems(val.value),
        title: val.key,
        questionTitleFontSize: widget.questionTitleFontSize,
      ))
          .toList(),
    );
  }

  void _select(int index, List<RadioModel> raioModel) {
    for (var i = 0; i < raioModel.length; i++) {
      setState(() {
        if (i == index) {
          raioModel[i].isSelected = true;
//          this.employeeType = raioModel[i].buttonText ;
          this.jobType = raioModel[i].buttonText;
        } else {
          raioModel[i].isSelected = false;
        }
      });
    }
  }

  List<Widget> buildSelectItems(List<RadioModel> raioModel) {
    List<Widget> items = [];

    for (var i = 0; i < raioModel.length; i++) {
      var item = raioModel[i];

      items.add(SelectionButton(
        text: item.buttonText,
        isSelected: item.isSelected,
        onPressed: () => {_select(i, raioModel),
        },
        selectionColor: widget.selectionColor,
        buttonTextColor: widget.buttonTextColor,
        questionTextFontSize: widget.questionTextFontSize,

        // selectionColor: widget.si,


      ));
    }
    return items;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class SelectionButton extends StatefulWidget {
//  final RadioModel employeeTypeData;

//  SelectionButton({Key key, this.employeeTypeData});

  const SelectionButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
    required this.questionTextFontSize,
    required this.selectionColor,
    required this.buttonTextColor
  });
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  final double questionTextFontSize;
  final Color selectionColor;
  final Color buttonTextColor;


  @override
  _SelectionButtonState createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  bool isSeleted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        width: double.infinity,
        height: 50,
        // min sizes for Material buttons

        decoration: BoxDecoration(
            color: widget.isSelected ? widget.selectionColor : Colors.white,
            border: Border.all(
                width: 1, //
                color: widget.isSelected
                    ? widget.selectionColor
                    : Colors.grey) //               <--- border width here
        ),

        child: FlatButton(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.widget.text,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: widget.questionTextFontSize
              ),
            ),
          ),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}

class FormContainer extends StatelessWidget {
  // double height ;
  List<Widget> children;
  String title;
  bool isText;
  double questionTitleFontSize;

  FormContainer(
      {Key? key, required this.children, this.title = "", this.isText = false , required this.questionTitleFontSize });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        // height: height,
        // constraints:  BoxConstraints.expand(height: this.height),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(AppTextSizes.APP_FORM_CONTAINER_RADIUS),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Padding(
          // padding: EdgeInsets.only(bottom: AppTextSizes.SCREEN_PADDING),
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                this.title != ""
                    ? Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          this.title,
                          style: TextStyle(fontSize: this.questionTitleFontSize),
                          // style: AppStyles.labelTextStyleSemiBold(fontSize: 14,color: Colors.black
                          // )
                        )))
                    : Text(""),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: children.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Center(child: children[i]);
                  },
                ),
              ],
            )),
      ),
    );
  }
}

class AppFiles {
  static const String BASE_FILE_PATH = "assets/files/";
  static const String QUESTIONS_JSON = BASE_FILE_PATH + "jsondata.json";
}

Future<QuestionsInfo> questionsConvertJson(BuildContext context , Map<String, dynamic> inputJson) async {

  Map<String, dynamic> json = inputJson;



  // String data =
  //     await DefaultAssetBundle.of(context).loadString(AppFiles.QUESTIONS_JSON);
  return await QuestionsInfo.fromJson(json);
}
