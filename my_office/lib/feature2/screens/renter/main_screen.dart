import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_office/feature1/constants/theme.dart';
import 'package:my_office/feature2/screens/renter/dashboard_screen.dart';
import 'package:my_office/feature2/screens/renter/search_screen.dart';
import 'package:my_office/feature2/screens/renter/user_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void getData() async {
    var url = 'https://mymap.mn/mobile/login?username=1234567&password=123';

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
                size: 35,
              ),
              icon: Icon(Icons.dashboard),
              label: 'Нүүр хуудас',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.search,
                size: 35,
              ),
              icon: Icon(Icons.search_sharp),
              label: 'Хайлт',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                size: 35,
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
