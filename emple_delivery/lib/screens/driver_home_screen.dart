import 'package:flutter/material.dart';
import '../widgets/driver_bottom_nav_bar.dart';
import 'delivery_accept_screen.dart';
import 'driver_available_orders_screen.dart';
import 'driver_past_orders_screen.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  final List<Map<String, String>> pastDeliveries = [
    {
      'sender': 'Sender 1',
      'receiver': 'Receiver 1',
      'item': 'Item 1',
    },
    {
      'sender': 'Sender 2',
      'receiver': 'Receiver 2',
      'item': 'Item 2',
    },
  ];

  final List<Map<String, String>> availableDeliveries = [
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

  void viewDeliveryDetails(Map<String, String> delivery) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeliveryAcceptScreen(delivery: delivery),
      ),
    );
  }

  void navigateToAvailableOrders() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DriverAvailableOrdersScreen()),
    );
  }

  void navigateToPastOrders() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DriverPastOrdersScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Home Page'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Past Deliveries',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...pastDeliveries.map((delivery) {
              return ListTile(
                title: Text('Sender: ${delivery['sender']}'),
                subtitle: Text('Receiver: ${delivery['receiver']}'),
                trailing: Text('Item: ${delivery['item']}'),
                onTap: navigateToPastOrders,
              );
            }),
            const SizedBox(height: 20),
            const Text(
              'Available Deliveries',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...availableDeliveries.map((delivery) {
              return ListTile(
                title: Text('Sender: ${delivery['sender']}'),
                subtitle: Text('Receiver: ${delivery['receiver']}'),
                trailing: Text('Item: ${delivery['item']}'),
                onTap: () => viewDeliveryDetails(delivery),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: const DriverBottomNavBar(),
    );
  }
}
