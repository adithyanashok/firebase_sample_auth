import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/application/sign_in/sign_in_bloc.dart';
import 'package:flutter_bloc_tutorial/presentation/core/signin_controller.dart';
import 'package:flutter_bloc_tutorial/presentation/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            // App Bar //
            appBar: buildAppBar(AppBarTitle: 'Log In'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thirdPartyAuth(context),
                  Center(
                    child: reUsableTextWidget(
                      text: "Or use your email account login",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 36.5),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reUsableTextWidget(text: "Email"),
                        buildTextField(
                          hintText: "Enter your email address",
                          type: "email",
                          iconName: "user",
                          func: (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          },
                        ),
                        reUsableTextWidget(text: "Password"),
                        buildTextField(
                          hintText: "Enter your password",
                          type: "password",
                          iconName: "lock",
                          func: (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          },
                        ),
                        forgotPassword(),
                        buildLoginAndSignupButton(
                          buttonName: "Log In",
                          buttonType: "login",
                          func: () {
                            SignInController(context: context)
                                .handleSignIn("email");
                          },
                        ),
                        buildLoginAndSignupButton(
                          buttonName: "Register",
                          buttonType: "register",
                          func: () {
                            Navigator.of(context).pushNamed("register");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
