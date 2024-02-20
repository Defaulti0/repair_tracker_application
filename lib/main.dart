import 'package:flutter/material.dart';
// import 'package:repair_tracker_application/pages/employee_manage_pages/list_employees.dart';
import 'package:repair_tracker_application/pages/main_menu.dart';
// import 'package:repair_tracker_application/pages/employee_manage_pages/add_employee.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://novdxmvytymxsrxxifcl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5vdmR4bXZ5dHlteHNyeHhpZmNsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc2ODk0NjQsImV4cCI6MjAyMzI2NTQ2NH0.-nbWSqTM6_DdbPbhXqRsmUsoIzDnpmn5H42sklNSIJ0',
  );
  
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

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

