<?php
    require '../configsesion.php';
    session_destroy();

    header('Location: login.php');
?>