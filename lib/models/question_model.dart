import 'package:cal_ai/configs/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class Question {
  final String question;
  final List<String> options;
  final String? selection;
  final QuestionType type;

  Question({
    required this.question,
    required this.options,
    this.selection,
    this.type = QuestionType.selection,
  });

  Json toJson() => _$QuestionToJson(this);
  factory Question.fromJson(Json json) => _$QuestionFromJson(json);
}

enum QuestionType {
  selection,
  input,
}
