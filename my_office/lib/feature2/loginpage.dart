import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_office/feature2/screens/renter/main_screen.dart';
import 'package:my_office/feature2/screens/owner/main_screen_owner.dart';
import 'package:my_office/repositories/repositories.dart';

const baseUrl = 'https://mymap.mn/mobile/login';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isOwner = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginService loginService = LoginService();
  final bool _isLoading = false;
  Future<void> login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    try {
      final success = await loginService.login(username, password);

      if (success) {
        if (isOwner == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MainScreenOwner(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MainScreen(),
            ),
          );
        }
        // Login succeeded - navigate to the home screen or store the user data and do some other stuff
      } else {
        log('Нууц үг эсвэл нэвтрэх нэр буруу байна.');
        _showErrorDialog('Нууц үг эсвэл нэвтрэх нэр буруу байна.');
      }
    } catch (e) {
      log('Error: $e');
      _showErrorDialog('Алдаа гарлаа!');
      log('Алдаа гарлаа!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          const Text(
            'MyOffice Login',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Нэвтрэх нэр',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: 'Нууц үг',
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: isOwner,
            onChanged: (newValue) => setState(
              () => isOwner = newValue,
            ),
          ),
          const SizedBox(height: 32),
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: login,
                  child: const Text('Нэвтрэх'),
                ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }
}
