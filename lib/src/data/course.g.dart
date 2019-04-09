// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Course> _$courseSerializer = new _$CourseSerializer();

class _$CourseSerializer implements StructuredSerializer<Course> {
  @override
  final Iterable<Type> types = const [Course, _$Course];
  @override
  final String wireName = 'Course';

  @override
  Iterable serialize(Serializers serializers, Course object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'features',
      serializers.serialize(object.features,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    if (object.courseId != null) {
      result
        ..add('courseId')
        ..add(serializers.serialize(object.courseId,
            specifiedType: const FullType(String)));
    }
    if (object.courseTitle != null) {
      result
        ..add('courseTitle')
        ..add(serializers.serialize(object.courseTitle,
            specifiedType: const FullType(String)));
    }
    if (object.creatorName != null) {
      result
        ..add('creatorName')
        ..add(serializers.serialize(object.creatorName,
            specifiedType: const FullType(String)));
    }
    if (object.customerRating != null) {
      result
        ..add('customerRating')
        ..add(serializers.serialize(object.customerRating,
            specifiedType: const FullType(double)));
    }
    if (object.featureDescription != null) {
      result
        ..add('featureDescription')
        ..add(serializers.serialize(object.featureDescription,
            specifiedType: const FullType(String)));
    }
    if (object.infoDescription != null) {
      result
        ..add('infoDescription')
        ..add(serializers.serialize(object.infoDescription,
            specifiedType: const FullType(String)));
    }
    if (object.photoUrl != null) {
      result
        ..add('photoUrl')
        ..add(serializers.serialize(object.photoUrl,
            specifiedType: const FullType(String)));
    }
    if (object.price != null) {
      result
        ..add('price')
        ..add(serializers.serialize(object.price,
            specifiedType: const FullType(int)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Course deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CourseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'courseId':
          result.courseId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'courseTitle':
          result.courseTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'creatorName':
          result.creatorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerRating':
          result.customerRating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'featureDescription':
          result.featureDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'infoDescription':
          result.infoDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'features':
          result.features.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$Course extends Course {
  @override
  final String courseId;
  @override
  final String courseTitle;
  @override
  final String creatorName;
  @override
  final double customerRating;
  @override
  final String featureDescription;
  @override
  final String infoDescription;
  @override
  final String photoUrl;
  @override
  final int price;
  @override
  final String type;
  @override
  final BuiltList<String> features;

  factory _$Course([void updates(CourseBuilder b)]) =>
      (new CourseBuilder()..update(updates)).build();

  _$Course._(
      {this.courseId,
      this.courseTitle,
      this.creatorName,
      this.customerRating,
      this.featureDescription,
      this.infoDescription,
      this.photoUrl,
      this.price,
      this.type,
      this.features})
      : super._() {
    if (features == null) {
      throw new BuiltValueNullFieldError('Course', 'features');
    }
  }

  @override
  Course rebuild(void updates(CourseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseBuilder toBuilder() => new CourseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Course &&
        courseId == other.courseId &&
        courseTitle == other.courseTitle &&
        creatorName == other.creatorName &&
        customerRating == other.customerRating &&
        featureDescription == other.featureDescription &&
        infoDescription == other.infoDescription &&
        photoUrl == other.photoUrl &&
        price == other.price &&
        type == other.type &&
        features == other.features;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, courseId.hashCode),
                                        courseTitle.hashCode),
                                    creatorName.hashCode),
                                customerRating.hashCode),
                            featureDescription.hashCode),
                        infoDescription.hashCode),
                    photoUrl.hashCode),
                price.hashCode),
            type.hashCode),
        features.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Course')
          ..add('courseId', courseId)
          ..add('courseTitle', courseTitle)
          ..add('creatorName', creatorName)
          ..add('customerRating', customerRating)
          ..add('featureDescription', featureDescription)
          ..add('infoDescription', infoDescription)
          ..add('photoUrl', photoUrl)
          ..add('price', price)
          ..add('type', type)
          ..add('features', features))
        .toString();
  }
}

class CourseBuilder implements Builder<Course, CourseBuilder> {
  _$Course _$v;

  String _courseId;
  String get courseId => _$this._courseId;
  set courseId(String courseId) => _$this._courseId = courseId;

  String _courseTitle;
  String get courseTitle => _$this._courseTitle;
  set courseTitle(String courseTitle) => _$this._courseTitle = courseTitle;

  String _creatorName;
  String get creatorName => _$this._creatorName;
  set creatorName(String creatorName) => _$this._creatorName = creatorName;

  double _customerRating;
  double get customerRating => _$this._customerRating;
  set customerRating(double customerRating) =>
      _$this._customerRating = customerRating;

  String _featureDescription;
  String get featureDescription => _$this._featureDescription;
  set featureDescription(String featureDescription) =>
      _$this._featureDescription = featureDescription;

  String _infoDescription;
  String get infoDescription => _$this._infoDescription;
  set infoDescription(String infoDescription) =>
      _$this._infoDescription = infoDescription;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  int _price;
  int get price => _$this._price;
  set price(int price) => _$this._price = price;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  ListBuilder<String> _features;
  ListBuilder<String> get features =>
      _$this._features ??= new ListBuilder<String>();
  set features(ListBuilder<String> features) => _$this._features = features;

  CourseBuilder();

  CourseBuilder get _$this {
    if (_$v != null) {
      _courseId = _$v.courseId;
      _courseTitle = _$v.courseTitle;
      _creatorName = _$v.creatorName;
      _customerRating = _$v.customerRating;
      _featureDescription = _$v.featureDescription;
      _infoDescription = _$v.infoDescription;
      _photoUrl = _$v.photoUrl;
      _price = _$v.price;
      _type = _$v.type;
      _features = _$v.features?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Course other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Course;
  }

  @override
  void update(void updates(CourseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Course build() {
    _$Course _$result;
    try {
      _$result = _$v ??
          new _$Course._(
              courseId: courseId,
              courseTitle: courseTitle,
              creatorName: creatorName,
              customerRating: customerRating,
              featureDescription: featureDescription,
              infoDescription: infoDescription,
              photoUrl: photoUrl,
              price: price,
              type: type,
              features: features.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'features';
        features.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Course', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
