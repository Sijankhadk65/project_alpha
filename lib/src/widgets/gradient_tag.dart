import 'package:flutter/material.dart';

class GradientTag extends StatelessWidget {
  final String info, fontName;
  final FontWeight fontWeight;
  final List<Color> colors;

  const GradientTag(
      {Key key,
      @required this.info,
      @required this.colors,
      @required this.fontName,
      @required this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors),
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 2.0))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
        child: Text(
          "$info",
          style: TextStyle(
              color: Colors.white,
              fontWeight: fontWeight,
              fontSize: 12,
              fontFamily: "$fontName"),
        ),
      ),
    );
  }
}
