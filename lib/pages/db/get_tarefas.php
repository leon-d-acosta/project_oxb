<?php
include "db.php";

$query = $conect->query("SELECT * FROM 'tarefas'")
$result = array();

while($rowData = $query->fetch_assoc()){
    $result[] = $rowData;
}

echo json_encode($result);