<?php
require("db.php");

// Verificar si se enviaron los datos esperados
if(isset($_POST['email']) && isset($_POST['pass'])) {
    $email_login = $_POST["email"];
    $pass_login = $_POST["pass"];

    //var_dump($email, $pass);
    $query_login = "SELECT * FROM user WHERE email = '$email_login' AND pass = '$pass_login'";
    $statement_login = $connection->prepare($query_login);
    $statement_login->execute();

    if($user_login = $statement_login->fetch()) {
            echo json_encode(
                array(
                    'success' => true,
                    'user' => array(
                        'user_id' => $user_login['user_id'],
                        'user_nome' => $user_login['user_nome'],
                        'email' => $user_login['email'],
                        'morada' => $user_login['morada'],
                        'localidade' => $user_login['localidade'],
                        'codigo_postal' => $user_login['codigo_postal']
                    )
                ),
            );
    } else {
        // Usuario no encontrado
        echo json_encode(array(
            'success' => false,
            'message' => 'usuario no encontrado'
        ));
    }
} else {
    // Enviar un mensaje de error si los datos esperados no están presentes
    echo json_encode(array(
        'success' => false,
        'message' => 'Datos Insuficientes'
    ));
}
?>