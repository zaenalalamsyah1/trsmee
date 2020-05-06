<?php

include 'config.php';

$namaKategori = $_POST['nama_kategori'];
$satuan = $_POST['satuan'];
$nilaiKategori = $_POST['nilai_kategori'];

$conn->query("INSERT INTO tb_kategori (nama_kategori, satuan, nilai_kategori) VALUES ('".$namaKategori."','".$satuan."','".$nilaiKategori."')");



?>