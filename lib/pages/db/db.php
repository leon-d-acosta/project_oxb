<?php
try {
    $connection = new PDO('mysql:host=localhost;dbname=test1_project_lavandaria;', 'root', '');
    $connection -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "connected";
} catch (PDOException $exception) {
    echo $exception->getMessage();
    die("could not connect");  
}


