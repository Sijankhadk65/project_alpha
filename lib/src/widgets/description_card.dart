import 'package:flutter/material.dart';

class DescriptionCard extends StatefulWidget {
  final String title;
  final Widget child;
  final bool isCard;
  final EdgeInsets margin;

  const DescriptionCard(
      {Key key,
      @required this.title,
      @required this.child,
      @required this.isCard,
      this.margin})
      : super(key: key);
  @override
  _DescriptionCardState createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: widget.isCard
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 3))
                ])
          : BoxDecoration(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: widget.isCard
                    ? BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0)))
                    : BoxDecoration(),
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "${widget.title}",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: "Oswald",
                            color: widget.isCard ? Colors.white : Colors.black,
                            shadows: [
                              BoxShadow(
                                  color: widget.isCard
                                      ? Color(0xFF3A0344)
                                      : Colors.transparent,
                                  offset: Offset(0, 3),
                                  blurRadius: 5.0)
                            ]),
                      ),
                    ),
                    widget.isCard
                        ? Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Icon(Icons.arrow_drop_down),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
            padding: widget.isCard ? EdgeInsets.all(8.0) : EdgeInsets.all(0),
            child: widget.child)
      ]),
    );
  }
}
