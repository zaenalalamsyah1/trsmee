import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trsmee/pengepuladd.dart';
import 'package:trsmee/pengepuldetail.dart';
import './main.dart';


class Pengepul extends StatefulWidget {
  @override
  _PengepulState createState() => new _PengepulState();
}

//class PengepulState
class _PengepulState extends State<Pengepul> {
  Future<List> getData() async {
    final response = await http.get("http://192.168.1.6/trashmee/pengepul/pengepulview.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Pengepul"),
                actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
             onPressed: () => Navigator.of(context).push(
               new MaterialPageRoute(builder: (BuildContext context) => new Dashboard())
             )
             )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddPengepul(),
        )),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: new CircularProgressIndicator(),
                );
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
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(5.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new PengepulDetail(
                list: list,
                index: i,
              ),
            )),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nama_lengkap']),
                leading: new Icon(Icons.person),
                subtitle: new Text("No.Tlp : ${list[i]['no_tlp']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}