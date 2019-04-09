import 'package:project_alpha_app/src/data/course.dart';
import 'package:project_alpha_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

import "./bloc_base.dart";

class CourseBloc extends BlocBase {
  final _repo = Repository();
  var _courses = [];
  final _coursesSubject = BehaviorSubject<List<Course>>();
  Function(List<Course>) get changecourses => _coursesSubject.sink.add;
  Stream<List<Course>> get courses => _coursesSubject.stream;

  final _querySubject = ReplaySubject<String>();
  Function(String) get changeQuery => _querySubject.sink.add;
  Stream<String> get query => _querySubject.stream;

  Stream<List<Course>> _searchList = Stream.empty();
  Stream get searchList => _searchList;

  CourseBloc() {
    _repo.getCourses().listen((courses) {
      changecourses(courses);
      _courses = courses;
      _searchList =
          _querySubject.distinct().map(searhForCourses).asBroadcastStream();
    });
  }

  @override
  void dispose() {
    _coursesSubject.close();
    _querySubject.close();
  }

  List<Course> searhForCourses(String pattern) {
    print("Pattern: ${pattern.isEmpty}");
    return pattern.isNotEmpty
        ? _courses
            .where((course) => course.courseTitle
                .toLowerCase()
                .contains(pattern.toLowerCase()))
            .toList()
        : <Course>[];
  }
}

final courseBloc = CourseBloc();
