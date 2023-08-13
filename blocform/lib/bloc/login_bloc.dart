import 'dart:async';

class LoginBloc {
  final _emailStreamController = StreamController<String>();
  Stream<String> get emailStream => _emailStreamController.stream;
  Function(String) get changeEmail => _emailStreamController.sink.add;

  final _passwordStreamController = StreamController<String>();
  Stream<String> get passwordStream => _passwordStreamController.stream;
  Function(String) get changePassword => _passwordStreamController.sink.add;

  dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }
}
