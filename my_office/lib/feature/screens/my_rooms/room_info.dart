import 'package:flutter/material.dart';
import 'package:my_office/feature/screens/my_rooms/selected_room.dart';

import '../../constants/theme.dart';

class RoomInfoScreen extends StatefulWidget {
  final String buildingName;
  final String doorNumber;
  final String floor;
  final String address;
  final String wallHeight;
  final String rentalFee;
  final String totelRent;
  final String owner;
  final String ownerEmail;
  final String ownerPhone;
  final String status;

  const RoomInfoScreen(
      {super.key,
      required this.buildingName,
      required this.doorNumber,
      required this.floor,
      required this.address,
      required this.wallHeight,
      required this.rentalFee,
      required this.totelRent,
      required this.owner,
      required this.ownerEmail,
      required this.ownerPhone,
      required this.status});

  @override
  State<RoomInfoScreen> createState() => _RoomInfoScreenState();
}

class _RoomInfoScreenState extends State<RoomInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('Дэлгэрэнгүй мэдээлэл'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              // height: 520,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  // color: AppColors.mainColor,
                  border: Border.all(color: AppColors.mainColor, width: 5),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  MyRoomWidget(
                    text: 'Төлөв',
                    text2: widget.status,
                  ),
                  MyRoomWidget(
                    text: 'Барилгын нэр',
                    text2: widget.buildingName,
                  ),
                  MyRoomWidget(
                    text: 'Тоот',
                    text2: widget.doorNumber,
                  ),
                  MyRoomWidget(
                    text: 'Сарын түрээс',
                    text2: widget.rentalFee,
                  ),
                  MyRoomWidget(
                    text: 'Нийт түрээс',
                    text2: widget.totelRent,
                  ),
                  MyRoomWidget(
                    text: 'Хананы өндөр',
                    text2: widget.wallHeight,
                  ),
                  MyRoomWidget(
                    text: 'Давхар',
                    text2: widget.floor,
                  ),
                  MyRoomWidget(
                    text: 'Эзэмшигч',
                    text2: widget.owner,
                  ),
                  MyRoomWidget(
                    text: 'Эзэмшигчийн Имэйл',
                    text2: widget.ownerEmail,
                  ),
                  MyRoomWidget(
                    text: 'Эзэмшигчийн утас',
                    text2: widget.ownerPhone,
                  ),
                  MyRoomWidget(
                    text: 'Хаяг',
                    text2: widget.address,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
