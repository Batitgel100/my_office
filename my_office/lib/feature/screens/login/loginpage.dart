// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/public/globals.dart';
import 'package:my_office/service/auth.dart';
import 'package:my_office/feature/utils/utils.dart';
import 'package:provider/provider.dart';

const baseUrl = 'https://ub-office.mn/mobile/login';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

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
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.mainColor,
          AppColors.mainColor,
          AppColors.mainColor,
          // Colors.white,
          // Colors.white,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _icon(),
                const SizedBox(height: 50),
                _inputField("Нэвтрэх нэр", _emailController),
                const SizedBox(height: 20),
                _inputField("нууц үг", _passwordController, isPassword: true),
                const SizedBox(height: 50),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Нэвтрэх нэрээ оруулна уу', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage('Нууц үг оруулна уу', context);
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
                      setState(() {
                        // Navigator.pushNamed(context, RoutesName.mainOwner);
                      });
                    }
                  },
                  child: Ink(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
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
                _extraText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _extraText() {
    return const Text(
      "Нууц үг мартсан?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.white),
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
