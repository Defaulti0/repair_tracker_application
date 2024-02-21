import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:repair_tracker_application/supabase_client.dart';

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
  
  final supabase = SupabaseClientInstance.instance;

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
        child: Row(
          children: [
            Flexible( 
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the first name',
                ),
                controller: firstnamecontroller,
              )
            ),
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the last name',
                ),
                controller: lastnamecontroller,
              ),
            ),
            Flexible(
              child: TextFormField(
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
            ),
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter employee type'
                ),
                controller: employeetypecontroller,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                  // check if user and primary key are actually in there
                  //  if true, reject and show popup,
                  // if false, insert row
                await supabase
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