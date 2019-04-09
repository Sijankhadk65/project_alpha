import 'package:flutter/material.dart';
import 'package:project_alpha_app/src/data/course.dart';
import 'package:project_alpha_app/src/screens/course_detail_screen.dart';
import 'package:project_alpha_app/src/widgets/gradient_tag.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:project_alpha_app/src/bloc/item_action.dart';

class ItemCard extends StatelessWidget {
  // final String assetUri, courseTitle, courseDescription, courseId, creatorName;
  // final int amount;
  // final double customerRating;
  final Function(ItemAction) onSelected;
  final Course course;

  const ItemCard({Key key, @required this.onSelected, this.course})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 15, left: 6, right: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 10.0, offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0))),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CourseDetailScreen(
                        features: course.features.asList(),
                        assetUri: course.photoUrl,
                        courseTitle: course.courseTitle,
                        courseId: course.courseId,
                        creatorName: course.creatorName,
                        amount: course.price,
                        customerRating: course.customerRating,
                      )));
        },
        child: Column(
          children: <Widget>[
            Hero(
              tag: "background-${course.courseId}",
              child: Container(
                height: 170.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: course.photoUrl != ""
                            ? Container()
                            : AssetImage("assets/images/resized/physics.jpg"),
                        fit: BoxFit.cover)),
                child: Material(
                  type: MaterialType.transparency,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      PopupMenuButton<ItemAction>(
                        padding: EdgeInsets.all(0),
                        tooltip: "Choose what to do.",
                        onSelected: onSelected,
                        itemBuilder: (context) => <PopupMenuEntry<ItemAction>>[
                              const PopupMenuItem<ItemAction>(
                                value: ItemAction.addToCart,
                                child: Text("Add To Cart"),
                              ),
                              const PopupMenuItem<ItemAction>(
                                value: ItemAction.addtoWishList,
                                child: Text("My Wishlist"),
                              )
                            ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          course.courseTitle,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: "SerifPro",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                        child: GradientTag(
                          fontName: "Poppins",
                          fontWeight: FontWeight.w600,
                          info: "${course.creatorName}",
                          colors: [
                            Color(0xFF00c6ff),
                            Color(0xFF0072ff),
                          ],
                        ),
                      ),
                      GradientTag(
                        fontName: "Poppins",
                        fontWeight: FontWeight.w600,
                        info: "Rs.${course.price}/-",
                        colors: [
                          Color(0xFF11998e),
                          Color(0xFF38ef7d),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    height: 2.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 2.5),
                    child: Text(
                      course.featureDescription,
                      style: TextStyle(
                          fontSize: 10.0,
                          fontFamily: "Oswald",
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  course.customerRating > 0
                      ? Row(
                          children: <Widget>[
                            SmoothStarRating(
                              allowHalfRating: false,
                              rating: course.customerRating,
                              size: 15,
                              color: Color(0xFFDFC90B),
                              borderColor: Color(0xFFDFC90B),
                            ),
                            Text(
                              "(${course.customerRating})",
                              style: TextStyle(
                                  fontSize: 10.0, color: Color(0xFF00c6ff)),
                            )
                          ],
                        )
                      : Text(
                          "No Ratings Yet!",
                          style: TextStyle(fontSize: 12.0),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
