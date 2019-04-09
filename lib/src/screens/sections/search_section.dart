import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_alpha_app/src/bloc/course_bloc.dart';
import 'package:project_alpha_app/src/data/course.dart';
import 'package:project_alpha_app/src/widgets/item_card.dart';

class SearchSection extends StatefulWidget {
  @override
  _SearchSectionState createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          SizedBox.fromSize(
            size: Size.fromHeight(50.0),
          ),
          Container(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: .0,
                  bottom: .0,
                  left: 10,
                  right: 5,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: StreamBuilder<String>(
                          stream: courseBloc.query,
                          builder: (context, snapshot) {
                            return TextField(
                              onChanged: courseBloc.changeQuery,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search items here."),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        FontAwesomeIcons.search,
                        size: 19.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          StreamBuilder<List<Course>>(
              stream: courseBloc.searchList,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Press a button to start');
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError)
                      return Text("Error: ${snapshot.error}");
                    if (!snapshot.hasData || snapshot.data.isEmpty)
                      return Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10.0, left: 10.0),
                          child: Text(
                            "Search for an item.",
                            style: TextStyle(
                                fontFamily: "Pacifico",
                                fontSize: 30.0,
                                color: Colors.grey),
                          ));
                    return ListView(
                      shrinkWrap: true,
                      children: snapshot.data
                          .map<Widget>((course) => ItemCard(
                                onSelected: (value) {},
                                key: Key(course.courseId),
                                course: course,
                              ))
                          .toList(),
                    );
                }
              })
        ],
      ),
    );
  }
}
