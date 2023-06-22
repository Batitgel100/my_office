import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';

class CustomTotalDashboardWidget extends StatelessWidget {
  final int rentMonthly;
  final int totalYearly;

  final int totalMonthly;
  final int rentYearly;
  final int sellYearly;
  final int brokerYearly;
  final int brokerMonthly;
  final int sellMonthly;
  const CustomTotalDashboardWidget({
    super.key,
    required this.rentMonthly,
    required this.totalYearly,
    required this.totalMonthly,
    required this.rentYearly,
    required this.sellYearly,
    required this.brokerYearly,
    required this.brokerMonthly,
    required this.sellMonthly,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadows.shadow3]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LeftSide(
                totalYearly: totalYearly,
                brokerYearly: brokerYearly,
                rentYearly: rentYearly,
                sellYearly: sellYearly,
              ),
              RightSide(
                rentMonthly: rentMonthly,
                totalMonthly: totalMonthly,
                brokerMonthly: brokerMonthly,
                sellMonthly: sellMonthly,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Талбайн мэдээлэл',
              style: TextStyles.black17,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(2.0),
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
        ],
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  final int totalYearly;
  final int rentYearly;
  final int sellYearly;
  final int brokerYearly;

  const LeftSide({
    super.key,
    required this.totalYearly,
    required this.rentYearly,
    required this.sellYearly,
    required this.brokerYearly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      width: MediaQuery.of(context).size.width * 0.465,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.mainColor,
        // boxShadow: const [BoxShadows.shadow2],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Жилийн нийт орлого',
                  style: TextStyles.white15semibold,
                ),
                Text(
                  '₮$totalYearly сая',
                  style: TextStyles.white17semibold,
                ),
              ],
            ),
          ),
          TotalAndAllWithoutShadow(
            text: 'Түрээсийн',
            totalRentAmountYear: rentYearly,
          ),
          TotalAndAllWithoutShadow(
            text: 'Борлуулалтын',
            totalRentAmountYear: sellYearly,
          ),
          TotalAndAllWithoutShadow(
            text: 'Зуучлалын',
            totalRentAmountYear: brokerYearly,
          ),
        ],
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  final int totalMonthly;
  final int rentMonthly;
  final int brokerMonthly;
  final int sellMonthly;

  const RightSide({
    super.key,
    required this.rentMonthly,
    required this.totalMonthly,
    required this.brokerMonthly,
    required this.sellMonthly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      width: MediaQuery.of(context).size.width * 0.465,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.secondaryColor,
        // boxShadow: const [BoxShadows.shadow2],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Сарын нийт орлого',
                  style: TextStyles.white16semibold,
                ),
                Text(
                  '₮$totalMonthly сая',
                  style: TextStyles.white17semibold,
                ),
              ],
            ),
          ),
          TotalAndAllWithoutShadow(
            text: 'Түрээсийн',
            totalRentAmountYear: rentMonthly,
          ),
          TotalAndAllWithoutShadow(
            text: 'Борлуулалтын',
            totalRentAmountYear: sellMonthly,
          ),
          TotalAndAllWithoutShadow(
            text: 'Зуучлалын',
            totalRentAmountYear: brokerMonthly,
          ),
        ],
      ),
    );
  }
}

class SpaceInformation extends StatelessWidget {
  const SpaceInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              // BoxShadows.shadow3,
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: AppColors.secondaryColor),
                  child: const Center(
                    child: Text(
                      '0',
                      style: TextStyles.white14semibold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Хугацаа хэтэрсэн',
                    style: TextStyles.black17,
                  ),
                  Text(
                    'энэ сар',
                    style: TextStyles.grey15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TotalAndAllWithoutShadow extends StatelessWidget {
  final int totalRentAmountYear;
  final String text;

  const TotalAndAllWithoutShadow({
    super.key,
    required this.totalRentAmountYear,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            // boxShadow: const [BoxShadows.shadow4],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.insert_chart_outlined,
                  size: 30,
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyles.grey14semibold,
                    ),
                    Text(
                      '₮$totalRentAmountYear сая',
                      style: TextStyles.black15semibold,
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
}
