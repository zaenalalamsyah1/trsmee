<?php

include 'config.php';

$id = $_POST['id_barang'];
$conn -> query("DELETE FROM tb_barang WHERE id_barang =".$id);

?>