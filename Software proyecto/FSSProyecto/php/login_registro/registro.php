<?php
    require '../configsesion.php';

    if(isset($_POST['registro']) ) {
        $errMsg = '';

    // Get data from FROM
    $Doc_identidad = $_POST['Doc_identidad'];
    $Nom_usuario = $_POST['Nom_usuario'];
    $Password = $_POST['Password'];
    $Tipo_usuario = $_POST['Tipo_usuario'];

    if($Doc_identidad == '')
        $errMsg = 'Ingrese su documento';
    if($Nom_usuario == '')
        $errMsg = 'Ingrese su nombre de usuario';
    if($Password == '')
        $errMsg = 'Ingrese su Contraseña';
    if($Tipo_usuario == '')
        $errMsg = 'Ingrese su tipo de usuario';

    if($errMsg == '') {
        try {
            $stmt = $connect->prepare('INSERT INTO login (Doc_identidad, Nom_usuario, Password, Tipo_usuario) VALUES (:Doc_identidad, :Nom_usuario, :Password, :Tipo_usuario)');
            $stmt->execute(array(
                ':Doc_identidad' => $Doc_identidad,
                ':Nom_usuario' => $Nom_usuario,
                ':Password' => $Password,
                ':Tipo_usuario' => $Tipo_usuario,
            ));
            header('Location: registro.php?action=joined');
            exit;
        }
        catch(PDOException $e) {
            echo $e->getMessage();
            }
        }
    }
    if(isset ($_GET['action']) && $_GET['action'] == 'joined') {
        $errMsg = '¡¡Registro Exitoso!!. Ahora puede Ingresar <a href="login.php">Ingreso</a>';
    }
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registrar</title>
    <link rel="stylesheet" href="../../css/estilos.css">
</head>
<body>
    
    <div class="content">
        <div class="contact-wrapper">
            <div class="contact-form">
                <form action="" method="post">
                    <p>
                        <label>Doc. Identidad</label>
                        <input type="text" name="Doc_identidad"
                            value="<?php if (isset($_POST['Doc_identidad'])) echo $_POSI['Doc_identidad']?>" autocomplete="off"/>
                    </p>
                    <p>
                        <label>Nombre de usuario</label>
                        <input type="text" name="Nom_usuario"
                            value="<?php if (isset($_POST['Nom_usuario'])) echo $_POSI['Nom_usuario']?>" autocomplete="off"/>
                    </p>
                    <p>
                        <label>Contraseña</label>
                        <input type="Password" name="Password"
                            value="<?php if (isset($_POST['Password'])) echo $_POSI['Password']?>" autocomplete="off"/>
                    </p>
                    <p>
                        <label>Tipo de usuario</label>
                        <input type="text" name="Tipo_usuario"
                            value="<?php if (isset($_POST['Tipo_usuario'])) echo $_POSI['Tipo_usuario']?>" autocomplete="off"/>
                    </p>
                    <p class="block">
                        <button>
                            <input type="submit" name='registro' value="Registro"/>
                        </button>
                    </p>
                </form>
            </div>
        </div>
    </div>
    <?php
            if(isset($errMsg)){
                echo '<div style="color:white;text-align:center;font-size:l7px;">'.$errMsg.'</dív>';
            }
        ?>

</body>
</html>