import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trsmee/pengepuledit.dart';
import 'package:trsmee/pengepulview.dart';

class PengepulDetail extends StatefulWidget {
  final List list;
  final int index;
  PengepulDetail({this.index, this.list});

  @override
  _PengepulDetailState createState() => _PengepulDetailState();
}

class _PengepulDetailState extends State<PengepulDetail> {
  void deleteData() {
    var url = "http://192.168.1.6/trashmee/pengepul/pengepulhapus.php";
    http.post(url,
        body: {"id_pengepul": widget.list[widget.index]['id_pengepul']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah kamu yakin ingin menghapus data ? '${widget.list[widget.index]['username']}'"),
      actions: <Widget>[
        new RaisedButton(
            child: new Text("Oke Hapus!"),
            color: Colors.red,
            onPressed: () {
              deleteData();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Pengepul()));
            }),
        new RaisedButton(
          child: new Text("Batal"),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.list[widget.index]['username']}")),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          margin: EdgeInsets.all(30.0),
          child: Center(
              child: new Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                "Username : ${widget.list[widget.index]['username']}",
                style: TextStyle(fontSize: 18.0,),
              ),
              Text(
                "Email: ${widget.list[widget.index]['email']}",
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                "Password: ${widget.list[widget.index]['password']}",
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                "Nama Lengkap: ${widget.list[widget.index]['nama_lengkap']}",
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                "Jenis Kelamin: ${widget.list[widget.index]['jenis_kelamin']}",
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                "Alamat: ${widget.list[widget.index]['alamat']}",
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                "Nomer Telepon: ${widget.list[widget.index]['no_tlp']}",
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
                      builder: (BuildContext context) => new PengepulEdit(
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
