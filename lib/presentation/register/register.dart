import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/application/register/register_bloc.dart';
import 'package:flutter_bloc_tutorial/presentation/core/register_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sign_in/widgets/sign_in_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            // App Bar //
            appBar: buildAppBar(AppBarTitle: 'SignUp'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  Center(
                    child: reUsableTextWidget(
                      text: "Enter your details below & free signup",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 36.5),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reUsableTextWidget(text: "Username"),
                        buildTextField(
                          hintText: "Enter your username",
                          type: "username",
                          iconName: "user",
                          func: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(UserNameEvent(value));
                          },
                        ),
                        reUsableTextWidget(text: "Email"),
                        buildTextField(
                          hintText: "Enter your email address",
                          type: "email",
                          iconName: "user",
                          func: (value) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          },
                        ),
                        reUsableTextWidget(text: "Password"),
                        buildTextField(
                          hintText: "Enter your password",
                          type: "password",
                          iconName: "lock",
                          func: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(value));
                          },
                        ),
                        reUsableTextWidget(text: "Confirm password"),
                        buildTextField(
                          hintText: "Confirm password",
                          type: "password",
                          iconName: "lock",
                          func: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RePasswordEvent(value));
                          },
                        ),
                        Container(
                          child: reUsableTextWidget(
                            text:
                                "By creating an account you have to agree with our terms & conditions",
                          ),
                        ),
                        buildLoginAndSignupButton(
                          buttonName: "Signup",
                          buttonType: "login",
                          func: () {
                            // Navigator.of(context).pushNamed("register");
                            RegisterController(context: context)
                                .handleEmailRegister();
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
