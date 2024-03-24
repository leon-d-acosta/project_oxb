<?php
require("db.php");

$email = $_POST["email"];
$password = $_POST["password"];

$query = "SELECT * FROM user WHERE email = ? AND password = ?";
$statement = $connection->prepare($query);
$statement->bindParam("ss", $username, $password);
$statement->execute();

$statement-> bindParam($user_id, $nome, $email, $password, $morada, $localidade, $codigo_postal);
if($statement->fetch()){
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

?>