import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_office/feature2/screens/owner/owner_dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainScreenOwner extends StatefulWidget {
  const MainScreenOwner({super.key});

  @override
  State<MainScreenOwner> createState() => _MainScreenOwnerState();
}

class _MainScreenOwnerState extends State<MainScreenOwner> {
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
    DashboardScreenOwner(),
    DashboardScreenOwner(),
    DashboardScreenOwner(),
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        currentIndex: _selectedIndex,
        iconSize: 30,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Нүүр хуудас',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp),
            label: 'Хайлт',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Хэрэглэгч',
          ),
        ],
      ),
    );
  }
}
