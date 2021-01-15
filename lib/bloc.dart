import 'dart:async';
import 'package:blocpatternlogin/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
class Bloc extends Object with Validators implements BaseBloc{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  Function(String) get emailChanged =>_emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Stream<String> get emailStream=>_emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream=>_passwordController.stream.transform(passwordValidator);
  Stream<bool> get submitCheck =>Rx.combineLatest2(emailStream,passwordStream,(e,p)=>true);

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }





}


abstract class BaseBloc{
  void dispose();
}