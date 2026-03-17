import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'passenger_screen.dart';

class BookTicketScreen extends StatefulWidget {
  const BookTicketScreen({super.key});

  @override
  State<BookTicketScreen> createState() => _BookTicketScreenState();
}

class _BookTicketScreenState extends State<BookTicketScreen> {
  final TextEditingController trainIdController = TextEditingController();
  final TextEditingController seatNumberController = TextEditingController();

  Future<void> _bookTicket() async {
    try {
      final trainIdText = trainIdController.text.trim();
      final seatNumberText = seatNumberController.text.trim();

      if (trainIdText.isEmpty || seatNumberText.isEmpty) {
        _showMessage("Please fill in all fields", false);
        return;
      }

      final int? trainId = int.tryParse(trainIdText);

      if (trainId == null) {
        _showMessage("Train ID must be a number", false);
        return;
      }

      final seats = await DBHelper.instance.getAvailableSeats(trainId);

      if (seats <= 0) {
        _showMessage("No seats available for this train", false);
        return;
      }

      final seatTaken =
          await DBHelper.instance.isSeatTaken(trainId, seatNumberText);

      if (seatTaken) {
        _showMessage("This seat is already booked", false);
        return;
      }

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PassengerScreen(
            trainId: trainId,
            seatNumber: seatNumberText,
          ),
        ),
      );
    } catch (e) {
      _showMessage("Error: $e", false);
    }
  }

  void _showMessage(String message, bool success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.blue : Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    trainIdController.dispose();
    seatNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D8BFF),
              Color(0xFF1E5BFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                width: 380,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 34,
                      backgroundColor: Color(0xFFEAF3FF),
                      child: Icon(
                        Icons.train,
                        size: 34,
                        color: Color(0xFF1E73E8),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "Book Ticket",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E73E8),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Complete the reservation details below",
                      style: TextStyle(
fontSize: 15,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    _buildField(
                      controller: trainIdController,
                      label: "Train ID",
                      icon: Icons.confirmation_number_outlined,
                    ),
                    const SizedBox(height: 16),
                    _buildField(
                      controller: seatNumberController,
                      label: "Seat Number",
                      icon: Icons.event_seat_outlined,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _bookTicket,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E73E8),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          "Confirm Booking",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF1E73E8)),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),
        filled: true,
        fillColor: const Color(0xFFF8FBFF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFFE3ECF8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xFF1E73E8), width: 1.5),
        ),
      ),
    );
  }
}