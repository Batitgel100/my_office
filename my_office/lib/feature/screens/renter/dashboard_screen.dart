import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/model/room_model.dart';
import 'package:my_office/feature/screens/my_rooms/my_room_screen.dart';
import 'package:my_office/feature/screens/renter/payment_history.dart';
import 'package:my_office/feature/screens/renter/payment_screen.dart';
import 'package:my_office/feature/widgets/advertise_widget.dart';

bool isLoading = true;
bool clicked = false;

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var _selectedIndex = 0;
  FetchRoomList fetchRoomList = FetchRoomList();

  List<RoomModel> listRoom = [];
  getGetRoomApi() async {
    List<RoomModel> rooms = await fetchRoomList.getRoomList();
    if (mounted) {
      setState(() {
        listRoom = rooms;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getGetRoomApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Нүүр хуудас'),
        backgroundColor: AppColors.mainColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 1,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    controller: PageController(viewportFraction: 0.9),
                    itemCount: advertiseList.length,
                    itemBuilder: (context, index) {
                      return AdvertiseItem(
                        advertise: advertiseList[index],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      advertiseList.length,
                      (index) => Indicator(
                        isActive: _selectedIndex == index ? true : false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      children: [
                        const AllPayment(),
                        MyRenting(listRoom: listRoom),
                        const PaymentWidget(),
                        const Tovchluur(),
                        // const HelpWidget1(),
                        const ManagementPaymentWidget(),

                        // const ContactWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AllPayment extends StatelessWidget {
  const AllPayment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11.0),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(137, 158, 158, 158),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(
                    2.0, // Move to right 7.0 horizontally
                    2.0, // Move to bottom 8.0 Vertically
                  ),
                ),
              ],
              // color: AppColors.mainColor,
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text('Төлөх', style: TextStyles.main17semibold),
                        SizedBox(
                          height: 15,
                        ),
                        Text('1\'000\'000'),
                      ],
                    ),
                  ),
                ),
                const TitleLine(),
                Expanded(
                  child: Container(
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text('Төлсөн', style: TextStyles.main17semibold),
                        SizedBox(
                          height: 15,
                        ),
                        Text('1\'000\'000'),
                      ],
                    ),
                  ),
                ),
                const TitleLine(),
                Expanded(
                  child: Container(
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text('Үлдсэн', style: TextStyles.main17semibold),
                        SizedBox(
                          height: 15,
                        ),
                        Text('1\'000\'000'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: 10,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}

class TitleLine extends StatelessWidget {
  const TitleLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 90,
      // color: const Color.fromARGB(255, 140, 139, 139),
      color: AppColors.mainColor,
    );
  }
}

class Tovchluur extends StatelessWidget {
  const Tovchluur({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PaymentHistoryScreen(),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.47,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(137, 158, 158, 158),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(
                      1.0, // Move to right 7.0 horizontally
                      1.0, // Move to bottom 8.0 Vertically
                    ),
                  ),
                ],
              ),
              child: const Center(
                child: Text('Төлбөрийн түүх харах'),
              ),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(137, 158, 158, 158),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(
                    1.0, // Move to right 7.0 horizontally
                    1.0, // Move to bottom 8.0 Vertically
                  ),
                ),
              ],
            ),
            child: const Center(
              child: Text('Түрээс төлөх'),
            ),
          ),
        ],
      ),
    );
  }
}

class HelpWidget extends StatelessWidget {
  const HelpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Uri url = Uri.parse('https://youtube.com');

    // Future<void> lnchUrl() async {
    //   if (!await launchUrl(url)) {
    //     throw Exception('Could not launch $url');
    //   }
    // }

    return InkWell(
      onTap: () {
        // lnchUrl();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.help_outline_outlined,
                color: Colors.white,
                size: 40,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            //   child: Text(
            //     'Тусламж',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 13,
            //         fontWeight: FontWeight.w500),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class ManagementPaymentWidget extends StatelessWidget {
  const ManagementPaymentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(137, 158, 158, 158),
              blurRadius: 5,
              spreadRadius: 0.6,
              offset: Offset(
                1.0, // Move to right 7.0 horizontally
                1.0, // Move to bottom 8.0 Vertically
              ),
            ),
          ],
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Бусад төлбөр',
                style: TextStyles.white14semibold,
              ),
              const SizedBox(
                height: 12,
              ),
              const Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        'Төрөл',
                        style: TextStyles.white14semibold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        'Үлдэгдэл',
                        style: TextStyles.white14semibold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Цахилгаан',
                            // style:
                            //     TextStyles.black14semibold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(child: Text('2')),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Ус дулаан',
                            // style:
                            //     TextStyles.black14semibold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(child: Text('10000000\$')),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PaymentScreen(),
            ),
          );
        },
        child: Ink(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(137, 158, 158, 158),
                blurRadius: 5,
                spreadRadius: 0.6,
                offset: Offset(
                  1.0, // Move to right 7.0 horizontally
                  1.0, // Move to bottom 8.0 Vertically
                ),
              ),
            ],
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Түрээсийн үлдэгдэл:',
                                style: TextStyles.white15semibold,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.33,
                              ),
                              const Text(
                                '1\'000\'000₮',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '2026.04.01',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.53,
                              ),
                              const Text(
                                '2023.05.01',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyRenting extends StatelessWidget {
  const MyRenting({
    Key? key,
    required this.listRoom,
  }) : super(key: key);

  final List<RoomModel> listRoom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MyRoomScreen(),
            ),
          );
        },
        child: Ink(
          height: 80,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(137, 158, 158, 158),
                blurRadius: 5,
                spreadRadius: 0.6,
                offset: Offset(
                  1.0, // Move to right 7.0 horizontally
                  1.0, // Move to bottom 8.0 Vertically
                ),
              ),
            ],
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                const Expanded(
                  flex: 9,
                  child: Text(
                    'Миний түрээсэлж буй өрөө',
                    style: TextStyles.white14,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: isLoading
                          ? Transform.scale(
                              scale: 0.8,
                              child: const CircularProgressIndicator(
                                color: AppColors.mainColor,
                              ),
                            )
                          : Text(
                              '${listRoom.length}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 59, 153, 148),
                                fontSize: 14,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
