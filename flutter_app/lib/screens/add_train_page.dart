import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class AddTrainPage extends StatefulWidget {
  const AddTrainPage({super.key});

  @override
  State<AddTrainPage> createState() => _AddTrainPageState();
}

class _AddTrainPageState extends State<AddTrainPage> {
  final _formKey = GlobalKey<FormState>();

  final trainNumberController = TextEditingController();
  final sourceController = TextEditingController();
  final destinationController = TextEditingController();
  final departureController = TextEditingController();
  final arrivalController = TextEditingController();
  final capacityController = TextEditingController();
  final priceController = TextEditingController();

  Future<void> addTrain() async {
    if (_formKey.currentState!.validate()) {

      final int capacity = int.parse(capacityController.text);

      final train = {
        'trainNumber': trainNumberController.text,
        'source': sourceController.text,
        'destination': destinationController.text,
        'departureTime': departureController.text,
        'arrivalTime': arrivalController.text,
        'capacity': capacity,
        'availableSeats': capacity, // يبدأ بنفس عدد المقاعد
        'price': double.parse(priceController.text),
      };

      await DBHelper.instance.addTrain(train);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Train added successfully")),
      );

      // تنظيف الحقول
      trainNumberController.clear();
      sourceController.clear();
      destinationController.clear();
      departureController.clear();
      arrivalController.clear();
      capacityController.clear();
      priceController.clear();

      // الرجوع لصفحة القطارات
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Train"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [

                TextFormField(
                  controller: trainNumberController,
                  decoration: const InputDecoration(
                    labelText: "Train Number",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter train number" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: sourceController,
                  decoration: const InputDecoration(
                    labelText: "Source",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter source" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: destinationController,
                  decoration: const InputDecoration(
                    labelText: "Destination",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter destination" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: departureController,
                  decoration: const InputDecoration(
                    labelText: "Departure Time",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter departure time" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: arrivalController,
                  decoration: const InputDecoration(
                    labelText: "Arrival Time",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter arrival time" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: capacityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Capacity",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter capacity" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Price",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter price" : null,
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: addTrain,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Add Train",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}