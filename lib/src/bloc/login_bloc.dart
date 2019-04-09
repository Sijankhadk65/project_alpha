import 'dart:async';
import 'package:project_alpha_app/src/bloc/bloc_base.dart';
import 'package:project_alpha_app/src/resources/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_alpha_app/src/validators/login_validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase with LoginValidators {
  final _repo = Repository();

  Stream<String> get currentUserStateStream => _repo.onAuthStateChanged;

  final _emailSubject = BehaviorSubject<String>();
  Function(String) get changeEmail => _emailSubject.sink.add;
  Stream<String> get email => _emailSubject.stream.transform(emailValidator);

  final _passwordSubject = BehaviorSubject<String>();
  Function(String) get changePassword => _passwordSubject.sink.add;
  Stream<String> get password =>
      _passwordSubject.stream.transform(passwordValidator);

  final _loginSubject = BehaviorSubject<bool>();
  Function(bool) get changeLoginStatus => _loginSubject.sink.add;
  Stream<bool> get login => _loginSubject.stream;

  final _userSubject = BehaviorSubject<FirebaseUser>();
  Function(FirebaseUser) get changeUser => _userSubject.sink.add;
  Stream<FirebaseUser> get user => _userSubject.stream;

  Stream<bool> get loginAccess =>
      Observable.combineLatest2(email, password, (String e, String p) {
        return true;
      });
  Future<FirebaseUser> handleGoogleSignIn() => _repo.handleGoogleSignIn();
  Future<FirebaseUser> get currentUser => _repo.getCurrentUser();
  void logout() => _repo.logout();

  @override
  void dispose() {
    _loginSubject.close();
    _emailSubject.close();
    _passwordSubject.close();
    _userSubject.close();
  }
}

final loginBloc = LoginBloc();
