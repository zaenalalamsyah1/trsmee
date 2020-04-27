import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddKategori extends StatefulWidget {

  
  AddKategori({Key key}) : super(key: key);

  @override
  _AddKategoriState createState() => _AddKategoriState();
}

class _AddKategoriState extends State<AddKategori> {
  TextEditingController controllerNamaKategori = new TextEditingController();
  TextEditingController controllerSatuan = new TextEditingController();
  TextEditingController controllerNilaiKategori = new TextEditingController();

  void AddKategori(){
    var url ="http://192.168.1.6/trashmee/addkategori.php";
    http.post(url, body:{

      "nama_kategori": controllerNamaKategori.text, 
      "satuan" : controllerSatuan.text,
      "nilai_kategori" : controllerNilaiKategori.text

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
                controller: controllerNamaKategori,
                decoration: new InputDecoration(
                  hintText: "Nama Kategori",
                  labelText: "Nama Kategori",
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
                controller: controllerNilaiKategori,
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
                  AddKategori();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
