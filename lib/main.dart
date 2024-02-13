import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://novdxmvytymxsrxxifcl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5vdmR4bXZ5dHlteHNyeHhpZmNsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc2ODk0NjQsImV4cCI6MjAyMzI2NTQ2NH0.-nbWSqTM6_DdbPbhXqRsmUsoIzDnpmn5H42sklNSIJ0',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Repairs',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _future = Supabase.instance.client
      .from('Repairs')
      .select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final repairs = snapshot.data!;
          return ListView.builder(
            itemCount: repairs.length,
            itemBuilder: ((context, index) {
              final repair = repairs[index];
              return ListTile(
                title: Text(repair['Case Number']),
              );
            }),
          );
        },
      ),
    );
  }
}