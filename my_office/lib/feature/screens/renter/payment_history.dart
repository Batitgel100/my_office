import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('history'),
      ),
      backgroundColor: const Color.fromARGB(255, 242, 249, 255),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 3,
                      color: Color.fromARGB(95, 158, 158, 158),
                      offset: Offset(1, 1),
                    ),
                  ],
                  color: Colors.white,
                  border: Border.all(
                    width: 0.3,
                    color: const Color.fromARGB(255, 149, 147, 147),
                  ),
                ),
                child: Center(
                  child: Text('2023.02.$index'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
