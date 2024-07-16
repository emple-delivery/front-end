import 'package:flutter/material.dart';
import 'driver_home_screen.dart';

class DriverPastOrdersScreen extends StatelessWidget {
  const DriverPastOrdersScreen({super.key});

  final List<Map<String, String>> pastDeliveries = const [
    {
      'sender': 'Sender 1',
      'receiver': 'Receiver 1',
      'item': 'Item 1',
      'weight': '2kg - 3kg',
      'start': 'Location E',
      'destination': 'Location F',
    },
    {
      'sender': 'Sender 2',
      'receiver': 'Receiver 2',
      'item': 'Item 2',
      'weight': '4kg - 6kg',
      'start': 'Location G',
      'destination': 'Location H',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Orders'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DriverHomeScreen()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: pastDeliveries.length,
        itemBuilder: (context, index) {
          final delivery = pastDeliveries[index];
          return ListTile(
            title: Text('Sender: ${delivery['sender']}'),
            subtitle: Text('Receiver: ${delivery['receiver']}'),
            trailing: Text('Item: ${delivery['item']}'),
          );
        },
      ),
    );
  }
}
