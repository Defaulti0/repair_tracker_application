import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListRepairs extends StatefulWidget {
  const ListRepairs({super.key});

  @override
  State<ListRepairs> createState() => _ListRepairsState();
}

class _ListRepairsState extends State<ListRepairs> {
  // var dbStart = 0;
  // var dbFinish = dbStart + 10;
  
  final _future = Supabase.instance.client
      .from('Repairs_Copy')
      .select()
      .range(0, 10)
      .order('Date Received');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Management'),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final repairs = snapshot.data!;
          return ListView.builder(
            itemCount: repairs.length,
            itemBuilder: ((context, index) {
              final repair = repairs[index];
              // use ListView.builder(
              // itemBuilder: (_, index) =>
              //  Text ('Item $index'),
              // ); 
              // to build items on demand
              return Column(
                children: [
                  ExpansionTile(
                    title: Text('${repair['Case Number']}'),
                    subtitle: Text('${repair['Full Name']}'),
                    children: [
                      ListTile(
                        leading: IconButton.outlined(
                          onPressed: () {
                            // change Text childs to textfields, change the delete button to confirmation icon
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        title: Text('${repair['Case Number'].toString()} - ${repair['Full Name']}'),
                        subtitle: Text('${repair['Phone Number']} \n ${repair['Device']}'),
                        isThreeLine: true,
                        trailing: IconButton.outlined(
                          onPressed: () {
                            // Add Dialog for confirmation to delete
                          },
                          icon: const Icon(Icons.done)),
                      ),
                    ],
                  )
                ],
              );
            }
          )
        );
      },
    ),
  );
}}