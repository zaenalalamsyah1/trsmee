import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class EditData extends StatefulWidget {

  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
  
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerNama;
  TextEditingController controllerSatuan;
  TextEditingController controllerNilai;

void editData(){
  var url = "http://192.168.1.2/trashmee/editdata.php";
  http.post(url, body : {
    "id_barang" : widget.list[widget.index]['id_barang'],
    "nama_barang" : controllerNama.text,
    "satuan" : controllerSatuan.text,
    "nilai_poin" : controllerNilai.text
  });
  
}

@override
  void initState() {
    controllerNama = new TextEditingController(text: widget.list[widget.index]['nama_barang']);
    controllerSatuan = new TextEditingController(text : widget.list[widget.index]['satuan']);
    controllerNilai = new TextEditingController(text : widget.list[widget.index]['nilai_poin']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title: Text("EDIT DATA"),),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              new TextField(
                controller: controllerNama,
                decoration: new InputDecoration(
                  hintText: "Nama Barang",
                  labelText: "Nama Barang",
                ),
              ),
              new TextField(
                controller: controllerSatuan,
                decoration: new InputDecoration(
                  hintText: "Satuan Barang",
                  labelText: "Satuan Barang (kg)",
                ),
              ),
              new TextField(
                controller: controllerNilai,
                decoration: new InputDecoration(
                  hintText: "Nilai Poin",
                  labelText: "Nilai Poin",
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              new RaisedButton(
                child: new Text("SIMPAN"),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  editData();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder : (BuildContext context) => new Home()
                    )
                  );
                },
              )
            ],
          ),
        ),
    );
  }
}