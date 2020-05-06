<?php

include '../config.php';

$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];
$namalengkap = $_POST['nama_lengkap'];
$jeniskelamin = $_POST['jenis_kelamin'];
$alamat = $_POST['alamat'];
$no_tlp = $_POST['no_tlp'];

$conn->query("INSERT INTO tb_pengepul (username, email, password, nama_lengkap, jenis_kelamin, alamat, no_tlp) 
VALUES ('".$username."','".$email."','".$password."','".$namalengkap."','".$jeniskelamin."','".$alamat."','".$no_tlp."')");



?>