<?php
require("db.php");

if (isset($_POST["user_nome"])) {
    $user_nome = $_POST["user_nome"];

    $query_update = "UPDATE user INNER JOIN tarefas ON tarefas.user_id = user.user_id SET user.user_nome = '$user_nome'";
    $statement_update = $connection->prepare($query_update);
    $statement_update->execute();
}