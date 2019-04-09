import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  final _firebaseProvider = Firestore.instance;
  setUserInfo(String userEmail) {
    _firebaseProvider.document("user-info/$userEmail").get().then((snapshot) {
      print("Email: $userEmail");
      if (snapshot.data != null) {
        print("${snapshot.data}");
      } else {
        _firebaseProvider.document("user-info/$userEmail").setData({
          "exams": [],
          "syllabus": [],
          "examCount": 0,
          "passed": 0,
          "failed": 0,
        });
      }
    });
  }

  Stream<QuerySnapshot> getCourses() {
    return _firebaseProvider.collection("courses").snapshots();
  }

  Stream<DocumentSnapshot> getSingleCourse(String id) {
    return _firebaseProvider.document("courses/$id").snapshots();
  }
}
