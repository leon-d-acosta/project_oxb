<?php
require("db.php");

$query = "SELECT * FROM user INNER JOIN tarefas ON user.user_id = tarefas.user_id";

$statement = $connection->prepare($query);
$statement->execute();

$array = array();

//var_dump($query);

while($results = $statement->fetch()) {
    array_push(
        $array, array(
                'user_id' => $results['user_id'],
                'nome' => $results['nome'],
                'email' => $results['email'],
                'morada' => $results['morada'],
                'localidade' => $results['localidade'],
                'codigo_postal' => $results['codigo_postal']
        ),
    );
}
echo json_encode($array);