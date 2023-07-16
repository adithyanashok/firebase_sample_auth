import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) {
      print('my email is ${event.email}');
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      print('my password is ${event.password}');
      emit(state.copyWith(password: event.password));
    });
  }
}
