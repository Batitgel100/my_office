import 'package:flutter/material.dart';

import '../../../../constants/theme.dart';

class Garchig extends StatelessWidget {
  const Garchig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(136, 184, 183, 183),
            blurRadius: 10.0,
            spreadRadius: 1,
            offset: Offset(
              1.0, // Move to right 7.0 horizontally
              1.0, // Move to bottom 8.0 Vertically
            ),
          ),
        ],
        // color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Оффис түрээсийн хянах самбар',
                style: TextStyles.black14,
              ),
            ],
          ),
          // const Padding(
          //   padding: EdgeInsets.only(right: 15.0),
          //   child: Text(
          //     'WorldNet',
          //     style: TextStyles.main15semibold,
          //   ),
          // ),
        ],
      ),
    );
  }
}
