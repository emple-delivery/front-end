import 'package:flutter/material.dart';
import 'delivery_detail_screen.dart';

class DeliveryAcceptScreen extends StatelessWidget {
  final Map<String, String> delivery;

  const DeliveryAcceptScreen({super.key, required this.delivery});

  void acceptDelivery(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DeliveryDetailScreen(
          sender: delivery['sender']!,
          receiver: delivery['receiver']!,
          item: delivery['item']!,
          start: delivery['start']!,
          destination: delivery['destination']!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Details'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sender: ${delivery['sender']}'),
            Text('Receiver: ${delivery['receiver']}'),
            Text('Item: ${delivery['item']}'),
            Text('Weight: ${delivery['weight']}'),
            Text('Start: ${delivery['start']}'),
            Text('Destination: ${delivery['destination']}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => acceptDelivery(context),
              child: const Text('Accept'),
            ),
          ],
        ),
      ),
    );
  }
}
