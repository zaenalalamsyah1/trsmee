import 'package:flutter/material.dart';
import 'package:trsmee/editkategori.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import './kategoriview.dart';

class DetailKategori extends StatefulWidget {
  final List list;
  final int index;
  DetailKategori({this.index, this.list});

  @override
  _DetailKategoriState createState() => _DetailKategoriState();
}

class _DetailKategoriState extends State<DetailKategori> {

  void deleteData(){
    var url = "http://192.168.1.6/trashmee/kategorihapus.php";
    http.post(url, body: {
      "id_kategori" : widget.list[widget.index]['id_kategori']
    });
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah kamu yakin ingin menghapus data ? '${widget.list[widget.index]['nama_kategori']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Oke Hapus!"),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
             new MaterialPageRoute(
               builder: (BuildContext context) => new Category()
             ) 
            );
          }
        ),
        new RaisedButton(
          child: new Text("Batal"),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(context: context, child : alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("${widget.list[widget.index]['nama_kategori']}")),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          margin: EdgeInsets.all(30.0),
          child: Center(
              child: new Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                widget.list[widget.index]['nama_kategori'],
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Satuan Kg: ${widget.list[widget.index]['satuan']}",
                style: TextStyle(fontSize: 10.0),
              ),
              Text(
                "Nilai Kategori: ${widget.list[widget.index]['nilai_kategori']}",
                style: TextStyle(fontSize: 18.0),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("EDIT"),
                    color: Colors.blueAccent,
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new EditKategori(
                        list: widget.list,
                        index: widget.index,
                      ),
                    )),
                  ),
                  new RaisedButton(
                      child: new Text("HAPUS"),
                      color: Colors.redAccent,
                      onPressed: () => confirm()),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
