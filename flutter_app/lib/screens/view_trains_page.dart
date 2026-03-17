import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'add_train_page.dart';

class TrainListPage extends StatefulWidget {
  const TrainListPage({super.key});

  @override
  State<TrainListPage> createState() => _TrainListPageState();
}

class _TrainListPageState extends State<TrainListPage> {
  List<Map<String, dynamic>> trains = [];

  Future<void> loadTrains() async {
    final data = await DBHelper.instance.getAllTrains();
    setState(() {
      trains = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadTrains();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Train Schedule"),
        backgroundColor: Colors.blue,
      ),
      body: trains.isEmpty
          ? const Center(child: Text("No trains available"))
          : ListView.builder(
              itemCount: trains.length,
              itemBuilder: (context, index) {
                final train = trains[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("Train ${train['trainNumber']}"),
                    subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Text("${train['source']} → ${train['destination']}"),
                     Text("Departure: ${train['departureTime']} | Arrival: ${train['arrivalTime']}"),
                     Text("Seats Available: ${train['availableSeats']}"),
                     Text("Price: ${train['price']} SAR"),
                     ],
                   ),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTrainPage(),
            ),
          );

          loadTrains();
        },
      ),
    );
  }
}