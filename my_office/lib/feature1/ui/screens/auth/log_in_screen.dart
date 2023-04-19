import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_office/feature1/bloc/log_bloc/login_bloc.dart';
import 'package:my_office/repositories/repositories.dart';
import 'package:my_office/feature1/ui/screens/auth/login_form.dart';

import '../../../bloc/auth_bloc/auth.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  const LoginScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(
          userRepository: userRepository,
        ),
      ),
    );
  }
}
