import 'package:flutter/material.dart';
import '../employee_manage_pages/add_employee.dart';
import '../employee_manage_pages/delete_employee.dart';
import 'list_repairs.dart';

class ManageRepairs extends StatefulWidget {
  const ManageRepairs({super.key});

  @override
  State<ManageRepairs> createState() => _ManageRepairsState();
}

class _ManageRepairsState extends State<ManageRepairs> {
     @override
     Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Employee Management'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: [
              // ListTile(
              //   leading: IconButton.outlined(
              //     onPressed: () {},
              //     icon: const Icon(Icons.delete),
              //    ),
              //    title: const Text("Test"),
              //    subtitle: const Text("testing"),
              //    isThreeLine: true,
              //    trailing: IconButton.outlined(
              //     onPressed: () {},
              //     icon: const Icon(Icons.done)),
              // ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute( 
                      builder: (context) => const AddEmployee(),
                    ),
                  );
                },
                child: const Text('Add Repair')
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute( 
                      builder: (context) => const DeleteEmployee(),
                    ),
                  );
                },
                child: const Text('Delete Repair')
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute( 
                      builder: (context) => const ListRepairs(),
                    ),
                  );
                },
                child: const Text('List Repairs')
              ),
            ],
          ),
        ),
      );
     }
}