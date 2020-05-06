<?php

include '../config.php';

$id = $_POST['id_pengepul'];
$conn -> query("DELETE FROM tb_pengepul WHERE id_pengepul =".$id);

?>