import 'package:flutter/material.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class Detail extends StatefulWidget {
  final List list;
  final int index;
  Detail({this.index, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData(){
    var url = "http://192.168.1.2/trashmee/deletedata.php";
    http.post(url, body: {
      "id_barang" : widget.list[widget.index]['id_barang']
    });
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah kamu yakin ingin menghapus data ? '${widget.list[widget.index]['nama_barang']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Oke Hapus!"),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
             new MaterialPageRoute(
               builder: (BuildContext context) => new Home()
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
          AppBar(title: Text("${widget.list[widget.index]['nama_barang']}")),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          margin: EdgeInsets.all(30.0),
          child: Center(
              child: new Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                widget.list[widget.index]['nama_barang'],
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Satuan Kg: ${widget.list[widget.index]['satuan']}",
                style: TextStyle(fontSize: 10.0),
              ),
              Text(
                "Nilai Poin: ${widget.list[widget.index]['nilai_poin']}",
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
                      builder: (BuildContext context) => new EditData(
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
