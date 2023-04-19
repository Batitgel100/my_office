import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_office/feature1/constants/theme.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(148, 230, 234, 236),
      // drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('Хэрэглэгчийн хуудас'),
      ),
      body: Center(
        child: FutureBuilder(
          future: http.get(Uri.parse(
              'https://mymap.mn/mobile/login?username=1234567&password=123')),
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> data = json.decode(snapshot.data!.body);
              String firstName = data['data']['firstname'];
              String phone = data['data']['phone'];
              String register = data['data']['register'];
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CustomUserButton(
                      text: firstName,
                      onTap: () {},
                      radius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      title: 'Нэр',
                      icon: Icons.person,
                    ),
                    const CustomLine(),
                    CustomUserButton(
                      text: firstName,
                      onTap: () {},
                      radius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                      title: 'Овог',
                      icon: Icons.people,
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
                    ),
                    const CustomLine(),
                    CustomUserButton(
                      text: phone,
                      onTap: () {},
                      radius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      title: 'Утас',
                      icon: Icons.phone,
                    ),
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

class CustomUserButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final BorderRadius radius;
  final String title;
  final IconData icon;

  const CustomUserButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.radius,
    required this.title,
    required this.icon,
  });

  @override
  State<CustomUserButton> createState() => _CustomUserButtonState();
}

class _CustomUserButtonState extends State<CustomUserButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap;
      },
      child: Ink(
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: widget.radius),
        height: 60,
        width: MediaQuery.of(context).size.width * 0.92,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(widget.icon),
                    ),
                    Text(
                      widget.title,
                      style: TextStyles.black17,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        widget.text,
                        style: TextStyles.black17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
