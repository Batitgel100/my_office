import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  void _delete(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            // title: const Text('P'),
            content: const Text('Мэдэгдэлийг устгахуу?'),
            actions: [
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  });
                },
                isDefaultAction: true,
                isDestructiveAction: true,
                child: const Text('Тийм'),
              ),
              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                isDefaultAction: false,
                isDestructiveAction: false,
                child: const Text('Тийм'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text(''),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //     child: InkWell(
        //       onTap: () {
        //         _delete(context);
        //         // _isShown == true ? () => _delete(context) : null;
        //         // Navigator.pop(context);
        //       },
        //       child: const Icon(
        //         Icons.delete_outline_rounded,
        //         size: 30,
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color.fromARGB(141, 101, 105, 111),
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.95,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'WorldNet',
                    style: TextStyles.black22semibold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Өдрийн мэнд. Та гэрээгээ сунгах бол манай байгууллагатай холбогдоно уу?',
                    style: TextStyles.black17,
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
