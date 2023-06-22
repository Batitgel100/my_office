import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/model/room_model.dart';
import 'package:my_office/feature/screens/my_rooms/my_room_screen.dart';
import 'package:my_office/feature/screens/notification/owner_notif_screen.dart';
import 'package:my_office/feature/screens/owner/dashboard/broker/broker_dashboard.dart';
import 'package:my_office/feature/screens/owner/dashboard/dashboard_total_screen.dart';
import 'package:my_office/feature/screens/owner/dashboard/rent/rent_dashboard.dart';
import 'package:my_office/feature/screens/owner/dashboard/sell/sell_dashboard.dart';
import 'package:http/http.dart' as http;

bool seen = false;

class SecondDashboardScreen extends StatefulWidget {
  const SecondDashboardScreen({super.key});

  @override
  State<SecondDashboardScreen> createState() => _SecondDashboardScreenState();
}

class _SecondDashboardScreenState extends State<SecondDashboardScreen>
    with TickerProviderStateMixin {
  bool isLoading = true;

  FetchRoomList fetchRoomList = FetchRoomList();
  getGetRoomApi() async {
    List<RoomModel> rooms = await fetchRoomList.getRoomList();
    if (mounted) {
      setState(() {
        listRoom = rooms;
        isLoading = false;
      });
    }
  }

  List<RoomModel> listRoom = [];

  Map<String, dynamic> data = {};

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        // 'https://ub-office.mn/mobile/lessor/dashbboard/data/${Globals.userId}')); // Replace with your server URL
        'https://ub-office.mn/mobile/lessor/dashboard/data/9')); // Replace with your server URL

    if (response.statusCode == 200) {
      if (mounted) {
        setState(() {
          data = jsonDecode(response.body);
          isLoading = false;
        });
      }
    } else {
      print('Failed to fetch data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();

    fetchData();

    getGetRoomApi();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _appBar(context),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
            )
          : Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTabBar(tabController: tabController),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      // height: 100,
                      // width: MediaQuery.of(context).size.width * 0.95,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          // BrokerDashboardWidget(),
                          CustomTotalDashboardWidget(
                            totalYearly: data["totalYearly"] ?? 0,
                            totalMonthly: data["totalMonthly"] ?? 0,
                            brokerYearly: data["brokerYearly"] ?? 0,
                            rentYearly: data["rentYearly"] ?? 0,
                            sellYearly: data["sellYearly"] ?? 0,
                            rentMonthly: data["rentMonthly"] ?? 0,
                            brokerMonthly: data["brokerMonthly"] ?? 0,
                            sellMonthly: data["sellMonthly"] ?? 0,
                          ),

                          RentDashboardWidget(
                            rentYearly: data["rentYearly"] ?? 0,
                            rentMonthly: data["rentMonthly"] ?? 0,
                            roomRenting: data["roomRenting"] ?? 0,
                            roomRentingArea: data["roomRentingArea"] ?? 0,
                          ),
                          const SellDashboardWidget(),
                          BrokerDashboardWidget(
                            brokerMonthly: data["brokerYearly"] ?? 0,
                            brokerYearly: data["brokerYearly"] ?? 0,
                            roomBrokering: data["brokerYearly"] ?? 0,
                            roomBrokeringArea: data["brokerYearly"] ?? 0,
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

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'Хянах самбар',
        style: TextStyles.white17,
      ),
      backgroundColor: AppColors.mainColor,
      actions: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: InkWell(
            onTap: () {
              setState(() {
                seen = true;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationScreenOwner(),
                  ));
            },
            child: Stack(
              children: [
                const Icon(
                  Icons.notifications,
                  size: 30,
                ),
                seen
                    ? Container()
                    : Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(60)),
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [BoxShadows.shadow],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12)),
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.065,
      child: TabBar(
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.mainColor,
            boxShadow: const [BoxShadows.shadow2]),
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        isScrollable: true,
        controller: tabController,
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.secondBlack,
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
        tabs: const [
          Tab(
            child: Text('Нийт'),
          ),
          Tab(
            child: Text('Түрээсийн'),
          ),
          Tab(
            child: Text('Борлуулалтын'),
          ),
          Tab(
            child: Text('Зуучлалын'),
          ),
        ],
      ),
    );
  }
}
