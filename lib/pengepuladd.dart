import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPengepul extends StatefulWidget {
  AddPengepul({Key key}) : super(key: key);

  @override
  _AddPengepulState createState() => _AddPengepulState();
}

class _AddPengepulState extends State<AddPengepul> {
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerNamaLengkap = new TextEditingController();
  TextEditingController controllerJenisKelamin = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerNoTlp = new TextEditingController();

  void AddPengepul() {
    var url = "http://192.168.1.6/trashmee/pengepul/pengepuladd.php";
    http.post(url, body: {
      "username": controllerUsername.text,
      "email": controllerEmail.text,
      "password": controllerPassword.text,
      "nama_lengkap": controllerNamaLengkap.text,
      "jenis_kelamin": controllerJenisKelamin.text,
      "alamat": controllerAlamat.text,
      "no_tlp": controllerNoTlp.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          title: Text("TAMBAH DATA"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              new TextField(
                controller: controllerUsername,
                decoration: new InputDecoration(
                  hintText: "Username",
                  labelText: "Username",
                ),
              ),
              new TextField(
                controller: controllerEmail,
                decoration: new InputDecoration(
                  hintText: "email",
                  labelText: "Email",
                ),
              ),
              new TextField(
                controller: controllerPassword,
                decoration: new InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                ),
              ),
              new TextField(
                controller: controllerNamaLengkap,
                decoration: new InputDecoration(
                  hintText: "Nama Lengkap",
                  labelText: "Nama Lengkap",
                ),
              ),
              new TextField(
                controller: controllerJenisKelamin,
                decoration: new InputDecoration(
                  hintText: "Jenis Kelamin ( P/L )",
                  labelText: "Jenis Kelamin",
                ),
              ),
              new TextField(
                controller: controllerAlamat,
                decoration: new InputDecoration(
                  hintText: "Alamat",
                  labelText: "Alamat",
                ),
              ),
              new TextField(
                controller: controllerNoTlp,
                decoration: new InputDecoration(
                  hintText: "Nomer Telepon",
                  labelText: "Nomer Telepon",
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
                  AddPengepul();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
