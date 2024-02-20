import 'package:flutter/material.dart';
// import 'package:repair_tracker_application/pages/employee_manage_pages/list_employees.dart';
import 'package:repair_tracker_application/pages/main_menu.dart';
import 'package:repair_tracker_application/supabase_client.dart';
// import 'package:repair_tracker_application/pages/employee_manage_pages/add_employee.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final supabase = SupabaseClientInstance();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Main App',
      home: MainMenu(),
    );
  }
}

