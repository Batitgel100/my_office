import 'package:flutter/material.dart';

import '../../../../constants/theme.dart';

class AllSpace extends StatelessWidget {
  final int roomRentingArea;
  final int roomWaitingArea;
  final int roomRenting;
  final int roomWaiting;
  const AllSpace({
    Key? key,
    required this.roomRentingArea,
    required this.roomWaitingArea,
    required this.roomRenting,
    required this.roomWaiting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Text('Түрээслүүлж буй талбай', style: TextStyles.black16semibold),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(121, 140, 139, 139),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(2, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 4,
                      child: Text('Төлөв', style: TextStyles.white12semibold),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('Хэмжээ', style: TextStyles.white12semibold),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('Тоо /ш', style: TextStyles.white12semibold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Түрээслэгдсэн',

                              // style:
                              //     TextStyles.black14semibold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.26,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                              child: Text(
                            '$roomRentingArea m2',
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text('$roomRenting')),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Хүлээгдэж буй',
                              // style:
                              //     TextStyles.black14semibold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.26,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text('$roomWaitingArea m2')),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text('$roomWaiting')),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
