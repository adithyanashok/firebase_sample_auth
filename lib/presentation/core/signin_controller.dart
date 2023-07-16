import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/application/sign_in/sign_in_bloc.dart';
import 'package:flutter_bloc_tutorial/presentation/core/toast_widget.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        final emailAddress = state.email;
        final password = state.password;
        if (emailAddress.isEmpty) {
          snackBar(context: context, msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          snackBar(context: context, msg: "You need to fill password");
          return;
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            snackBar(context: context, msg: "User doesn't exist");
          }
          if (!credential.user!.emailVerified) {
            snackBar(
                context: context, msg: "You need to verify your email address");
            return;
          }
          var user = credential.user;
          if (user != null) {
            print("User exist");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("home", (route) => false);
            //
          } else {
            //
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "invalid-email") {
            snackBar(context: context, msg: "Entered email address is invalid");
          } else if (e.code == "wrong-password") {
            snackBar(context: context, msg: "Entered password is wrong");
          } else if (e.code == "user-not-found") {
            snackBar(context: context, msg: "user not found");
          } else {
            snackBar(context: context, msg: "User disabled");
          }
        }
      }
    } catch (e) {}
  }
}
