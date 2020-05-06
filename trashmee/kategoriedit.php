<?php

include 'config.php';

$id = $_POST['id_kategori'];
$namaKategori = $_POST['nama_kategori'];
$satuan = $_POST['satuan'];
$nilaiKategori = $_POST['nilai_kategori'];

$conn -> query("UPDATE tb_kategori SET nama_kategori='".$namaKategori."',satuan='".$satuan."',nilai_kategori='".$nilaiKategori."' WHERE id_kategori =".$id);
?>