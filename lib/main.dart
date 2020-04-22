import 'dart:async';
import 'dart:convert';
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

Future<List> getData() async{
  final response = await http.get("http://192.168.1.4/trashmee/getData.php");
  return json.decode(response.body);

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      appBar: new AppBar(title: Text("Trashmee"),) ,
      body: FutureBuilder<List>(
        future : getData(),
        builder : (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData 
          ? ItemList(list: snapshot.data,) 
          : Center(child: new CircularProgressIndicator(), );
        },
      ),
      );
  }
}

class ItemList extends StatelessWidget {

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i){
        return Container(
          padding : const EdgeInsets.all(5.0),
          child: new Card(
                    child: new ListTile(
              title : new Text(list[i]['nama_barang']),
              leading : new Icon(Icons.widgets),
              subtitle: new Text("Poin : ${list[i]['nilai_poin']}"),

            ),
          ),
        );
      },
    );
  }
}


