import 'package:flutter/material.dart';
import 'employee_manage_pages/manage_employee.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute( 
                      builder: (context) => const ManageEmployee(),
                    ),
                  );
                },
                child: const Text('Manage Employees')
              ),
            ],
          ),
        ),
      );
    }
}