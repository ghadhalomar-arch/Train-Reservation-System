import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'passenger_screen.dart';
import 'book_ticket_screen.dart';
import 'view_trains_page.dart';


class AdminMenuPage extends StatelessWidget {
  const AdminMenuPage({super.key});

  static const String routeName = '/adminmenu';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: _TopIconButton(
                icon: Icons.settings,
                onTap: () {
                  debugPrint('Settings pressed');
                },
              ),
            ),
          ],
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _MenuCard(
                     title: 'Train Schedule',
                     icon: Icons.train,
                     colors: const [Color(0xFF3B82F6), Color(0xFF1E40AF)],
                     onTap: () {
                     Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (_) => const TrainListPage(
                     ),
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
                    const _MenuCard(
                      title: 'Analytics',
                      icon: Icons.analytics,
                      colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                    ),
                    const _MenuCard(
                      title: 'Notifications',
                      icon: Icons.notifications,
                      colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E40AF),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x4D1E40AF),
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'System Status',
                                style: GoogleFonts.interTight(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'All systems operational',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: const Color(0xFFBFDBFE),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Color(0xFF10B981),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _TopIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xFF3B82F6),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}

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
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Color(0x4D1E40AF),
              offset: Offset(0, 4),
            ),
          ],
          gradient: LinearGradient(
            colors: colors,
            stops: const [0, 1],
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
