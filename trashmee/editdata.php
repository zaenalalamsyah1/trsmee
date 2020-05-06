<?php

include 'config.php';

$id = $_POST['id_barang'];
$namaBarang = $_POST['nama_barang'];
$satuan = $_POST['satuan'];
$nilaiPoin = $_POST['nilai_poin'];

$conn -> query("UPDATE tb_barang SET nama_barang='".$namaBarang."',satuan='".$satuan."',nilai_poin='".$nilaiPoin."' WHERE id_barang =".$id);
?>