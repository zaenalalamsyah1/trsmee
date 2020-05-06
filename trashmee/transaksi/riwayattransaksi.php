<?php
include '../config.php';

$queryResult = $conn->query("SELECT * FROM tb_tukarpoin");

$result =  array();

while($fetchData = $queryResult->fetch_assoc()){
    $result[] = $fetchData;

}

echo json_encode($result);

?>