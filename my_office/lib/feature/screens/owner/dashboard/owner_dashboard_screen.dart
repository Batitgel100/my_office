// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:my_office/feature/constants/theme.dart';
// import 'package:my_office/feature/public/globals.dart';
// import 'package:my_office/feature/screens/notification/owner_notif_screen.dart';
// import 'package:my_office/feature/screens/owner/dashboard/widget/all_space.dart';
// import 'package:my_office/feature/screens/owner/dashboard/widget/contact_widget.dart';
// import 'package:my_office/feature/screens/owner/dashboard/widget/garchig.dart';
// import 'package:my_office/feature/screens/owner/dashboard/widget/midman.dart';
// import 'package:my_office/feature/screens/renter/dashboard_screen.dart';
// import 'package:my_office/feature/screens/my_rooms/my_room_screen.dart';
// import 'package:http/http.dart' as http;
// import '../../../model/room_model.dart';

// bool clicked = false;
// bool seen = false;

// class DashboardScreenOwner extends StatefulWidget {
//   const DashboardScreenOwner({super.key});

//   @override
//   State<DashboardScreenOwner> createState() => _DashboardScreenOwnerState();
// }

// class _DashboardScreenOwnerState extends State<DashboardScreenOwner> {
//   bool isLoading = true;
//   FetchRoomList fetchRoomList = FetchRoomList();

//   List<RoomModel> listRoom = [];
//   getGetRoomApi() async {
//     List<RoomModel> rooms = await fetchRoomList.getRoomList();
//     if (mounted) {
//       setState(() {
//         listRoom = rooms;
//         isLoading = false;
//       });
//     }
//   }

//   Map<String, dynamic> data = {};

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse(
//         'https://ub-office.mn/mobile/lessor/dashbboard/data/${Globals.userId}')); // Replace with your server URL
//     if (response.statusCode == 200) {
//       if (mounted) {
//         setState(() {
//           data = jsonDecode(response.body);
//           isLoading = false;
//         });
//       }
//     } else {
//       print('Failed to fetch data: ${response.statusCode}');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     print(Globals.isLogin);

//     fetchData();

//     getGetRoomApi();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: const Text(
//             'Хянах самбар',
//             style: TextStyles.white17,
//           ),
//           backgroundColor: AppColors.mainColor,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: InkWell(
//                 onTap: () {
//                   setState(() {
//                     seen = true;
//                   });
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const NotificationScreenOwner(),
//                       ));
//                 },
//                 child: Stack(
//                   children: [
//                     const Icon(
//                       Icons.notifications,
//                       size: 30,
//                     ),
//                     seen
//                         ? Container()
//                         : Container(
//                             height: 10,
//                             width: 10,
//                             decoration: BoxDecoration(
//                                 color: Colors.red,
//                                 borderRadius: BorderRadius.circular(60)),
//                           )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: isLoading
//             ? const Center(
//                 child: CircularProgressIndicator(
//                   color: AppColors.mainColor,
//                 ),
//               )
//             : Column(
//                 children: [
//                   Expanded(
//                     child: ListView(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: SizedBox(
//                             // height: MediaQuery.of(context).size.height * 0.9,
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                 // left: 8.0,
//                                 // right: 8,
//                                 top: 10,
//                               ),
//                               child: Column(
//                                 children: [
//                                   const Garchig(),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),

//                                   AllMoneyWidget(
//                                     sellYearly: data["sellYearly"] ?? 0,
//                                     brokerYearly: data["brokerYearly"] ?? 0,
//                                     rentYearly: data["rentYearly"] ?? 0,
//                                     totalYearly: data["totalYearly"] ?? 0,
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   MonthMoney(
//                                     rentMonthly: data["rentMonthly"] ?? 0,
//                                     // sellMonthly: null,
//                                     totalMonthly: data["totalMonthly"] ?? 0,
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),

//                                   AllSpace(
//                                     roomRenting: data["roomRenting"] ?? 0,
//                                     roomRentingArea:
//                                         data["roomRentingArea"] ?? 0,
//                                     roomWaiting: data["roomWaiting"] ?? 0,
//                                     roomWaitingArea:
//                                         data["roomWaitingArea"] ?? 0,
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   MidManWidget(
//                                     brokerRenting: data["brokerRenting"] ?? 0,
//                                     brokerRentingArea:
//                                         data["brokerRentingArea"] ?? 0,
//                                     brokerWaiting: data["brokerWaiting"] ?? 0,
//                                     brokerWaitingArea:
//                                         data["brokerWaitingArea"] ?? 0,
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   // const OwnerManagementScreen(),
//                                   // ContactOwner(),
//                                   const HelpWidget(),
//                                   // const DashBoardWidget(),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ));
//   }
// }

// class MonthMoney extends StatelessWidget {
//   final int totalMonthly;
//   // final int sellMonthly;
//   // final int brokerMonthly;
//   final int rentMonthly;
//   const MonthMoney({
//     Key? key,
//     required this.totalMonthly,
//     // required this.sellMonthly,
//     // required this.brokerMonthly,
//     required this.rentMonthly,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(
//             8.0,
//           ),
//           child: Text(
//             'Сарын орлого',
//             style: TextStyles.black16semibold,
//           ),
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height * 0.1,
//           decoration: BoxDecoration(
//             boxShadow: const [
//               BoxShadow(
//                 color: Color.fromARGB(121, 140, 139, 139),
//                 spreadRadius: 1,
//                 blurRadius: 2,
//                 offset: Offset(2, 3), // changes position of shadow
//               ),
//             ],
//             color: AppColors.secondaryColor,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   MonthlyWidget(
//                     totalMonthly: totalMonthly,
//                     text: 'Нийт орлого',
//                   ),
//                   MonthlyWidget(
//                     totalMonthly: rentMonthly,
//                     text: 'Түрээсийн',
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MonthlyWidget extends StatelessWidget {
//   const MonthlyWidget({
//     super.key,
//     required this.totalMonthly,
//     required this.text,
//   });

//   final int totalMonthly;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 1,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Container(
//           padding: const EdgeInsets.all(5),
//           height: MediaQuery.of(context).size.height * 0.08,
//           // width: 110,
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(12)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text(
//                 text,
//                 style: TextStyles.black14,
//               ),
//               Text(
//                 '$totalMonthly ₮',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                   fontSize: 15,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
