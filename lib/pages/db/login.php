<?php
require("db.php");

// Verificar si se enviaron los datos esperados
if(isset($_POST['email']) && isset($_POST['pass'])) {
    $email = $_POST["email"];
    $pass= $_POST["pass"];

    //var_dump($email, $pass);
    $query = "SELECT * FROM user WHERE email = '$email' AND pass = '$pass'";
    $statement = $connection->prepare($query);
    $statement->execute();

    //var_dump($query);

    if($user = $statement->fetch()) {
            echo json_encode(
                array(
                    'success' => true,
                    'user' => array(
                        'user_id' => $user['user_id'],
                        'nome' => $user['nome'],
                        'email' => $user['email'],
                        'morada' => $user['morada'],
                        'localidade' => $user['localidade'],
                        'codigo_postal' => $user['codigo_postal']
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