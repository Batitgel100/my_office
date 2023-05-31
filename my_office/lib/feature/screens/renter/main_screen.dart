import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/screens/notification/owner_notif_screen.dart';
import 'package:my_office/feature/screens/renter/dashboard_screen.dart';
import 'package:my_office/feature/screens/renter/search_screen.dart';
import 'package:my_office/feature/screens/renter/user/user_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void getData() async {
    var url =
        'https://ub-office.mn/mobile/login?gmail=worldnet@gmail.com&password=123';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      log(jsonResponse);
    } else {
      log('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    DashBoardScreen(),
    SearchScreen(),
    NotificationScreenOwner(),
    UserScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 78, 77, 77),
                blurRadius: 10,
                offset: Offset(0, 8)),
          ],
        ),
        child: BottomNavigationBar(
          unselectedItemColor: const Color.fromARGB(255, 120, 128, 144),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          iconSize: 30,
          onTap: _onItemTapped,
          selectedItemColor: AppColors.mainColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.dashboard,
                size: 30,
              ),
              icon: Icon(Icons.dashboard),
              label: 'Нүүр хуудас',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.search,
                size: 30,
              ),
              icon: Icon(Icons.search_sharp),
              label: 'Хайлт',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.notifications,
                size: 30,
              ),
              icon: Icon(Icons.notifications),
              label: 'Мэдэглэл',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                size: 30,
              ),
              icon: Icon(Icons.person),
              label: 'Хэрэглэгч',
            ),
          ],
        ),
      ),
    );
  }
}
