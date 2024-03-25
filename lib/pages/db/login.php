<?php
require("db.php");

// Verificar si se enviaron los datos esperados
if(isset($_POST["email"]) && isset($_POST["password"])) {
    $email = $_POST["email"];
    $password = $_POST["password"];

    $query = "SELECT * FROM user WHERE email = ? AND password = ?";
    $statement = $connection->prepare($query);
    $statement->bindParam(1, $email); // Vincular el primer parámetro
    $statement->bindParam(2, $password); // Vincular el segundo parámetro
    $statement->execute();

    // No es necesario llamar a bindParam después de execute()

    if($statement->fetch()){
        // Obtener los datos del usuario
        $user_id = $statement['user_id'];
        $nome = $statement['nome'];
        $morada = $statement['morada'];
        $localidade = $statement['localidade'];
        $codigo_postal = $statement['codigo_postal'];

        $user = array(
            'user_id' => $user_id,
            'nome'=> $nome,
            'email'=> $email,
            'password'=> $password,
            'morada'=> $morada,
            'localidade'=> $localidade,
            'codigo_postal'=> $codigo_postal
        );

        echo json_encode(array('success'=> true, 'user'=>$user));
    }
    else{
        echo json_encode(array('success'=> false,'message'=> 'Credenciales incorrectas'));
    }
} else {
    // Enviar un mensaje de error si los datos esperados no están presentes
    echo json_encode(array('success'=> false,'message'=> 'Datos insuficientes'));
}
?>