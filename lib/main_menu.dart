import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';


class MainMenu extends StatelessWidget {
  const MainMenu({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter the first name',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter the last name',
            ),
          ),
        ]
      )
    );
  }
}