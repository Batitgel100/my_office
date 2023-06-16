import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/public/globals.dart';
import 'package:my_office/feature/screens/login/loginpage.dart';
import 'package:my_office/feature/screens/renter/user/user_edit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // UserRepository repository = UserRepository();
  @override
  void initState() {
    // repository.updatePage(firstNameController.text, lastname, phone, email, register, address, password, image),
    super.initState();
  }

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final adressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final registerController = TextEditingController();

  bool imageEmpty = true;
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
        title: const Text(
          'Хэрэглэгчийн хуудас',
          style: TextStyles.white17,
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: http.get(Uri.parse(
              'https://ub-office.mn/mobile/login?gmail=${Globals.gmail}&password=${Globals.password}')),
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> data = json.decode(snapshot.data!.body);
              String firstName = data['data']['firstname'].toString();
              String phone = data['data']['phone'];
              String register = data['data']['register'];

              if (data['data']['image_url'] == null) {
                imageEmpty = true;
              } else {
                imageEmpty = false;
              }

              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    if (imageEmpty)
                      const SizedBox()
                    else
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: NetworkImage(
                                'https://ub-office.mn${data['data']['image_url']}',
                              ),
                              fit: BoxFit.cover),
                        ),
                        height: 150,
                      ),
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
                      seconIcon: Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
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
                      title: 'Имэйл',
                      icon: Icons.people,
                      seconIcon: Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
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
                      title: 'Регистр',
                      icon: Icons.note,
                      seconIcon: Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
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
                          padding: EdgeInsets.all(4.0),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const UserEdit(
                                      // emailController: emailController,
                                      // passwordController: passwordController,
                                      // firstNameController: firstNameController,
                                      // lastNameController: lastNameController,
                                      // phoneController: phoneNumberController,
                                      // registerController: registerController,
                                      // adressController: adressController,
                                      // onTap: () async {
                                      // bool response =
                                      //     await repository.updatePage(
                                      //   firstNameController.text,
                                      //   lastNameController.text,
                                      //   phoneNumberController.text,
                                      //   emailController.text,
                                      //   registerController.text,
                                      //   adressController.text,
                                      //   passwordController.text,
                                      //   // 'assets/images/3.png' as Image,
                                      // );
                                      // if (response) {
                                      //   Navigator.pop(context);
                                      //   Globals.changeFirstName(
                                      //       firstNameController.text);
                                      //   Globals.changeAddress(
                                      //     adressController.text,
                                      //   );
                                      //   Globals.changeGmail(
                                      //     emailController.text,
                                      //   );
                                      //   Globals.changeUserPhone(
                                      //     phoneNumberController.text,
                                      //   );
                                      //   Globals.changeRegister(
                                      //     registerController.text,
                                      //   );
                                      //   Globals.changeLastName(
                                      //     lastNameController.text,
                                      //   );
                                      //   setState(() {});
                                      // } else {
                                      //   print(response);
                                      //   // throw Exception('fail sda');
                                      // }
                                      // },
                                      ),
                                ),
                              );
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                  child: Text(
                                    'Мэдээлэл засах',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ))),
                        InkWell(
                            onTap: _logout,
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 243, 123, 115),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                  child: Text(
                                    'Гарах',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ))),
                      ],
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
