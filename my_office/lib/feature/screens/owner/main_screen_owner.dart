import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/screens/chat/chat_screen_ui.dart';
import 'package:my_office/feature/screens/owner/dashboard/owner_dashboard_screen.dart';
import 'package:my_office/feature/screens/my_rooms/my_room_screen.dart';

import 'package:my_office/feature/screens/renter/user/user_screen.dart';

class MainScreenOwner extends StatefulWidget {
  const MainScreenOwner({super.key});

  @override
  State<MainScreenOwner> createState() => _MainScreenOwnerState();
}

class _MainScreenOwnerState extends State<MainScreenOwner> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    const DashboardScreenOwner(),
    const MyRoomScreen(),
    const ChatScreenUI(),
    // const NotificationScreenOwner(),
    const UserScreen(),
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
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ]),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: const Color.fromARGB(255, 144, 143, 143),
          elevation: 20,
          currentIndex: _selectedIndex,
          iconSize: 25,
          onTap: _onItemTapped,
          selectedItemColor: AppColors.mainColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Нүүр хуудас',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              //  Stack(
              //   children: [
              //     const Icon(Icons.notifications),
              //     Container(
              //       height: 12,
              //       width: 12,
              //       decoration: BoxDecoration(
              //           color: Colors.red,
              //           borderRadius: BorderRadius.circular(60)),
              //     )
              //   ],
              // ),
              label: 'Миний',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Зурвас',
            ),
            // BottomNavigationBarItem(
            //   label: 'Мэдэгдэл',
            //   icon:
            // Stack(
            //     children: [
            //       const Icon(Icons.notifications),
            //       Container(
            //         height: 10,
            //         width: 10,
            //         decoration: BoxDecoration(
            //             color: Colors.red,
            //             borderRadius: BorderRadius.circular(60)),
            //       )
            //     ],
            //   ),
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Хэрэглэгч',
            ),
          ],
        ),
      ),
    );
  }
}
