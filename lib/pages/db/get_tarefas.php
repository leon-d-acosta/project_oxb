<?php
require("db.php");

$select = "SELECT * FROM tarefas";

$statement = $connection->prepare($select);
$statement->execute();

$array = array();

while($resultsFrom = $statement -> fetch()){
    array_push(
        $array, array(
            'nome'=>$resultsFrom['nome'],
            'rota'=>$resultsFrom['rota'],
            'carro'=>$resultsFrom['carro'],
            'motorista'=>$resultsFrom['motorista'],
            'data'=>$resultsFrom['data'],
            'estado'=>$resultsFrom['estado'],
            'observacoes'=>$resultsFrom['observacoes'],
            'id_tarefa'=>$resultsFrom['id_tarefa'],
            'user_id'=>$resultsFrom['user_id']
        )
        );
};

echo json_encode($array);

