import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FoundScreen extends StatelessWidget {
  FoundScreen({super.key});

  final List<Map<String, String>> dummyDrivers = [
    {'name': 'Abebe Bikila', 'phone': '0912345678', 'vehicle': 'Bike', 'licensePlate': 'AB1234'},
    {'name': 'Kenenisa Bekele', 'phone': '0912345679', 'vehicle': 'Motorbike', 'licensePlate': 'CD5678'},
    {'name': 'Haile Gebrselassie', 'phone': '0912345680', 'vehicle': 'Car', 'licensePlate': 'EF6789'},
    {'name': 'Derartu Tulu', 'phone': '0912345681', 'vehicle': 'Truck', 'licensePlate': 'GH7890'},
    {'name': 'Meseret Defar', 'phone': '0912345682', 'vehicle': 'Bike', 'licensePlate': 'IJ8901'},
    {'name': 'Tirunesh Dibaba', 'phone': '0912345683', 'vehicle': 'Motorbike', 'licensePlate': 'KL9012'},
    {'name': 'Mamo Wolde', 'phone': '0912345684', 'vehicle': 'Car', 'licensePlate': 'MN0123'},
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final selectedTransportation = args['transportation'];
    final driverData = dummyDrivers.firstWhere((driver) => driver['vehicle'] == selectedTransportation);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in progress'),
        backgroundColor: Colors.green,
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
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(driverData['name']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone: ${driverData['phone']}'),
                    Text('Vehicle: ${driverData['vehicle']}'),
                    Text('License Plate: ${driverData['licensePlate']}'),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () {
                    // Handle call action
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
