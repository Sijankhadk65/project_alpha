import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_alpha_app/src/data/course.dart';
import 'package:project_alpha_app/src/resources/firebase_auth_provider.dart';
import 'package:project_alpha_app/src/resources/firebase_provider.dart';

class Repository {
  final _authRepository = FirebaseAuthProvider();
  final _firestoreRepository = FirestoreProvider();

  Stream<String> get onAuthStateChanged =>
      _authRepository.onAuthStateChanged.map((user) => user?.uid);
  Future<FirebaseUser> handleGoogleSignIn() =>
      _authRepository.handleSignIn().then((user) {
        _firestoreRepository.setUserInfo(user.email);
      });
  Stream<List<Course>> getCourses() =>
      _firestoreRepository.getCourses().transform(
          StreamTransformer<QuerySnapshot, List<Course>>.fromHandlers(
              handleData: (snapshots, sink) {
        List<Course> courses = [];
        snapshots.documents.forEach((snapshot) {
          courses.add(parseJsonToCourseModel(snapshot.data));
        });
        sink.add(courses);
      }));
  Stream<Course> getSingleCourse(String id) => _firestoreRepository
          .getSingleCourse(id)
          .transform(StreamTransformer<DocumentSnapshot, Course>.fromHandlers(
              handleData: (snapshot, sink) {
        sink.add(parseJsonToCourseModel(snapshot.data));
      }));
  Future<FirebaseUser> getCurrentUser() => _authRepository.getCurrentUser();
  void logout() => _authRepository.logout();
}
