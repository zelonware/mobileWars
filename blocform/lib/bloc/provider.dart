import 'package:blocform/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final _loginBloc = LoginBloc();

  Provider({required key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc loginBloc(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        ._loginBloc;
  }
}
