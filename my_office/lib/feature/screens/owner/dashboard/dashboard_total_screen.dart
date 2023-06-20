import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';

class CustomTotalDashboardWidget extends StatelessWidget {
  const CustomTotalDashboardWidget({
    super.key,
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LeftSide(),
              RightSide(),
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
  const LeftSide({
    super.key,
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
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Жилийн нийт орлого',
                  style: TextStyles.white15semibold,
                ),
                Text(
                  '₮2.1 сая',
                  style: TextStyles.white17semibold,
                ),
              ],
            ),
          ),
          TotalAndAllWithoutShadow(),
          TotalAndAllWithoutShadow(),
          TotalAndAllWithoutShadow(),
        ],
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({
    super.key,
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
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Сарын нийт орлого',
                  style: TextStyles.white16semibold,
                ),
                Text(
                  '₮2.1 сая',
                  style: TextStyles.white17semibold,
                ),
              ],
            ),
          ),
          TotalAndAllWithoutShadow(),
          TotalAndAllWithoutShadow(),
          TotalAndAllWithoutShadow(),
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

class TotalAndAllWidget extends StatelessWidget {
  const TotalAndAllWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadows.shadow4],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Icon(Icons.insert_chart_outlined),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Түрээсийн',
                  style: TextStyles.grey14semibold,
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
    );
  }
}

class TotalAndAllWithoutShadow extends StatelessWidget {
  const TotalAndAllWithoutShadow({
    super.key,
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.insert_chart_outlined,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Түрээсийн',
                    style: TextStyles.grey14semibold,
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
      ),
    );
  }
}
