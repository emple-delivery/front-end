import 'package:flutter/material.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final _formKey = GlobalKey<FormState>();
  String _itemName = '';
  String _receiverPhoneNumber = '';
  String _selectedTransportation = 'Bike'; // Default selected transportation
  String _selectedWeightRange = '1-5'; // Default selected weight range

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Item(s)'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Item name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an item name.';
                  }
                  _itemName = value;
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Item weight'),
                value: _selectedWeightRange,
                items: <String>['1-5', '5-10', '10-15', '15+'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedWeightRange = newValue!;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Mode of transportation'),
                value: _selectedTransportation,
                items: <String>['Bike', 'Motorbike', 'Car', 'Truck'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTransportation = newValue!;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Receiver\'s phone number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the receiver\'s phone number.';
                  }
                  _receiverPhoneNumber = value;
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      '/loading',
                      arguments: {
                        'transportation': _selectedTransportation,
                      },
                    );
                  }
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
