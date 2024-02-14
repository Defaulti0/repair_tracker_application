import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  late final TextEditingController firstnamecontroller = TextEditingController();
  late final TextEditingController lastnamecontroller = TextEditingController();
  late final TextEditingController employeepin = TextEditingController();
  
  @override
  void dispose(){
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    employeepin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Management'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the first name',
              ),
              controller: firstnamecontroller,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the last name',
              ),
              controller: lastnamecontroller,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the employee pin',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: employeepin,
            ),
            ElevatedButton(
              onPressed: () async {
                await supabase
                  .from('Users')
                  .insert({'First Name':firstnamecontroller.text, 'Last Name':lastnamecontroller.text, 'Employee ID':employeepin.text});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 0,
              ),
              child: const Text("Add new employee"),
            ),
          ]
        ),
      ),
    );
  }
}