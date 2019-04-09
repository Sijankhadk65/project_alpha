import 'package:flutter/material.dart';

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends InheritedWidget {
  final Widget child;
  final T bloc;

  BlocProvider({Key key, @required this.child, @required this.bloc})
      : super(key: key, child: child);

  static T of<T extends BlocBase>(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_typeOf<BlocProvider<T>>())
            as BlocProvider)
        .bloc;
  }

  static Type _typeOf<T>() => T;

  @override
  bool updateShouldNotify(_) => true;
}
