import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _future = Supabase.instance.client
      .from('customers')
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
          final customers = snapshot.data!;
          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: ((context, index) {
              final customer = customers[index];
              return ListTile(
                title: Text(customer['name']),
              );
            }),
          );
        },
      ),
    );
  }
}