import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CommentUploader extends StatefulWidget {
  @override
  _CommentUploaderState createState() => _CommentUploaderState();
}

class _CommentUploaderState extends State<CommentUploader> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Comment",
              labelStyle: TextStyle(fontFamily: "Oswald"),
              hintText: "Enter your comment here.",
              hintStyle: TextStyle(fontFamily: "Poppins"),
            ),
            maxLines: 5,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: SmoothStarRating(
                allowHalfRating: true,
                onRatingChanged: (v) {
                  _rating = v;
                  setState(() {});
                },
                starCount: 5,
                rating: _rating,
                size: 30.0,
                color: Color(0xFFDFC90B),
                borderColor: Color(0xFFDFC90B),
              )),
              RaisedButton(
                color: Theme.of(context).primaryColorDark,
                onPressed: () {},
                child: Text(
                  "Send Comment",
                  style: TextStyle(color: Colors.white, fontFamily: "Oswald"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
