import 'package:flutter/material.dart';

class DeliveryHistory extends StatelessWidget {
  const DeliveryHistory({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final deliveries = [
      {
        'id': '#5R9G87R',
        'date': '10 July 2024',
        'from': '1234 Piyasa',
        'to': '4 Kilo',
        'status': 'Delivered',
      },
      {
        'id': '#5R9G87R',
        'date': '12 July 2024',
        'from': '1234 Piyasa',
        'to': '4 Kilo',
        'status': 'Pending',
      },
    ];

    return ListView.builder(
      itemCount: deliveries.length,
      itemBuilder: (context, index) {
        final delivery = deliveries[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: const Icon(Icons.local_shipping),
            title: Text('${delivery['id']} • ${delivery['date']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('From: ${delivery['from']}'),
                Text('To: ${delivery['to']}'),
              ],
            ),
            trailing: Text(
              delivery['status']!,
              style: TextStyle(
                color: delivery['status'] == 'Delivered' ? Colors.green : Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}