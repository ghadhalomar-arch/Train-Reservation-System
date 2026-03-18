import 'package:flutter/material.dart';
import 'Cancel_screen.dart';
import 'book_ticket_screen.dart';
class PassengerMenuScreen extends StatelessWidget {
  const PassengerMenuScreen({super.key});

  static const String routeName = '/passengermenu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Management'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, BookTicketScreen.routeName);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    minimumSize: const Size(double.infinity, 50),
  ),
  child: const Text(
    "Book Reservation",
    style: TextStyle(fontSize: 18),
  ),
),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  CancelReservationPage.routeName,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Cancel Reservation",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Catalog page not ready yet")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Catalog",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}