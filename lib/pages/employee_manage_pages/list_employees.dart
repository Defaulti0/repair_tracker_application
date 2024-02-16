import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListEmployees extends StatefulWidget {
  const ListEmployees({super.key});

  @override
  State<ListEmployees> createState() => _ListEmployeesState();
}

class _ListEmployeesState extends State<ListEmployees> {
  final _future = Supabase.instance.client
      .from('Employees')
      .select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Management'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final employees = snapshot.data!;
          return ListView.builder(
            itemCount: employees.length,
            itemBuilder: ((context, index) {
              final employee = employees[index];
              // use ListView.builder(
              // itemBuilder: (_, index) =>
              //  Text ('Item $index'),
              // ); 
              // to build items on demand
              return Row(
                children: [
                  Text(employee['First Name']),
                  const Text(" "),
                  Text(employee['Last Name']),
                  const Text(", "),
                  Text(employee['Employee ID'].toString()),
                  const Text(", "),
                  Text(employee['Employee Type']),
                ],

              );
              // return ListTile(
              //   title: Text(employee['First Name' 'Last Name']),
                
              // );
            }),
          );
        },
      ),
    );
  }
}