import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  late final TextEditingController firstnamecontroller = TextEditingController();
  late final TextEditingController lastnamecontroller = TextEditingController();
  late final TextEditingController employeepin = TextEditingController();
  late final TextEditingController employeetypecontroller = TextEditingController();

  @override
  void dispose(){
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    employeepin.dispose();
    employeetypecontroller.dispose();
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
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter employee type'
              ),
              controller: employeetypecontroller,
            ),
            ElevatedButton(
              onPressed: () async {
                await supabase
                  // check if user and primary key are actually in there
                  //  if true, reject and show popup,
                  // if false, insert row
                  .from('Employees')
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