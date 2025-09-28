import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page",style: TextStyle(color: Colors.white),)
      ,centerTitle: true,
      backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {print("Hi");}
            ),
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
              color: Colors.black,
              ),
              child: Center(
                child: Text("Hello World!",style: TextStyle(color: Colors.white,fontSize: 30),),
              )
            )
          ],
        ),
      ),
    );
  }
}