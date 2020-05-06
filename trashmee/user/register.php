<?php

require '../config.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    # code...
    $response = array();
    $username = $_POST['username'];
    $password = md5($_POST['password']);
    $nama = $_POST['nama'];

    $cek = "SELECT * FROM tb_user WHERE username = '$username' ";
    $result = mysqli_fetch_array(mysqli_query($conn, $cek));

    if (isset($result)) {
        # code...
        $response['value'] = 2;
        $response['message'] = "Username sudah ada yang pakai";

        echo json_encode($response);
    } else {
        # code...
        $insert = "INSERT INTO tb_user VALUES(NULL, '$username','$password','1','$nama','1',NOW())";

        if (mysqli_query($conn, $insert)) {
            # code...
            $response['value'] = 1;
            $response['message'] = "Berhasil di daftarkan";
    
            echo json_encode($response);
        } else {
            # code...
            $response['value'] = 0;
            $response['message'] = "Gagal di daftarkan";
    
            echo json_encode($response);
    
        }
    }
    



    
}




?>