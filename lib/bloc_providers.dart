import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/application/home/home_bloc.dart';
import 'package:flutter_bloc_tutorial/application/register/register_bloc.dart';

import 'application/sign_in/sign_in_bloc.dart';
import 'application/welcome/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ];
}
