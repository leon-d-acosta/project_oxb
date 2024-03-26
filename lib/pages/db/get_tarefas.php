<?php
require("db.php");

$query_getTarefas = "SELECT * FROM tarefas";

$statement_getTarefas = $connection->prepare($query_getTarefas);
$statement_getTarefas->execute();

$array_getTarefas = array();

while($results_getTarefas = $statement_getTarefas -> fetch()){
    array_push(
        $array_getTarefas, array(
            'tarefa_nome' => $results_getTarefas['tarefa_nome'],
            'rota' => $results_getTarefas['rota'],
            'carro' => $results_getTarefas['carro'],
            'motorista' => $results_getTarefas['motorista'],
            'data' => $results_getTarefas['data'],
            'estado' => $results_getTarefas['estado'],
            'observacoes' => $results_getTarefas['observacoes'],
            'id_tarefa' => $results_getTarefas['id_tarefa'],
            'user_id' => $results_getTarefas['user_id']
        )
    );
};
echo json_encode($array_getTarefas);

