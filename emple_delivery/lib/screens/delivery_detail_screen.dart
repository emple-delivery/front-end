import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DeliveryDetailScreen extends StatelessWidget {
  final String sender;
  final String receiver;
  final String item;
  final String start;
  final String destination;

  const DeliveryDetailScreen({
    super.key,
    required this.sender,
    required this.receiver,
    required this.item,
    required this.start,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in Progress'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: SpinKitCircle(
                color: Colors.green,
                size: 100.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Delivery Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Sender: $sender'),
                    Text('Receiver: $receiver'),
                    Text('Item: $item'),
                    Text('Start: $start'),
                    Text('Destination: $destination'),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.phone),
                              onPressed: () {
                                // Add call functionality here
                              },
                            ),
                            const Text('Call Sender'),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.phone),
                              onPressed: () {
                                // Add call functionality here
                              },
                            ),
                            const Text('Call Receiver'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
