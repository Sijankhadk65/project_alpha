import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_alpha_app/src/bloc/login_bloc.dart';
import 'package:project_alpha_app/src/widgets/custom_clipper.dart';
import 'package:project_alpha_app/src/widgets/custom_path_painter.dart';

class ProfileSection extends StatefulWidget {
  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  void dispose() {
    super.dispose();
    loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomPaint(
          key: Key("Profile Board"),
          painter: CustomPathPainter(blurRadius: 5.0, color: Color(0xFFD0D0D0)),
          child: ClipPath(
            key: Key("Profile section"),
            clipper: CustomPathClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10.0),
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.purpleAccent, Colors.purple])),
              child: FutureBuilder<FirebaseUser>(
                  future: loginBloc.currentUser,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('Press a button to start');
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError)
                          return Text('Error ${snapshot.error}');
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox.fromSize(
                              size: Size.fromHeight(50),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Material(
                                      shape: CircleBorder(),
                                      elevation: 10.0,
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    snapshot.data.photoUrl),
                                                fit: BoxFit.cover)),
                                        child: Container(),
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                          "${snapshot.data.displayName.toUpperCase()}",
                                          style: TextStyle(
                                              fontSize: 29,
                                              color: Colors.white,
                                              fontFamily: "Oswald")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "${snapshot.data.email}",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 10.0,
                                            fontFamily: "Poppins"),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                    }
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
