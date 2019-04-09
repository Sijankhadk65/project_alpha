import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import './serializer.dart';
part 'course.g.dart';

abstract class Course implements Built<Course, CourseBuilder> {
  @nullable
  String get courseId;
  @nullable
  String get courseTitle;
  @nullable
  String get creatorName;
  @nullable
  double get customerRating;
  @nullable
  String get featureDescription;
  @nullable
  String get infoDescription;
  @nullable
  String get photoUrl;
  @nullable
  int get price;
  @nullable
  String get type;
  BuiltList<String> get features;
  Course._();
  factory Course([updates(CourseBuilder b)]) = _$Course;
  static Serializer<Course> get serializer => _$courseSerializer;
}

Course parseJsonToCourseModel(Map<String, dynamic> json) {
  return standartJsonPluggedSerializer.deserializeWith(Course.serializer, json);
}
