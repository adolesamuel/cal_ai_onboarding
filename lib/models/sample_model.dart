import 'package:cal_ai/models/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sample_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: HiveConstants.sampleId)
class SampleModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String phoneNumber;

  SampleModel({
    required this.name,
    required this.phoneNumber,
  });
}
