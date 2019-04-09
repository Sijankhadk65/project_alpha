import 'package:flutter/material.dart';
import 'package:project_alpha_app/src/bloc/login_bloc.dart';
import 'package:project_alpha_app/src/screens/home_screen.dart';
import 'package:project_alpha_app/src/screens/login_screen.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: loginBloc.currentUserStateStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? HomePage(
                title: "Nepali Gurus",
              )
            : LoginScreen();
      },
    );
  }
}
