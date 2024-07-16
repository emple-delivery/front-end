import 'package:flutter/material.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Profile'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'This is the Driver Profile Page.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
