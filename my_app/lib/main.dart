import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final  content = ()=>{
      Container(
        child: Column(
          children: [
            Container(
              width: 30,
              height: 20,
              color: Colors.blue,
            ),
          ],
        ),
      )
    };

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> usersList = [];
  String? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Wellcome',style: TextStyle(color: Colors.amber,fontSize: 30),),
            SizedBox(height: 10),
            TextField(onChanged:(value){
              user = value;
              setState(() {
                
              });
            } 
            ,decoration: InputDecoration(hintText: 'Enter Text')),
            SizedBox(height: 50),
            ElevatedButton(onPressed:(){
              log(user ?? '');
              usersList.add(user ?? 'null');
              setState(() {
                
              });
            }, child: Text('Submit')),
            SizedBox(height: 70),
            Expanded(
              child: ListView.builder( itemCount: usersList.length, itemBuilder: (context , index){
                return ListTile(title: Text(usersList[index]) , leading: Icon(Icons.person), );
              }),
            )
          ],
        ),
      ),
    );
  }
}