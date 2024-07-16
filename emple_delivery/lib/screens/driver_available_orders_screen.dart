import 'package:flutter/material.dart';
import 'driver_home_screen.dart';
import 'delivery_accept_screen.dart';

class DriverAvailableOrdersScreen extends StatelessWidget {
  const DriverAvailableOrdersScreen({super.key});

  final List<Map<String, String>> availableDeliveries = const [
    {
      'sender': 'Sender 3',
      'receiver': 'Receiver 3',
      'item': 'Item 3',
      'weight': '1kg - 2kg',
      'start': 'Location A',
      'destination': 'Location B',
    },
    {
      'sender': 'Sender 4',
      'receiver': 'Receiver 4',
      'item': 'Item 4',
      'weight': '3kg - 5kg',
      'start': 'Location C',
      'destination': 'Location D',
    },
  ];

  void viewDeliveryDetails(BuildContext context, Map<String, String> delivery) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeliveryAcceptScreen(delivery: delivery),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Orders'),
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
        itemCount: availableDeliveries.length,
        itemBuilder: (context, index) {
          final delivery = availableDeliveries[index];
          return ListTile(
            title: Text('Sender: ${delivery['sender']}'),
            subtitle: Text('Receiver: ${delivery['receiver']}'),
            trailing: Text('Item: ${delivery['item']}'),
            onTap: () => viewDeliveryDetails(context, delivery),
          );
        },
      ),
    );
  }
}
