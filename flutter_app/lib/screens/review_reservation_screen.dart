import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class ReviewReservationScreen extends StatefulWidget {
  const ReviewReservationScreen({super.key});

  static const String routeName = '/reviewReservation';

  @override
  State<ReviewReservationScreen> createState() =>
      _ReviewReservationScreenState();
}

class _ReviewReservationScreenState extends State<ReviewReservationScreen> {
  late Future<List<Map<String, dynamic>>> reservationsFuture;

  @override
  void initState() {
    super.initState();
    reservationsFuture = DBHelper.instance.getAllReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Reservations"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: reservationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final reservations = snapshot.data ?? [];

          if (reservations.isEmpty) {
            return const Center(
              child: Text(
                'No reservations found',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              final reservation = reservations[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    'Reservation ID: ${reservation['reservationID']}',
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Passenger ID: ${reservation['passengerID']}'),
                      Text('Train ID: ${reservation['trainID']}'),
                      Text('Seats: ${reservation['seats']}'),
                      Text('Status: ${reservation['status']}'),
                      Text('Booking Date: ${reservation['bookingDate']}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
