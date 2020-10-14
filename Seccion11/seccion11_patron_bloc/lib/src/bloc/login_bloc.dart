

import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:seccion11_patron_bloc/src/bloc/validators.dart';


class LoginBloc with Validators{


final _emailController    = BehaviorSubject<String>();
final _passwordController = BehaviorSubject<String>();

//Get para insertar valores al stream
Function(String) get changeEmail    => _emailController.sink.add;
Function(String) get changePassword => _passwordController.sink.add;

//Recuperar los datos del Stream
Stream<String> get emailStream      => _emailController.stream.transform( validarEmail);
Stream<String> get passwordStream   => _passwordController.stream.transform( validarPassword );


Stream<bool> get formValidStream =>
       Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);


dispose(){
  _emailController?.close();
  _passwordController?.close();
}

}