// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:project_alpha_app/src/data/course.dart';
// import 'package:project_alpha_app/src/resources/repository.dart';

// void main() {
//   final _repo = Repository();
//   testWidgets("testing streambuilders", (WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(
//       home: Center(
//         child: StreamBuilder<List<Course>>(
//           stream: _repo.getCourses(),
//           builder: (context, snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.none:
//                 return Text('Press a button to start');
//               case ConnectionState.waiting:
//                 return Center(child: CircularProgressIndicator());
//               default:
//                 if (snapshot.hasError) return Text('Error ${snapshot.error}');
//                 return Text('Data: ${snapshot.data.elementAt(0).courseTitle}');
//             }
//           },
//         ),
//       ),
//     ));
//     expect(find.text("Physics 101"), findsOneWidget);
//   });
// }
