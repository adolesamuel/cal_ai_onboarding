// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      selection: json['selection'] as String?,
      type: $enumDecodeNullable(_$QuestionTypeEnumMap, json['type']) ??
          QuestionType.selection,
      questions: $enumDecode(_$QuestionsEnumMap, json['questions']),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'selection': instance.selection,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'questions': _$QuestionsEnumMap[instance.questions]!,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.selection: 'selection',
  QuestionType.input: 'input',
};

const _$QuestionsEnumMap = {
  Questions.healthgoals: 'healthgoals',
  Questions.dietaryPreference: 'dietaryPreference',
  Questions.activitylevel: 'activitylevel',
  Questions.cookingFrequency: 'cookingFrequency',
  Questions.ageAndWeight: 'ageAndWeight',
};
