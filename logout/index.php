<?php

require_once '../config.php';
require_once 'init.php';

$_SESSION["logged"]=false;
unset($_SESSION["user"]);
session_destroy();

if(isset($_GET["returnURL"])){
    header('Location: '. $_GET["returnURL"]);
}else{
    header('Location: '. $ROOT);
}

?>