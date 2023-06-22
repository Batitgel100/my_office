import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/screens/owner/dashboard/dashboard_total_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

bool rentLoading = true;

class RentDashboardWidget extends StatelessWidget {
  final int rentMonthly;
  final int rentYearly;
  final int roomRenting;
  final int roomRentingArea;
  const RentDashboardWidget({
    super.key,
    required this.rentYearly,
    required this.rentMonthly,
    required this.roomRenting,
    required this.roomRentingArea,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.05,
      width: 300,
      child: ListView(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, left: 10),
                child: Text(
                  'Түрээсийн хянах самбар',
                  style: TextStyles.black17,
                ),
              ),
            ],
          ),
          AllMonthWidget(
            roomRenting: roomRenting,
            roomRentingArea: roomRentingArea,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.445,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                  boxShadow: const [BoxShadows.shadow3],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Жилийн нийт орлого',
                        style: TextStyles.black16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.insert_chart_outlined,
                            color: AppColors.mainColor,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          '₮$rentYearly сая',
                          style: TextStyles.black17semibold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.445,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                  boxShadow: const [BoxShadows.shadow3],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Сарын нийт орлого',
                        style: TextStyles.black16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.insert_chart_outlined,
                            color: AppColors.mainColor,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          '₮$rentMonthly сая',
                          style: TextStyles.black17semibold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Түрээсийн талбайн мэдээлэл',
                  style: TextStyles.black17,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.93,
                child: const Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Column(
                    children: [
                      SpaceInformation(),
                      SpaceInformation(),
                      SpaceInformation(),
                      SpaceInformation(),
                      SpaceInformation(),
                      SpaceInformation(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class AllMonthWidget extends StatelessWidget {
  final int roomRentingArea;
  final int roomRenting;
  const AllMonthWidget({
    super.key,
    required this.roomRenting,
    required this.roomRentingArea,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.92,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          boxShadow: const [BoxShadows.shadow3],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Нийт түрээсийн орлого',
                            style: TextStyles.black14),
                        Text('сая \$', style: TextStyles.black17semibold),
                      ],
                    ),
                    CircularPercentIndicator(
                      radius: 77,
                      lineWidth: 10,
                      percent: 0.4,
                      progressColor: AppColors.mainColor,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: AppColors.greyBack,
                      center: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Талбайн дүүргэлт',
                            style: TextStyles.black13,
                          ),
                          Text(
                            '%',
                            style: TextStyles.black22semibold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.445,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Text('Энэ сар', style: TextStyles.main17semibold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Түрээслэж буй талбай:',
                          style: TextStyles.black14,
                        ),
                        Text(
                          ' ${roomRenting.toString()}',
                          style: TextStyles.black14semibold,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Талбайн хэмжээ:',
                          style: TextStyles.black14,
                        ),
                        Text(
                          '$roomRentingArea m2',
                          style: TextStyles.black14semibold,
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Үлдэгдэл төлбөр:',
                          style: TextStyles.black14,
                        ),
                        Text(
                          'сая',
                          style: TextStyles.black14semibold,
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Өмнөх төлбөр:',
                          style: TextStyles.black14,
                        ),
                        Text(
                          'сая',
                          style: TextStyles.black14semibold,
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Нийт үлдэгдэл:',
                          style: TextStyles.black14,
                        ),
                        Text(
                          'сая',
                          style: TextStyles.black14semibold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
