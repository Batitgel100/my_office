import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';

class ManagementpaymentScreen extends StatefulWidget {
  const ManagementpaymentScreen({super.key});

  @override
  State<ManagementpaymentScreen> createState() =>
      _ManagementpaymentScreenState();
}

class _ManagementpaymentScreenState extends State<ManagementpaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Бусад төлбөр'),
          backgroundColor: AppColors.mainColor,
        ),
        backgroundColor: const Color.fromARGB(248, 230, 236, 240),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomPaymentButto(),
                  CustomPaymentButto(),
                ],
              )
            ],
          ),
        ));
  }
}

class CustomPaymentButton extends StatefulWidget {
  final String text;
  final BorderRadius radius;
  final String title;

  const CustomPaymentButton({
    super.key,
    required this.text,
    required this.radius,
    required this.title,
  });

  @override
  State<CustomPaymentButton> createState() => _CustomPaymentButtonState();
}

class _CustomPaymentButtonState extends State<CustomPaymentButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: widget.radius),
      height: 60,
      width: MediaQuery.of(context).size.width * 0.92,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyles.black17,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        widget.title,
                        style: TextStyles.black17,
                      ),
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

class CustomPaymentButto extends StatefulWidget {
  const CustomPaymentButto({
    super.key,
  });

  @override
  State<CustomPaymentButto> createState() => _CustomPaymentButtoState();
}

class _CustomPaymentButtoState extends State<CustomPaymentButto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width * 0.46,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Цахилгааны төлбөр',
              style: TextStyles.black17semibold,
            ),
            Row(
              children: const [
                Text('Дутуу'),
                Text(
                  '10000\$',
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
