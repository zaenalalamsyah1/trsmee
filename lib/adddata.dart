import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {

  
  AddData({Key key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerSatuan = new TextEditingController();
  TextEditingController controllerNilai = new TextEditingController();

  void addData(){
    var url ="http://192.168.1.2/trashmee/adddata.php";
    http.post(url, body:{

      "nama_barang": controllerNama.text, 
      "satuan" : controllerSatuan.text,
      "nilai_poin" : controllerNilai.text

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("TAMBAH DATA"),
        ),
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
                  addData();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
