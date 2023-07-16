import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/application/sign_in/sign_in_bloc.dart';
import 'package:flutter_bloc_tutorial/application/welcome/welcome_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc_providers.dart';
import 'package:flutter_bloc_tutorial/global.dart';
import 'package:flutter_bloc_tutorial/presentation/home/home_screen.dart';
import 'package:flutter_bloc_tutorial/presentation/register/register.dart';
import 'package:flutter_bloc_tutorial/presentation/sign_in/sign_in.dart';
import 'package:flutter_bloc_tutorial/presentation/welcome/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //<-------------------MultiBloc Provide----------------------->
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      // <---------------------- Material App------------------>
      child: ScreenUtilInit(
        builder: (context, child) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              //<-------------------Themedata-------------------->
              theme: ThemeData(
                // Appbar theme //
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                useMaterial3: true,
              ),
              home: WelcomeScreen(),
              //<------------------- Routes ---------------------->
              routes: {
                "signin": (context) => const SignInScreen(),
                "register": (context) => const RegisterScreen(),
                "home": (context) => HomeScreen(),
              },
            ),
      ),
    );
  }
}
