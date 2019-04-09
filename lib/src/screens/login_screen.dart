import 'package:flutter/material.dart';
import 'package:project_alpha_app/src/screens/home_screen.dart';

import 'package:project_alpha_app/src/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Screen")),
      ),
      body: Container(
        child: Form(
          child: ListView(
            children: <Widget>[
              getEmailField(loginBloc),
              getPasswordField(loginBloc),
              getLoginButton(loginBloc),
              getGoogleLogin(loginBloc),
              getFacebookLogin(loginBloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget getEmailField(LoginBloc bloc) {
    return TextField(
      decoration:
          InputDecoration(labelText: "Email", hintText: "you@example.com"),
    );
  }

  Widget getPasswordField(LoginBloc bloc) {
    return TextField(
      decoration:
          InputDecoration(labelText: "Password", border: OutlineInputBorder()),
      obscureText: true,
    );
  }

  Widget getLoginButton(LoginBloc bloc) {
    return RaisedButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => HomePage(title: "Neplai Gurus")));
      },
      child: Text("Login"),
    );
  }

  Widget getGoogleLogin(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.login,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text("${snapshot.error}");
        return RaisedButton(
          onPressed: () =>
              bloc.handleGoogleSignIn().then((user) => print(user)),
          child: Text("Login With Google"),
        );
      },
    );
  }

  Widget getFacebookLogin(LoginBloc bloc) {
    return RaisedButton(
      onPressed: () {},
      child: Row(
        children: <Widget>[Text("Login with Facebook")],
      ),
    );
  }
}
