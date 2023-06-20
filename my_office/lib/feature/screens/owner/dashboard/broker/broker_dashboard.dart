import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/screens/owner/dashboard/dashboard_total_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BrokerDashboardWidget extends StatelessWidget {
  const BrokerDashboardWidget({
    super.key,
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
          Padding(
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
                              Text('1.1 сая \$',
                                  style: TextStyles.black17semibold),
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
                                  '40%',
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
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0.0),
                            child: Text('Энэ сар',
                                style: TextStyles.main17semibold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Түрээслэж буй талбай:',
                                style: TextStyles.black14,
                              ),
                              Text(
                                '3',
                                style: TextStyles.black14semibold,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Талбайн хэмжээ:',
                                style: TextStyles.black14,
                              ),
                              Text(
                                '345m2',
                                style: TextStyles.black14semibold,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Үлдэгдэл төлбөр:',
                                style: TextStyles.black14,
                              ),
                              Text(
                                '3 сая',
                                style: TextStyles.black14semibold,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Өмнөх төлбөр:',
                                style: TextStyles.black14,
                              ),
                              Text(
                                '3 сая',
                                style: TextStyles.black14semibold,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Нийт үлдэгдэл:',
                                style: TextStyles.black14,
                              ),
                              Text(
                                '3 сая',
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Жилийн нийт орлого',
                        style: TextStyles.black16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.insert_chart_outlined,
                            color: AppColors.mainColor,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '₮2.1 сая',
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Сарын нийт орлого',
                        style: TextStyles.black16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.insert_chart_outlined,
                            color: AppColors.mainColor,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '₮2.1 сая',
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
