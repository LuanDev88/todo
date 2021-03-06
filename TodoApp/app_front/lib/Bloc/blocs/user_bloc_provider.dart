import '../resources/repository.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:app_front/models/classes/users.dart';


class UserBloc {
  final _repository = Repository();
  final _userGetter = PublishSubject<User>();

  Observable<User> get getUser => _userGetter.stream;

  registerUser(String username, String firstname, String lastname, String email,
      String password) async {
    User user = await _repository.registerUser(
        username, firstname, lastname, email, password);
    _userGetter.sink.add(user);
  }

  dispose() {
    _userGetter.close();
  }
}

final bloc = UserBloc();
