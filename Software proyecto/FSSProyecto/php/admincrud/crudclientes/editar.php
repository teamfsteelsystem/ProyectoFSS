<?php
include_once("../../conexion.php");
if(isset ($_POST['update']) ) 
{
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
} else {
    $sql = "UPDATE cliente SET Doc_identidad=:Doc_identidad, Tipo_doc=:Tipo_doc, Nombres=:Nombres, Apellidos=:Apellidos, 
            Tel_contacto=:Tel_contacto, Cel_contacto=:Cel_contacto, Email=:Email WHERE Doc_identidad=:Doc_identidad";

    $query = $dbConn->prepare($sql);
    $query->bindparam (':Doc_identidad', $Doc_identidad);
    $query->bindparam (':Tipo_doc', $Tipo_doc);
    $query->bindparam (':Nombres', $Nombres);
    $query->bindparam (':Apellidos', $Apellidos);
    $query->bindparam (':Tel_contacto', $Tel_contacto);
    $query->bindparam (':Cel_contacto', $Cel_contacto);
    $query->bindparam (':Email', $Email);
    $query->execute();
    header("Location: adminclientes.php");
    }
}
?>
<?php
$Doc_identidad = $_GET['Doc_identidad'];
$sql = "SELECT *  FROM cliente WHERE Doc_identidad=:Doc_identidad";
$query = $dbConn->prepare($sql);
$query->execute (array (':Doc_identidad' => $Doc_identidad));
while($row = $query->fetch(PDO::FETCH_ASSOC) )
{
    $Doc_identidad = $row ['Doc_identidad'];
    $Tipo_doc = $row ['Tipo_doc'];
    $Nombres = $row ['Nombres'];
    $Apellidos = $row ['Apellidos'];
    $Tel_contacto = $row ['Tel_contacto'];
    $Cel_contacto = $row ['Cel_contacto'];
    $Email = $row ['Email'];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Editar</title>
    <link rel="stylesheet" href="../../../css/estilos.css">
</head>
<body>
    
    <div class="content">
        <div class="contact-wrapper">
            <div class="contact-form">
                <form name="forml" method= "post" action="editar.php">
                    <p>
                        <label>Doc. Identidad</label>
                        <input type="text" name="Doc_identidad" value="<?php echo $Doc_identidad;?>" disabled>
                    </p>
                    <p>
                        <label>Tipo documento</label>
                        <input type="text" name="Tipo_doc" value="<?php echo $Tipo_doc;?>">
                    </p>
                    <p>
                        <label>Nombres</label>
                        <input type="text" name="Nombres" value="<?php echo $Nombres;?>">
                    </p>
                    <p>
                        <label>Apellidos</label>
                        <input type="text" name="Apellidos" value="<?php echo $Apellidos;?>">
                    </p>
                    <p>
                        <label>Tel. de Contacto</label>
                        <input type="text" name="Tel_contacto" value="<?php echo $Tel_contacto;?>">
                    </p>
                    <p>
                        <label>Cel. de Contacto</label>
                        <input type="text" name="Cel_contacto" value="<?php echo $Cel_contacto;?>">
                    </p>
                    <p>
                        <label>Email</label>
                        <input type="text" name="Email" value="<?php echo $Email;?>">
                    </p>
                    <p class="block">
                        <button>
                            <input type="hidden" name="Doc_identidad" value=<?php echo $_GET['Doc_identidad'];?>>
                            <input type="submit" name="update" value="Editar">
                        </button>
                    </p>
                    
                </form>
            </div>
        </div>

    </div>

</body>
</html>
