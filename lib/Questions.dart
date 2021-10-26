class QuestionsInfo {
  QuestionsInfo({
    required this.data,
  });
  late final List<Data> data;

  QuestionsInfo.fromJson(Map<String, dynamic> json){

    if (json['data'] == null) {
      data = [];
    }
    else
      {
        data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
      }

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.name,
    required this.shortName,
    required this.questions,
  });
  late final String name;
  late final String shortName;
  late final List<Questions> questions;

  Data.fromJson(Map<String, dynamic> json){
    name = json['name'] == null ? "" : json['name'] ;
    shortName = json['short_name'] == null ? "" : json['short_name'];

    if(json['questions'] == null)
      {
        questions = [];
      }
    else
      {
        questions = List.from(json['questions']).map((e)=>Questions.fromJson(e)).toList();
      }


  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['short_name'] = shortName;
    _data['questions'] = questions.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Questions {
  Questions({
    required this.question,
    required this.isMultiple,
    required this.options,
  });
  late final String question;
  late final bool isMultiple;
  late final List<Options> options;

  Questions.fromJson(Map<String, dynamic> json){

    if (json['question'] != null) {
      question = json['question'] ;
    }

    if (json['is_multiple'] != null) {
      isMultiple = json['is_multiple'];
    }

    if (json['options'] != null) {
      options = List.from(json['options']).map((e)=>Options.fromJson(e)).toList();
    }



  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['question'] = question;
    _data['is_multiple'] = isMultiple;
    _data['options'] = options.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Options {
  Options({
    required this.option,
  });
  late final String option;

  Options.fromJson(Map<String, dynamic> json){
    option = json['option'] == null ? "" : json['option'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['option'] = option;
    return _data;
  }
}