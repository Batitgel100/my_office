import 'package:flutter/material.dart';
import 'package:my_office/feature1/constants/theme.dart';

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
        backgroundColor: AppColors.mainColor,
      ),
      body: const Center(
        child: Text('Төлбөрийн үлдэгдэл'),
      ),
    );
  }
}
