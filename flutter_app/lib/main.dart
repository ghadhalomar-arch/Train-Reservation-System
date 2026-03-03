import 'package:flutter/material.dart';
import 'database/db_helper.dart';


import 'splash_widget.dart';
import 'welcome_widget.dart';
import 'login_widget.dart';
import 'admin_home_widget.dart';
import 'staff_home_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة قاعدة البيانات
  await DBHelper.instance.database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // البداية من Splash
      initialRoute: SplashWidget.routeName,

      routes: {
        SplashWidget.routeName: (_) => const SplashWidget(),
        WelcomeWidget.routeName: (_) => const WelcomeWidget(),
        LoginWidget.routeName: (_) => const LoginWidget(),
        AdminHomeWidget.routeName: (_) => const AdminHomeWidget(),
        StaffHomeWidget.routeName: (_) => const StaffHomeWidget(),
      },
    );
  }
}