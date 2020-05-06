<?php

include '../config.php';

$namaKategori = $_POST['nama_kategori'];
$jumlah = $_POST['jumlah'];
$kirimPoin = $_POST['kirim_poin'];
$kodeUser = $_POST['kode_user'];

$conn->query("INSERT INTO tb_tukarsampah (nama_kategori, jumlah, kirim_poin, kode_user) 
VALUES ('".$namaKategori."','".$jumlah."','".$kirimPoin."','".$kodeUser."')");



?>