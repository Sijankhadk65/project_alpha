import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<FirebaseUser> handleSignIn();
  void logout();
}

class FirebaseAuthProvider extends BaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseAuthProvider();

  Stream<FirebaseUser> get onAuthStateChanged => _auth.onAuthStateChanged;

  @override
  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);

    return user;
  }

  Future<FirebaseUser> getCurrentUser() => _auth.currentUser();

  @override
  void logout() {
    _googleSignIn.signOut();
    _auth.signOut();
  }
}
