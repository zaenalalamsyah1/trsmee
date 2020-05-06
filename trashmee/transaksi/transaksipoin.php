<?php

include '../config.php';

$namaBarang = $_POST['nama_barang'];
$jumlah = $_POST['jumlah'];
$poinTerpakai = $_POST['poin_terpakai'];
$kodeUser = $_POST['kode_user'];
$alamat = $_POST['alamat'];

$conn->query("INSERT INTO tb_tukarpoin (nama_barang, jumlah, poin_terpakai, kode_user, alamat) 
VALUES ('".$namaBarang."','".$jumlah."','".$poinTerpakai."','".$kodeUser."','".$alamat."')");



?>