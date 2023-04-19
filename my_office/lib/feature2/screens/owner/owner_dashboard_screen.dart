import 'package:flutter/material.dart';

class DashboardScreenOwner extends StatefulWidget {
  const DashboardScreenOwner({super.key});

  @override
  State<DashboardScreenOwner> createState() => _DashboardScreenOwnerState();
}

class _DashboardScreenOwnerState extends State<DashboardScreenOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Нүүр хуудас'),
      ),
      body: const Center(
        child: Text(
          'coming soon...',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
