import 'package:flutter/material.dart';
import 'package:repair_tracker_application/pages/employee_manage_pages/list_employees.dart';
import 'add_employee.dart';
import 'delete_employee.dart';

class ManageEmployee extends StatefulWidget {
  const ManageEmployee({super.key});

  @override
  State<ManageEmployee> createState() => _ManageEmployeeState();
}

class _ManageEmployeeState extends State<ManageEmployee> {
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
                child: const Text('Add Employee')
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute( 
                      builder: (context) => const DeleteEmployee(),
                    ),
                  );
                },
                child: const Text('Delete Employee')
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute( 
                      builder: (context) => const ListEmployees(),
                    ),
                  );
                },
                child: const Text('List Employees')
              ),
            ],
          ),
        ),
      );
     }
}