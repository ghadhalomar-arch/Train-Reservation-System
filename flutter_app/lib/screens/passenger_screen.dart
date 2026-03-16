import 'package:flutter/material.dart';
import 'Cancel_screen.dart'; 

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
                // مؤقت: لا يستدعي الصفحة نفسها لتجنب الخطأ
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Booking page not ready yet")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Book Reservation", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // فتح صفحة Cancel Reservation
                Navigator.pushNamed(context, CancelReservationPage.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Cancel Reservation", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // هنا الفريق يضيف صفحة Catalog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Catalog", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}