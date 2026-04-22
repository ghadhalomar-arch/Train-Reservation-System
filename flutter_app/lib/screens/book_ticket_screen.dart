import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'passenger_screen.dart';
import 'admin_booking_form.dart';

class BookTicketScreen extends StatefulWidget {
  const BookTicketScreen({super.key});

  static const String routeName = '/book-ticket';

  @override
  State<BookTicketScreen> createState() => _BookTicketScreenState();
}

class _BookTicketScreenState extends State<BookTicketScreen> {
  final TextEditingController seatsController = TextEditingController();

  List<Map<String, dynamic>> trains = [];
  Map<String, dynamic>? selectedTrain;
  int? selectedTrainId;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTrains();
  }

  Future<void> loadTrains() async {
    final data = await DBHelper.instance.getAllTrains();
    setState(() {
      trains = data;
      if (data.isNotEmpty) {
        selectedTrain = data.first;
        selectedTrainId = data.first['trainId'];
      }
      isLoading = false;
    });
  }

  Future<void> bookReservation() async {
    if (selectedTrain == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a train')));
      return;
    }

    if (seatsController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill required fields')),
      );
      return;
    }

    final seats = int.tryParse(seatsController.text.trim());

    if (seats == null || seats <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter valid number of seats')),
      );
      return;
    }

    final availableSeats = selectedTrain!['availableSeats'] as int;

    if (seats > availableSeats) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Not enough available seats')),
      );
      return;
    }

    final updatedAvailableSeats = availableSeats - seats;

    await DBHelper.instance.addReservation({
      'passengerID': 1,
      'trainID': selectedTrainId,
      'seats': seats,
      'status': 'Confirmed',
      'bookingDate': DateTime.now().toString(),
    });

    await DBHelper.instance.updateTrain(selectedTrainId!, {
      'trainNumber': selectedTrain!['trainNumber'],
      'source': selectedTrain!['source'],
      'destination': selectedTrain!['destination'],
      'departureTime': selectedTrain!['departureTime'],
      'arrivalTime': selectedTrain!['arrivalTime'],
      'capacity': selectedTrain!['capacity'],
      'availableSeats': updatedAvailableSeats,
      'price': selectedTrain!['price'],
    });

    await loadTrains();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Continue...'),
        duration: Duration(seconds: 2),
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AdminBookingForm()),
    );
  }

  @override
  void dispose() {
    seatsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int selectedSeats = int.tryParse(seatsController.text) ?? 0;
    final num pricePerSeat = selectedTrain?['price'] ?? 0;
    final num totalPrice = pricePerSeat * selectedSeats;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Reservation'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF2196F3),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF0D6EFD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : trains.isEmpty
            ? const Center(
                child: Text(
                  'No trains available',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: const [
                              CircleAvatar(
                                radius: 34,
                                backgroundColor: Color(0xFFEAF3FF),
                                child: Icon(
                                  Icons.train,
                                  size: 34,
                                  color: Color(0xFF1E73E8),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Book Reservation',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E73E8),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Choose train, seats, and continue',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text(
                          'Select Train',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<int>(
                          value: selectedTrainId,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.confirmation_number_outlined,
                              color: Color(0xFF1E73E8),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8FBFF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(0xFFE3ECF8),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(0xFF1E73E8),
                                width: 1.5,
                              ),
                            ),
                          ),
                          items: trains.map((train) {
                            return DropdownMenuItem<int>(
                              value: train['trainId'] as int,
                              child: Text(
                                '${train['trainNumber']} - ${train['source']} to ${train['destination']}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedTrainId = value;
                              selectedTrain = trains.firstWhere(
                                (train) => train['trainId'] == value,
                              );
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Number of Seats',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: seatsController,
                          keyboardType: TextInputType.number,
                          onChanged: (_) => setState(() {}),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.event_seat_outlined,
                              color: Color(0xFF1E73E8),
                            ),
                            hintText: 'Enter number of seats',
                            filled: true,
                            fillColor: const Color(0xFFF8FBFF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(0xFFE3ECF8),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(0xFF1E73E8),
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FBFF),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: const Color(0xFFE3ECF8)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Booking Summary',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E73E8),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text('Train: ${selectedTrain!['trainNumber']}'),
                              Text(
                                'Route: ${selectedTrain!['source']} → ${selectedTrain!['destination']}',
                              ),
                              Text(
                                'Departure: ${selectedTrain!['departureTime']}',
                              ),
                              Text('Price per Seat: $pricePerSeat SAR'),
                              Text(
                                'Available Seats: ${selectedTrain!['availableSeats']}',
                              ),
                              Text('Selected Seats: $selectedSeats'),
                              Text('Total Price: $totalPrice SAR'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed:bookReservation,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1E73E8),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Text(
                              'Book Reservation',
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
    );
  }
}
