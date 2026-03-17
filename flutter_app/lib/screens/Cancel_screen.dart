import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class CancelReservationPage extends StatefulWidget {
  const CancelReservationPage({Key? key}) : super(key: key);

  static const routeName = '/cancel';

  @override
  State<CancelReservationPage> createState() => _CancelReservationPageState();
}

class _CancelReservationPageState extends State<CancelReservationPage> {
  TextEditingController reservationController = TextEditingController();

  Future<void> cancelReservation() async {
    if (reservationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter Reservation ID")),
      );
      return;
    }

    int id = int.parse(reservationController.text);

    await DBHelper.instance.updateReservationStatus(id, "Cancelled");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Reservation Cancelled")),
    );

    reservationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF538CCB),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Cancel Reservation",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF538CCB),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: reservationController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: "Reservation ID",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: cancelReservation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF538CCB),
                ),
                child: const Text("Cancel"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}