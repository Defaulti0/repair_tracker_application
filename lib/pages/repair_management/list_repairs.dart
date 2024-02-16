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
              return Column(
                children: [
                  ListTile(
                    leading: IconButton.outlined(
                      onPressed: () {
                        // change Text childs to textfields, change the delete button to confirmation icon
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    title: Text(employee['First Name'] + " " + employee['Last Name']),
                    subtitle: Text('${employee['Employee ID'].toString()} \n ${employee['Employee Type']}'),
                    isThreeLine: true,
                    trailing: IconButton.outlined(
                      onPressed: () {
                        // Add Dialog for confirmation to delete
                      },
                      icon: const Icon(Icons.done)),
                  ),
                ],
              );
            }
          )
        );
      },
    ),
  );
}}