import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trsmee/kategoriview.dart';

class EditKategori extends StatefulWidget {

  final List list;
  final int index;

  EditKategori({this.list, this.index});

  @override
  _EditKategoriState createState() => _EditKategoriState();
  
}

class _EditKategoriState extends State<EditKategori> {

  TextEditingController controllerNamaKategori;
  TextEditingController controllerSatuan;
  TextEditingController controllerNilaiKategori;

void EditKategori(){
  var url = "http://192.168.1.6/trashmee/kategoriedit.php";
  http.post(url, body : {
    "id_kategori" : widget.list[widget.index]['id_kategori'],
    "nama_kategori" : controllerNamaKategori.text,
    "satuan" : controllerSatuan.text,
    "nilai_kategori" : controllerNilaiKategori.text
  });
  
}

@override
  void initState() {
    controllerNamaKategori = new TextEditingController(text: widget.list[widget.index]['nama_kategori']);
    controllerSatuan = new TextEditingController(text : widget.list[widget.index]['satuan']);
    controllerNilaiKategori = new TextEditingController(text : widget.list[widget.index]['nilai_kategori']);
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
                  hintText: "Nilai Kategori",
                  labelText: "Nilai Kategori",
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
                  EditKategori();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder : (BuildContext context) => new Category()
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