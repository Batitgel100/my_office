import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_office/feature1/bloc/log_bloc/login_bloc.dart';
import 'package:my_office/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/theme.dart';

final passwordController = TextEditingController();

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  const LoginForm({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  bool isObsecure = true;
  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: usernameController.text,
          password: passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          const snackBar = SnackBar(
            content: Text('Нууц үг эсвэл мэйл буруу байна.'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        emailField(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        passwordField(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              child: const Text(
                                "Нууц үг мартсан?",
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 12.0),
                              ),
                              onTap: () {}),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 30.0, bottom: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                  height: 45,
                                  child: state is LoginLoading
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                SizedBox(
                                                  height: 25.0,
                                                  width: 25.0,
                                                  child:
                                                      CupertinoActivityIndicator(),
                                                )
                                              ],
                                            ))
                                          ],
                                        )
                                      : InkWell(
                                          onTap: onLoginButtonPressed,
                                          child: Ink(
                                            decoration: BoxDecoration(
                                                color: AppColors.facebookBlue,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Center(
                                              child: Text("Нэвтрэх",
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                            ),
                                          ))),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  TextFormField emailField() {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.titleColor,
          fontWeight: FontWeight.bold),
      controller: usernameController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: const Icon(EvaIcons.emailOutline, color: Colors.black26),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(15.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.mainColor),
            borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "Мэйл",
        hintStyle: const TextStyle(
            fontSize: 12.0, color: AppColors.grey, fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
    );
  }

  TextFormField passwordField() {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.titleColor,
          fontWeight: FontWeight.bold),
      controller: passwordController,
      decoration: InputDecoration(
        // errorText: validatePassword(passwordController.text),
        suffixIcon: InkWell(
          onTap: isObsecure
              ? () {
                  setState(() {
                    isObsecure = false;
                  });
                }
              : () {
                  setState(() {
                    isObsecure = true;
                  });
                },
          child: Icon(
            isObsecure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
        ),
        fillColor: Colors.white,
        prefixIcon: const Icon(
          EvaIcons.lockOutline,
          color: Colors.black26,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(15.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.mainColor),
            borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
        labelText: "Нууц үг",
        hintStyle: const TextStyle(
            fontSize: 12.0, color: AppColors.grey, fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
      obscureText: isObsecure,
      // validator: ,
    );
  }

  String? validatePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password should contain more than 5 characters";
    }
    return null;
  }
}
