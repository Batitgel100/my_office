import 'package:flutter/material.dart';

import '../../../../constants/theme.dart';

class AllMoneyWidget extends StatelessWidget {
  final int sellYearly;
  final int rentYearly;
  final int totalYearly;
  final int brokerYearly;
  const AllMoneyWidget({
    Key? key,
    required this.sellYearly,
    required this.rentYearly,
    required this.totalYearly,
    required this.brokerYearly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Жилийн орлого',
            style: TextStyles.black16semibold,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(121, 140, 139, 139),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(2, 3), // changes position of shadow
              ),
            ],
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    YearlyWidget(
                      totalYearly: totalYearly,
                      text: 'Нийт орлого',
                    ),
                    YearlyWidget(
                      totalYearly: rentYearly,
                      text: 'Түрээсийн',
                    )
                  ],
                ),
                Row(
                  children: [
                    YearlyWidget(
                      totalYearly: sellYearly,
                      text: 'Борлуулалтын',
                    ),
                    YearlyWidget(
                      totalYearly: brokerYearly,
                      text: 'Зуучлалын',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class YearlyWidget extends StatelessWidget {
  const YearlyWidget({
    super.key,
    required this.totalYearly,
    required this.text,
  });
  final String text;
  final int totalYearly;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height * 0.085,
          // width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: TextStyles.black14,
              ),
              Text(
                '$totalYearly ₮',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
