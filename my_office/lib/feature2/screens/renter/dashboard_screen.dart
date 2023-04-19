import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_office/feature1/constants/theme.dart';
import 'package:my_office/feature2/model/room_model.dart';
import 'package:my_office/feature2/screens/renter/management_payment_screen.dart';
import 'package:my_office/feature2/screens/renter/my_room_screen.dart';
import 'package:my_office/feature2/screens/renter/payment_screen.dart';
import 'package:my_office/feature2/widgets/advertise_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
                Column(
                  children: [
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
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      children: [
                        Expanded(
                          child: StaggeredGrid.count(
                            crossAxisCount: 4,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            children: [
                              MyRenting(listRoom: listRoom),
                              const PaymentWidget(),
                              const ManagementPaymentWidget(),
                              const ContactWidget(),
                              const HelpWidget(),
                            ],
                          ),
                        ),
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

class HelpWidget extends StatelessWidget {
  const HelpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://youtube.com');

    Future<void> lnchUrl() async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1.2,
      child: InkWell(
        onTap: () {
          lnchUrl();
        },
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.help_outline_outlined,
                color: Colors.white,
                size: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: Text(
                  'Тусламж',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1.2,
      child: InkWell(
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                EvaIcons.messageCircleOutline,
                color: Colors.white,
                size: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Text(
                  'Ажилтантай холбогдох',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
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
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ManagementpaymentScreen(),
            ),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Менежментийн зардал',
                  style: TextStyles.white14semibold,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '0₮',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 20,
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

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2.2,
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
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Төлбөрийн үлдэгдэл',
                  style: TextStyles.white14semibold,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '0₮',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 20,
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
    return StaggeredGridTile.count(
      crossAxisCellCount: 4,
      mainAxisCellCount: 1.5,
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
          decoration: BoxDecoration(
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
                    'Миний түрээслэж буй өрөө',
                    style: TextStyles.white17semibold,
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
                                color: AppColors.mainColor,
                                fontSize: 20,
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Worm extends StatelessWidget {
  const Worm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 8,
          width: 20,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(60)),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(60)),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(60)),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(60)),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}

class CustomDashBoardButton extends StatefulWidget {
  final String text;
  final String number;
  const CustomDashBoardButton({
    Key? key,
    required this.text,
    required this.number,
  }) : super(key: key);

  @override
  State<CustomDashBoardButton> createState() => _CustomDashBoardButtonState();
}

class _CustomDashBoardButtonState extends State<CustomDashBoardButton> {
  double _padding = 4;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Center(
        child: GestureDetector(
          onTapDown: (_) => setState(
            () {
              _padding = 0.0;
            },
          ),
          onTapUp: (_) => setState(
            () {
              _padding = 4;
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MyRoomScreen()));
            },
          ),
          child: AnimatedContainer(
            padding: EdgeInsets.only(
              bottom: _padding,
            ),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(20),
            ),
            duration: const Duration(
              milliseconds: 100,
            ),
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.mainColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.text,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                        // color: Colors.transparent,
                        border:
                            Border.all(width: 1.5, color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          widget.number,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
