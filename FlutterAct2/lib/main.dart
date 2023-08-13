import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        
        backgroundColor:  Colors.teal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/jgzalez.jpg"),
              radius: 70,
            ),
            const Text
            (
            "Jose Ernesto Gonzalez Fals",
            style: TextStyle(fontSize: 25, fontFamily: 'Pacifico',),),
            Container(
              child:  Text("Soy un desarrollador BackEnd y DBA",
              style: TextStyle(),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            Container
            (
              child: Divider
                (
                thickness: 3, 
                height: 1, 
                color: Colors.black
                ),
                margin: EdgeInsets.symmetric(horizontal: 150, vertical: 40),
              )
            ,
            SizedBox(
              height: 60,
                width: 300,
              child: Card(
                child:  const ListTile(
              leading: Icon (
                  Icons.phone,
                  color: Colors.cyan,
              ),
              title: Text(
                "+1(849)-319-1166",
                style: TextStyle(),
              ),
                ),
              ),
              
            ),
            SizedBox(
              height: 60,
                width: 300,
              child: Card(
                child:  const ListTile(
              leading: Icon (
                  Icons.mail,
                  color: Colors.cyan,
              ),
              title: Text(
                "Kingdd2367@gmail.com",
                style: TextStyle(),
              ),
                ),
              ),
              
            )
            ],
          ),
          
          
        ),
      ),
    );
  }
}