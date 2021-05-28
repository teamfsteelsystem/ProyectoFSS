<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar datos</title>
</head>
<body>
<?php
include_once("../../conexion.php");
if(isset ($_POST['Submit']) ){
    $Doc_identidad = $_POST['Doc_identidad'];
    $Tipo_doc = $_POST['Tipo_doc'];
    $Nombres = $_POST['Nombres'];
    $Apellidos = $_POST['Apellidos'];
    $Tel_contacto = $_POST['Tel_contacto'];
    $Cel_contacto = $_POST['Cel_contacto'];
    $Email = $_POST['Email'];


    if(empty($Doc_identidad) || empty($Tipo_doc) || empty($Nombres) || empty($Apellidos) || empty($Cel_contacto) || empty($Email) ) { 
        if(empty($Doc_identidad)) {
            echo "<font color= 'red '>Campo: Doc identidad esta vacio.</font><br/>";
        }
        if(empty($Tipo_doc)) {
            echo "<font color= 'red '>Campo: Tipo doc esta vacio.</font><br/>";
        }
        if(empty($Nombres)) {
            echo "<font color= 'red '>Campo: Nombres esta vacio.</font><br/>";
        }
        if(empty($Apellidos)) {
            echo "<font color= 'red '>Campo: Apellidos esta vacio.</font><br/>";
        }
        if(empty($Cel_contacto)) {
            echo "<font color= 'red '>Campo: Celular esta vacio.</font><br/>";
        }
        if(empty($Email)) {
            echo "<font color= 'red '>Campo: Email esta vacio.</font><br/>";
        }
        echo "<br/><a href='javascript:self.history.back(); '>Volver</a>";
} else { 
    $sql = "INSERT INTO cliente(Doc_identidad, Tipo_doc, Nombres, Apellidos, Tel_contacto, Cel_contacto, Email) 
            VALUES (:Doc_identidad, :Tipo_doc, :Nombres, :Apellidos, :Tel_contacto, :Cel_contacto, :Email)";
    $query = $dbConn->prepare($sql);
    $query->bindparam (':Doc_identidad', $Doc_identidad);
    $query->bindparam (':Tipo_doc', $Tipo_doc);
    $query->bindparam (':Nombres', $Nombres);
    $query->bindparam (':Apellidos', $Apellidos);
    $query->bindparam (':Tel_contacto', $Tel_contacto);
    $query->bindparam (':Cel_contacto', $Cel_contacto);
    $query->bindparam (':Email', $Email);
    $query->execute();

    echo "<font color='green'>Registro Agregado Correctamente.";
    echo "Cantidad de Registros Agregados : " . $query->rowCount () . "<br>";
    echo "<br><a href='adminclientes.php '>Ver Todos los Registros</a>";
    }
}
?>
</body>
</html>