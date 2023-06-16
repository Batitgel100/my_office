// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/public/globals.dart';
import 'package:my_office/service/auth.dart';
import 'package:my_office/feature/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

const baseUrl = 'https://ub-office.mn/mobile/login';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Uri _url = Uri.parse('https://ub-office.mn/forgot/password');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool showPassword = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          // image: NetworkImage(
          //   'https://ub-office.mn/images/city-bc.jpg',
          // ),
          image: AssetImage(
            'assets/images/background.jpg',
          ),
          fit: BoxFit.cover,
        ),
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //     AppColors.mainColor,
        //     AppColors.mainColor,
        //     AppColors.mainColor,
        //     // Colors.white,
        //     // Colors.white,
        //   ],
        // ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            Center(
              child: Container(
                height: 600,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(110, 255, 255, 255),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/logo.png',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const Text(
                          'НЭВТРЭХ',
                          style: TextStyles.black25,
                        ),
                        const SizedBox(height: 20),
                        inputField(
                          "Нэвтрэх нэр",
                          _emailController,
                        ),
                        const SizedBox(height: 20),
                        _inputField(
                            "нууц үг",
                            _passwordController,
                            isPassword: true,
                            showPassword
                                ? const Icon(Icons.visibility,
                                    color: Color.fromARGB(255, 66, 66, 66))
                                : const Icon(Icons.visibility_off,
                                    color: Color.fromARGB(255, 66, 66, 66))),
                        const SizedBox(height: 50),
                        InkWell(
                          onTap: () {
                            if (_emailController.text.isEmpty) {
                              Utils.flushBarErrorMessage(
                                  'Нэвтрэх нэрээ оруулна уу', context);
                            } else if (_passwordController.text.isEmpty) {
                              Utils.flushBarErrorMessage(
                                  'Нууц үг оруулна уу', context);
                            } else if (_passwordController.text.length < 3) {
                              Utils.flushBarErrorMessage(
                                  '6 оронтой тоо оруулна уу', context);
                            } else {
                              Map data = {
                                'gmail': _emailController.text.toString(),
                                'password': _passwordController.text.toString(),
                              };
                              Globals.changeGmail(_emailController.text);
                              authViewMode.loginApi(data, context);
                              Globals.changePassword(_passwordController.text);
                              setState(() {
                                // Navigator.pushNamed(context, RoutesName.mainOwner);
                              });
                            }
                          },
                          child: Ink(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(206, 0, 0, 0),
                                    spreadRadius: 0.4,
                                    blurRadius: 5,
                                    offset: Offset(
                                        2, 4), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18)),
                            child: const Center(
                              child: Text(
                                'Нэвтрэх',
                                style: TextStyles.main17semibold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(onTap: _launchUrl, child: _extraText()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
      String hintText, TextEditingController controller, Icon icon,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(179, 118, 116, 116),
            spreadRadius: 0.4,
            blurRadius: 5,
            offset: Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        style: const TextStyle(color: Color.fromARGB(255, 34, 34, 34)),
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              child: icon),
          // prefixIcon: icon,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
          enabledBorder: border,
          focusedBorder: border,
        ),
        obscureText: showPassword,
      ),
    );
  }

  Widget inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(179, 118, 116, 116),
            spreadRadius: 0.4,
            blurRadius: 5,
            offset: Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        style: const TextStyle(color: Color.fromARGB(255, 34, 34, 34)),
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }

  Widget _extraText() {
    return const Text(
      "Нууц үг мартсан?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 17, color: Colors.black),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         const SizedBox(height: 20),
  //         const Text(
  //           'MyOffice Login',
  //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //         ),
  //         const SizedBox(height: 20),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 32),
  //           child: Column(
  //             children: <Widget>[
  //               TextFormField(
  //                 controller: gmailController,
  //                 keyboardType: TextInputType.phone,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Нэвтрэх нэр',
  //                 ),
  //               ),
  //               const SizedBox(height: 16),
  //               TextFormField(
  //                 controller: passwordController,
  //                 obscureText: false,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Нууц үг',
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  // Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //   children: [
  //     const Text('tureeslegch'),
  //     Switch.adaptive(
  //       value: isOwner,
  //       onChanged: (newValue) => setState(
  //         () => isOwner = newValue,
  //       ),
  //     ),
  //     const Text('tureesluulegch')
  //   ],
  // ),
  //         const SizedBox(height: 32),
  // _isLoading
  //     ? const CircularProgressIndicator()
  //     : ElevatedButton(
  //         onPressed: login,
  //         child: const Text('Нэвтрэх'),
  //       ),
  //       ],
  //     ),
  //   );
  // }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }
}
