import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'passenger_screen.dart';
import 'view_trains_page.dart';
import 'package:flutter_app/screens/dashboard_screen.dart';
class AdminMenuPage extends StatelessWidget {
  const AdminMenuPage({super.key});

  static const String routeName = '/adminmenu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E40AF),
        automaticallyImplyLeading: false,
        title: Text(
          'Train Admin',
          style: GoogleFonts.interTight(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
            children: [
              _MenuCard(
                title: 'Train Schedule',
                icon: Icons.train,
                colors: const [Color(0xFF3B82F6), Color(0xFF1E40AF)],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TrainListPage(),
                    ),
                  );
                },
              ),

              _MenuCard(
                title: 'Passenger Management',
                icon: Icons.people,
                colors: const [Color(0xFF2563EB), Color(0xFF1E40AF)],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PassengerMenuScreen.routeName,
                  );
                },
              ),

              const _MenuCard(
                title: 'Route Planning',
                icon: Icons.route,
                colors: [Color(0xFF1D4ED8), Color(0xFF1E3A8A)],
              ),

              const _MenuCard(
                title: 'Maintenance',
                icon: Icons.build,
                colors: [Color(0xFF1E40AF), Color(0xFF2563EB)],
              ),

              // 👇 أهم زر (Analytics)
              _MenuCard(
                title: 'Analytics',
                icon: Icons.analytics,
                colors: const [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DashboardScreen(), // بدون const
                    ),
                  );
                },
              ),

              const _MenuCard(
                title: 'Notifications',
                icon: Icons.notifications,
                colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= CARD =================

class _MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Color> colors;
  final VoidCallback? onTap;

  const _MenuCard({
    required this.title,
    required this.icon,
    required this.colors,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: const AlignmentDirectional(1, 1),
            end: const AlignmentDirectional(-1, -1),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 32),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.interTight(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
