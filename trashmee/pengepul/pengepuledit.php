<?php

include '../config.php';

$id = $_POST['id_pengepul'];
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];
$namalengkap = $_POST['nama_lengkap'];
$jeniskelamin = $_POST['jenis_kelamin'];
$alamat = $_POST['alamat'];
$no_tlp = $_POST['no_tlp'];

$conn -> query("UPDATE tb_pengepul 
SET username='".$username."',
email='".$email."',
password='".$password."',
nama_lengkap = '".$namalengkap."',
jenis_kelamin = '".$jeniskelamin."',
alamat = '".$alamat."',
no_tlp = '".$no_tlp."'
 WHERE id_pengepul =".$id);
?>