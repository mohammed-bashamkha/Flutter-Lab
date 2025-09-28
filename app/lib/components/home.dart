import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHome();
}

class _MyHome extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nigga",style: TextStyle(fontSize: 25,color: Colors.black)),
      centerTitle: true,
      backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){},
            child: Text('Hi')),
            SizedBox(height: 120),
            Card(
              child: Center(child: Text("Hi",style: TextStyle(color: Colors.black),)),
              // shape: Border.all(width: 70,color: Colors.amber),
            )
          ],
        ),
      ),
    );
  }
}