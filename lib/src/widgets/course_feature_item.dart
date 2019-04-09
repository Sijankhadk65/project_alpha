import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseFeatureitem extends StatelessWidget {
  final String feature;

  const CourseFeatureitem({Key key, @required this.feature}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 6.0, top: 5.0),
            child: SvgPicture.asset("assets/svg/bookmark.svg"),
            height: 15.0,
            width: 15.0,
          ),
          Expanded(
            child: Text(
              "$feature",
              style: TextStyle(fontFamily: "Poppins", color: Colors.black54),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
