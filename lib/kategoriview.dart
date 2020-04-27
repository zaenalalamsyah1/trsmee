import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './AddKategori.dart';
import './detailkategori.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => new _CategoryState();
}

//class CategoryState
class _CategoryState extends State<Category> {
  Future<List> getData() async {
    final response = await http.get("http://192.168.1.6/trashmee/viewkategori.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Kategori"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddKategori(),
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
              builder: (BuildContext context) => new DetailKategori(
                list: list,
                index: i,
              ),
            )),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nama_kategori']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Poin : ${list[i]['nilai_kategori']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}