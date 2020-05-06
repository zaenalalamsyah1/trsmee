<?php

include 'config.php';

$id = $_POST['id_kategori'];
$conn -> query("DELETE FROM tb_kategori WHERE id_kategori =".$id);

?>