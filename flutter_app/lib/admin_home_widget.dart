import 'package:flutter/material.dart';

class AdminHomeWidget extends StatelessWidget {
  const AdminHomeWidget({super.key});

  static String routeName = 'adminHome';
  static String routePath = '/adminHome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: const Center(
        child: Text('Welcome Admin ✅', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}