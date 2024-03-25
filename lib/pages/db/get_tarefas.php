<?php
require("db.php");

$select = "SELECT * FROM tarefas INNER JOIN user ON tarefas.user_id = user.user_id";

$statement = $connection->prepare($select);
$statement->execute();

$array = array();

while($resultsFrom = $statement -> fetch()){
    array_push(
        $array, array(
            'nome' => $resultsFrom['nome'],//ERROR ACA, MUSTRA EL NOMBRE DE LA TABLA USER, DEBERIA MOSTRA EL NOMBRE DE LA TABLA TAREFAS --------------OJOOOOOO-------------
            'rota' => $resultsFrom['rota'],
            'carro' => $resultsFrom['carro'],
            'motorista' => $resultsFrom['motorista'],
            'data' => $resultsFrom['data'],
            'estado' => $resultsFrom['estado'],
            'observacoes' => $resultsFrom['observacoes'],
            'id_tarefa' => $resultsFrom['id_tarefa'],
            'user_id' => $resultsFrom['user_id']
        )
        );
};
echo json_encode($array);

