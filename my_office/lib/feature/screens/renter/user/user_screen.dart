import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/public/globals.dart';
import 'package:my_office/feature/screens/login/loginpage.dart';
import 'package:my_office/service/user_reposiroty.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserRepository repository = UserRepository();
  final firstNameController = TextEditingController();
  Future<void> _logout() async {
    // Clear any stored user data here
    // For example, you can use shared preferences to store the user data and clear it on logout
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate back to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(148, 230, 234, 236),
      // drawer: const Drawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainColor,
        title: const Text('Хэрэглэгчийн хуудас'),
      ),
      body: Center(
        child: FutureBuilder(
          future: http.get(Uri.parse(
              'https://ub-office.mn/mobile/login?gmail=worldnet@gmail.com&password=12345678')),
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> data = json.decode(snapshot.data!.body);
              String firstName = data['data']['firstname'];
              String phone = data['data']['phone'];
              String register = data['data']['register'];
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CustomUserButton(
                      text: firstName,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MyWidget(
                              controller: firstNameController,
                              onTap: () async {
                                bool response = await repository.updatePage(
                                  firstNameController.text,
                                );
                                if (response) {
                                  Navigator.pop(context);
                                } else {
                                  print(response);
                                  // throw Exception('fail sda');
                                }
                              },
                            ),
                          ),
                        );
                      },
                      radius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      title: 'Нэр',
                      icon: Icons.person,
                      seconIcon: Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    const CustomLine(),
                    CustomUserButton(
                      text: Globals.gmail.toString(),
                      onTap: () {},
                      radius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                      title: 'емайл',
                      icon: Icons.people,
                      seconIcon: Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    const CustomLine(),
                    CustomUserButton(
                      text: register,
                      onTap: () {},
                      radius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      title: 'Регистер',
                      icon: Icons.note,
                      seconIcon: Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    const CustomLine(),
                    CustomUserButton(
                      text: phone,
                      onTap: () {},
                      radius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      title: 'Утас',
                      icon: Icons.phone,
                      seconIcon: Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    const CustomLine(),
                    CustomUserButton(
                      text: firstName,
                      onTap: () {},
                      radius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      title: 'Компаний нэр',
                      icon: Icons.corporate_fare,
                      seconIcon: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 30),
                      child: InkWell(
                          onTap: _logout,
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 243, 123, 115),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Center(
                                child: Text(
                                  'Гарах',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))),
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                  strokeWidth: 5,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const MyWidget({super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(onPressed: onTap, child: const Text('submit'))
        ],
      ),
    );
  }
}

class CustomLine extends StatelessWidget {
  const CustomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 0.2,
          color: const Color.fromARGB(255, 110, 110, 110),
          width: MediaQuery.of(context).size.width * 0.78,
        ),
      ],
    );
  }
}

class CustomUserButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final BorderRadius radius;
  final String title;
  final IconData icon;
  final Widget seconIcon;

  const CustomUserButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.radius,
    required this.title,
    required this.icon,
    required this.seconIcon,
  });

  @override
  State<CustomUserButton> createState() => _CustomUserButtonState();
}

class _CustomUserButtonState extends State<CustomUserButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: widget.radius),
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.93,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Icon(
                        widget.icon,
                        color: const Color.fromARGB(255, 72, 72, 72),
                      ),
                    ),
                    Text(
                      widget.title,
                      style: TextStyles.black14,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        widget.text,
                        style: TextStyles.black14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Ink(
                    child: Center(child: widget.seconIcon),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
