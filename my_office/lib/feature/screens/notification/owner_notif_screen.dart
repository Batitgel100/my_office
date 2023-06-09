import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/screens/notification/notif_page.dart';

bool seen = false;
List seenList = [false, true, true, true, true];

class NotificationScreenOwner extends StatefulWidget {
  const NotificationScreenOwner({super.key});

  @override
  State<NotificationScreenOwner> createState() =>
      _NotificationScreenOwnerState();
}

class _NotificationScreenOwnerState extends State<NotificationScreenOwner> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), // here the desired height
          child: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.mainColor,
              ),
            ),
            title: const Text(
              'Мэдэгдэл',
              style: TextStyles.black17,
            ),
            backgroundColor: AppColors.white,
            bottom: const TabBar(
              labelStyle: TextStyles.main15semibold,
              indicatorColor: AppColors.mainColor,
              indicatorWeight: 5.0,
              labelColor: AppColors.mainColor,
              labelPadding: EdgeInsets.only(top: 0.0),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Надад ирсэн',
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
                //child: Image.asset('images/android.png'),

                Tab(
                  text: 'Миний илгээсэн',
                  iconMargin: EdgeInsets.only(bottom: 10.0),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 3),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              seenList = [true, true, true, true, true];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const NotificationPage(),
                                ),
                              );
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.white,
                                  border: seenList[index]
                                      ? null
                                      : Border.all(
                                          width: 2,
                                          color: AppColors.mainColor,
                                        ),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Color.fromARGB(141, 101, 105, 111),
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: const Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'WorldNet',
                                              style: TextStyles.black17semibold,
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'Өдрийн мэнд. Та гэрээгээ сунгах бол манай байгууллагатай холбогдоно уу?',
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 14,
                                left: MediaQuery.of(context).size.width * 0.88,
                                child: seenList[index]
                                    ? Container()
                                    : Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.red,
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String data;
  const CustomDialog({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.width * 0.4),
      elevation: 0,
      backgroundColor: Colors.white,
      child: SizedBox(
        // decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            const InkWell(
              child: Text(
                'close',
              ),
            ),
            Center(
              child: Text(data),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:my_office/feature1/constants/theme.dart';
// import 'package:stacked_notification_cards/stacked_notification_cards.dart';

// class NotificationOwnerScreen extends StatefulWidget {
//   const NotificationOwnerScreen({super.key});

//   @override
//   State<NotificationOwnerScreen> createState() =>
//       _NotificationOwnerScreenState();
// }

// class _NotificationOwnerScreenState extends State<NotificationOwnerScreen> {
//   final List<NotificationCard> _listOfNotification = [
//     NotificationCard(
//       date: DateTime.now(),
//       leading: const Icon(
//         Icons.account_circle,
//         size: 48,
//       ),
//       title: 'Мэдэгдэл 1',
//       subtitle: 'We believe in the power of mobile computing.',
//     ),
//     NotificationCard(
//       date: DateTime.now().subtract(
//         const Duration(minutes: 4),
//       ),
//       leading: const Icon(
//         Icons.account_circle,
//         size: 48,
//       ),
//       title: 'Мэдэгдэл 2',
//       subtitle: 'We believe in the power of mobile computing.',
//     ),
//     NotificationCard(
//       date: DateTime.now().subtract(
//         const Duration(minutes: 10),
//       ),
//       leading: const Icon(
//         Icons.account_circle,
//         size: 48,
//       ),
//       title: 'Мэдэгдэл 3',
//       subtitle: 'We believe in the power of mobile computing.',
//     ),
//     NotificationCard(
//       date: DateTime.now().subtract(
//         const Duration(minutes: 30),
//       ),
//       leading: const Icon(
//         Icons.account_circle,
//         size: 48,
//       ),
//       title: 'Мэдэгдэл 4',
//       subtitle: 'We believe in the power of mobile computing.',
//     ),
//     NotificationCard(
//       date: DateTime.now().subtract(
//         const Duration(minutes: 44),
//       ),
//       leading: const Icon(
//         Icons.account_circle,
//         size: 48,
//       ),
//       title: 'Мэдэгдэл 5',
//       subtitle: 'We believe in the power of mobile computing.',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.mainColor,
//         title: const Text(
//           'Мэдэгдэл',
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.mainColor,
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             StackedNotificationCards(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.25),
//                   blurRadius: 2.0,
//                 )
//               ],
//               notificationCardTitle: 'мэдэгдэл',
//               notificationCards: [..._listOfNotification],
//               cardColor: const Color(0xFFF1F1F1),
//               padding: 16,
//               actionTitle: const Text(
//                 'Мэдэгдэл',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               showLessAction: const Text(
//                 'Буцах',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.mainColor,
//                 ),
//               ),
//               onTapClearAll: () {
//                 setState(() {
//                   _listOfNotification.clear();
//                 });
//               },
//               clearAllNotificationsAction: const Icon(
//                 Icons.close,
//                 color: AppColors.mainColor,
//               ),
//               clearAllStacked: const Text('Бүгдийг арилгах'),
//               cardClearButton: const Text('арилгах'),
//               cardViewButton: const Text('Харах'),
//               onTapClearCallback: (index) {
//                 print(index);
//                 setState(() {
//                   _listOfNotification.removeAt(index);
//                 });
//               },
//               onTapViewCallback: (index) {
//                 print(index);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
