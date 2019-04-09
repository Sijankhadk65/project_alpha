import 'package:flutter/material.dart';
import 'package:project_alpha_app/src/widgets/comment_section.dart';
import 'package:project_alpha_app/src/widgets/comment_uploader.dart';
import 'package:project_alpha_app/src/widgets/course_feature_item.dart';
import 'package:project_alpha_app/src/widgets/description_card.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CourseDetailScreen extends StatefulWidget {
  final String assetUri, courseTitle, courseId, creatorName;
  final int amount;
  final double customerRating;
  final List<String> features;

  const CourseDetailScreen(
      {Key key,
      @required this.assetUri,
      this.courseTitle,
      this.courseId,
      this.creatorName,
      this.amount,
      this.customerRating,
      this.features})
      : super(key: key);
  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  List<String> features = [
    "Learn to use Python professionally, learning both Python 2 and Python 3!",
    "Learn advanced Python features, like the collections module and how to work with timestamps!",
    "Understand complex topics, like decorators.",
    "Get an understanding of how to create GUIs in the Jupyter Notebook system!",
    "Create games with Python, like Tic Tac Toe and Blackjack!",
    "Learn to use Object Oriented Programming with classes!",
    "Understand how to use both the Jupyter Notebook and create .py files",
    "Build a complete understanding of Python from the ground up!"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${widget.courseTitle}",
                        style:
                            TextStyle(fontSize: 18.0, fontFamily: "SerifPro"),
                      ),
                      SmoothStarRating(
                        allowHalfRating: false,
                        rating: widget.customerRating,
                        size: 10,
                        color: Color(0xFFDFC90B),
                        borderColor: Color(0xFFDFC90B),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0, bottom: 15.0),
                    child: Material(
                      key: Key(widget.courseTitle),
                      elevation: 10.0,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Rs.${widget.amount}/-",
                          style: TextStyle(
                              fontSize: 7.0,
                              color: Colors.green,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              background: Hero(
                tag: "background-${widget.courseId}",
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: widget.assetUri != ""
                              ? AssetImage("${widget.assetUri}")
                              : AssetImage("assets/images/resized/physics.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Color.fromARGB(110, 0, 0, 0),
                              BlendMode.srcOver))),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8.0, right: 8.0, bottom: 4.0),
                child: Text(
                  "Taught by ${widget.creatorName}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      fontFamily: "SerifPro"),
                ),
              ),
              DescriptionCard(
                margin: EdgeInsets.only(
                    top: 4.0, left: 8.0, right: 8.0, bottom: 8.0),
                isCard: true,
                title: "What you'll learn",
                child: widget.features.isNotEmpty
                    ? Column(
                        children: widget.features
                            .map<Widget>((feature) => CourseFeatureitem(
                                  feature: feature,
                                ))
                            .toList(),
                      )
                    : Text("No Info Yet!"),
              ),
              DescriptionCard(
                margin: EdgeInsets.only(
                    top: 4.0, left: 8.0, right: 8.0, bottom: 8.0),
                isCard: true,
                title: "Description",
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontFamily: "Poppins", fontSize: 13),
                  textAlign: TextAlign.justify,
                ),
              ),
              CommentUploader(),
              CommentSection()
            ]),
          ),
        ],
      ),
    );
  }
}
