<?php

include 'config.php';

$namaBarang = $_POST['nama_barang'];
$satuan = $_POST['satuan'];
$nilaiPoin = $_POST['nilai_poin'];

$conn->query("INSERT INTO tb_barang (nama_barang, satuan, nilai_poin) VALUES ('".$namaBarang."','".$satuan."','".$nilaiPoin."')");



?>