import 'dart:async';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

// ini main
void main() {
  runApp(new MaterialApp(
     debugShowCheckedModeBanner: false,
    title: "Trashmee",
    home: Home(),
    )
  
  
  );
}

//class Home
class Home extends StatefulWidget{
  @override
  _HomeState createState() => new _HomeState();
}

//class HomeState
class _HomeState extends State<Home>{

Future<List>

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
    
      appBar: new AppBar(title: Text("Trashmee"),) ,
      
      );
  }
}


