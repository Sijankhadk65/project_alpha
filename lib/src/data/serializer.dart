library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/serializer.dart';
import 'package:project_alpha_app/src/data/course.dart';

part 'serializer.g.dart';

@SerializersFor(const [Course])
final Serializers serializers = _$serializers;
final standartJsonPluggedSerializer =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
