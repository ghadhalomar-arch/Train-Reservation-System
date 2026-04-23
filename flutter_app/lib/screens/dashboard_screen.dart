import 'package:flutter/material.dart';
import 'book_ticket_screen.dart';
import 'view_trains_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A90D9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A90D9),
        title: const Text(
          'Welcome, Admin',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCard(context, '📊 Total Bookings', '124', const BookTicketScreen()),
            const SizedBox(height: 12),
            _buildCard(context, '💰 Total Revenue', 'SAR 18,600', const BookTicketScreen()),
            const SizedBox(height: 12),
            _buildCard(context, '🎯 Seat Occupancy', '62%', const TrainListPage()),
            const SizedBox(height: 12),
            _buildCard(context, '💺 Available Seats', '76', const TrainListPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String value, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4A90D9)),
            ),
          ],
        ),
      ),
    );
  }
}
