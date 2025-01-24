import 'package:cal_ai/configs/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class Question {
  final String question;
  final List<String> options;
  final String? selection;
  final Map<String, dynamic>? inputMap;
  final QuestionType type;
  final Questions questions;

  Question({
    required this.question,
    required this.options,
    this.selection,
    this.type = QuestionType.selection,
    required this.questions,
    this.inputMap,
  });

  Question copyWith(String? newSelection, Map<String, dynamic>? newInputMap) {
    return Question(
      question: question,
      options: options,
      questions: questions,
      selection: newSelection ?? selection,
      type: type,
      inputMap: newInputMap ?? inputMap,
    );
  }

  Json toJson() => _$QuestionToJson(this);
  factory Question.fromJson(Json json) => _$QuestionFromJson(json);
}

enum QuestionType {
  selection,
  input,
}

enum Questions {
  healthgoals,
  dietaryPreference,
  activitylevel,
  cookingFrequency,
  ageAndWeight,
}
