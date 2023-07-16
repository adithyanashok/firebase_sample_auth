import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/application/register/register_bloc.dart';
import 'package:flutter_bloc_tutorial/presentation/core/toast_widget.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    final username = state.username;
    final email = state.email;
    final password = state.password;
    final rePassword = state.rePassword;

    if (username.isEmpty) {
      snackBar(context: context, msg: "Username cannot be empty");
      return;
    }
    if (email.isEmpty) {
      snackBar(context: context, msg: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      snackBar(context: context, msg: "Password cannot be empty");
      return;
    }
    if (rePassword.isEmpty) {
      snackBar(context: context, msg: "Your password confirmation is wrong");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(username);
        snackBar(
          context: context,
          msg:
              "An email has been sent to your registered email. To activate it please check your email box",
        );
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        snackBar(context: context, msg: "The password provided is too weak");
      } else if (e.code == "email-already-in-use") {
        snackBar(context: context, msg: "The email is already in use");
      } else if (e.code == "invalid-email") {
        snackBar(context: context, msg: "The email provided is not valid");
      } else {
        snackBar(context: context, msg: "The operation not allowed");
      }
    }
  }
}
