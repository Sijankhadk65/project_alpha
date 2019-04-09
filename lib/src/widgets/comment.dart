import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 7.5, bottom: 7.5),
            padding: EdgeInsets.only(left: 40.0, right: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "John Doe",
                      style: TextStyle(
                          fontFamily: "Oswald",
                          fontSize: 17.0,
                          color: Colors.deepPurple),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: SmoothStarRating(
                          allowHalfRating: false,
                          rating: 4,
                          size: 15,
                          color: Color(0xFFDFC90B),
                          borderColor: Color(0xFFDFC90B),
                        ),
                      ),
                    ),
                    Container(child: Icon(Icons.arrow_drop_down)),
                  ],
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12.0,
                      color: Colors.grey[400]),
                )
              ],
            ),
          ),
          Positioned(
            top: 25,
            left: 2,
            child: Container(
              height: 40.0,
              width: 40.0,
              child: Material(
                color: Colors.grey[200],
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                elevation: 5.0,
                child: Icon(Icons.face),
              ),
            ),
          )
        ],
      ),
    );
  }
}
