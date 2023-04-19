import 'package:flutter/material.dart';

class SelectedRoom extends StatefulWidget {
  final String roomId;
  const SelectedRoom({super.key, required this.roomId});

  @override
  State<SelectedRoom> createState() => _SelectedRoomState();
}

class _SelectedRoomState extends State<SelectedRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.roomId),
      ),
    );
  }
}
