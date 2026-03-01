import 'package:flutter/material.dart';
import 'database/db_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DBHelper.instance.database;

  final success = await DBHelper.instance.login('admin', '1234');
  debugPrint('SUCCESS RESULT: ${success != null}');

  final fail = await DBHelper.instance.login('admin', '0000');
  debugPrint('FAIL RESULT: ${fail != null}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Database Ready ✅'),
        ),
      ),
    );
  }
}