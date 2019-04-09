import 'package:flutter/material.dart';
import 'package:project_alpha_app/src/widgets/comment.dart';
import 'package:project_alpha_app/src/widgets/description_card.dart';

class CommentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DescriptionCard(
      title: "Comments",
      isCard: false,
      child: Column(
        children: <Widget>[Comment(), Comment()],
      ),
    );
  }
}
