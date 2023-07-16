import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<UserNameEvent>((event, emit) {
      print(state.username);
      emit(state.copyWith(username: event.userName));
    });

    on<EmailEvent>((event, emit) {
      print(event.email);
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<RePasswordEvent>((event, emit) {
      emit(state.copyWith(rePassword: event.rePassword));
    });
  }
}
