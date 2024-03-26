<?php
require("db.php");

$query_perfil = "SELECT * FROM user";

$statement_perfil = $connection->prepare($query_perfil);
$statement_perfil->execute();

$array_perfil = array();

while($results_perfil = $statement_perfil->fetch()) {
    array_push(
        $array_perfil, array(
            'user_id' => $results_perfil['user_id'],
            'user_nome' => $results_perfil['user_nome'],
            'email' => $results_perfil['email'],
            'morada' => $results_perfil['morada'],
            'localidade' => $results_perfil['localidade'],
            'codigo_postal' => $results_perfil['codigo_postal']
        ),
    );
}
echo json_encode($array_perfil);