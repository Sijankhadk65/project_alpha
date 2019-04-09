import 'dart:async';

mixin LoginValidators {
  final StreamTransformer<String, String> emailValidator =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String email, sink) {
    if ((email.contains("@") == true) && (email.contains(".com") == true)) {
      sink.add(email);
    } else {
      sink.addError("Invalid Email!");
    }
  });

  final StreamTransformer<String, String> passwordValidator =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String password, sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError("Password must be 4 characters Long.");
    }
  });
}
