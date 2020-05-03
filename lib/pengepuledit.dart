import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trsmee/pengepulview.dart';

class PengepulEdit extends StatefulWidget {

  final List list;
  final int index;

  PengepulEdit({this.list, this.index});

  @override
  _PengepulEditState createState() => _PengepulEditState();
  
}

class _PengepulEditState extends State<PengepulEdit> {

  TextEditingController controllerUsername;
  TextEditingController controllerEmail;
  TextEditingController controllerPassword;
  TextEditingController controllerNamaLengkap;
  TextEditingController controllerJenisKelamin;
  TextEditingController controllerAlamat;
  TextEditingController controllerNoTlp;

void PengepulEdit(){
  var url = "http://192.168.1.6/trashmee/pengepul/pengepuledit.php";
  http.post(url, body : {
    "id_pengepul" : widget.list[widget.index]['id_pengepul'],
    "username" : controllerUsername.text,
    "email" : controllerEmail.text,
    "password" : controllerPassword.text,
    "nama_lengkap" : controllerNamaLengkap.text,
    "jenis_kelamin" : controllerJenisKelamin.text,
    "alamat" : controllerAlamat.text,
    "no_tlp" : controllerNoTlp.text
  });
  
}

@override
  void initState() {
    controllerUsername = new TextEditingController(text: widget.list[widget.index]['username']);
    controllerEmail = new TextEditingController(text : widget.list[widget.index]['email']);
    controllerPassword = new TextEditingController(text : widget.list[widget.index]['password']);
    controllerNamaLengkap = new TextEditingController(text : widget.list[widget.index]['nama_lengkap']);
    controllerJenisKelamin = new TextEditingController(text : widget.list[widget.index]['jenis_kelamin']);
    controllerAlamat = new TextEditingController(text : widget.list[widget.index]['alamat']);
    controllerNoTlp = new TextEditingController(text : widget.list[widget.index]['no_tlp']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar : AppBar(title: Text("EDIT DATA"),),
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
                  PengepulEdit();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder : (BuildContext context) => new Pengepul()
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