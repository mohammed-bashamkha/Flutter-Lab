import 'package:flutter/material.dart';
import 'package:notes_app/sqlDb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Sqldb sqlDb = Sqldb();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notes App'),
          backgroundColor: const Color.fromARGB(255, 132, 218, 240),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: [
              FutureBuilder(
                future: sqlDb.readDataApp(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Card(
                            child: ListTile(
                              title: Text(snapshot.data![index]['note']),
                              subtitle: Text(snapshot.data![index]['note']),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
