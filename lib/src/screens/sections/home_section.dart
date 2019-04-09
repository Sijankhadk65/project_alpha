import 'package:flutter/material.dart';

import 'package:project_alpha_app/src/bloc/course_bloc.dart';
import 'package:project_alpha_app/src/bloc/item_action.dart';
import 'package:project_alpha_app/src/data/course.dart';
import 'package:project_alpha_app/src/widgets/item_card.dart';

class HomeSection extends StatefulWidget {
  final String title;

  const HomeSection({Key key, this.title}) : super(key: key);
  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  void dispose() {
    super.dispose();
    courseBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
          style: TextStyle(fontFamily: "Pacifico", fontSize: 27.0, shadows: [
            Shadow(
                color: Color(0xFF3A0344), blurRadius: 8.0, offset: Offset(0, 5))
          ]),
        )),
        elevation: 5.0,
      ),
      body: Container(
        child: Center(
          child: StreamBuilder<List<Course>>(
            stream: courseBloc.courses,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press a button to start');
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) return Text('Error ${snapshot.error}');
                  if (!snapshot.hasData)
                    return Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.grey);
                  return ListView(
                    children: snapshot.data
                        .map((course) => ItemCard(
                              course: course,
                              onSelected: (ItemAction result) {
                                if (result == ItemAction.addToCart) {}
                              },
                            ))
                        .toList(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
