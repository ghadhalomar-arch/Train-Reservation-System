import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'database/db_helper.dart';
import 'screens/Cancel_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/admin_menu_page.dart';
import 'screens/staff_menu_page.dart';
import 'screens/passenger_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await DBHelper.instance.database;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrainConnect',
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        WelcomePage.routeName: (context) => const WelcomePage(),
        LoginPage.routeName: (context) => const LoginPage(),
        AdminMenuPage.routeName: (context) => const AdminMenuPage(),
        StaffMenuPage.routeName: (context) => const StaffMenuPage(),
        PassengerMenuScreen.routeName: (context) =>
            const PassengerMenuScreen(),
        CancelReservationPage.routeName: (context) =>
            const CancelReservationPage(),
      },
    );
  }
}