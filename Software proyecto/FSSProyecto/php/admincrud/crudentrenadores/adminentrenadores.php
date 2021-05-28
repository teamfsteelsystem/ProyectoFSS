<?php
  include('../php/conexion.php');
  $entrenadores = "SELECT * FROM entrenador";
?>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>GYM FSS</title>
        <link rel="stylesheet" href="../css/estilos.css">
        <link rel="stylesheet" href="../flaticon/flaticon.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>

<body>

    <!--ESTA ES LA CABECERA-->
    <header>
        <div class="centrarnav">
            <div class="logo">
                FITNESS STORAGE SYSTEM
            </div>
            <nav>
                <a href="adminclientes.php">CLIENTES</a>
                <a href="adminentrenadores.php"><span class="activo">ENTRENADORES</span></a>
                <a href="adminpagos.html">PAGOS</a>
                <a href="adminnomina.html">NÓMINA</a>
                <a href="admingastos.html">GASTOS</a>
                <a href="#">SALIR</a>
            </nav>
        </div>
    </header>

    <!--ESTO ES LA PORTADA-->
    
    <div class="espaciotop contenedor">
        <div class="title2">ENTRENADORES</div>
        <div class="subtitle">INICIO • <span class="inactivo">ENTRENADORES</span></div>
    </div>

    <!--ESTO ES EL CONTENIDO-->

<section class="centar espaciotop">
    <table class="centrar contenido-tabla" border="1" bordercolor="white">
        <thead>
            <tr>
                <th>Doc. Identidad</th>
                <th>Tipo doc</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Télefono</th>
                <th>Celular</th>
                <th>Email</th>
            </tr>
        </thead>
        <?php $resultado = mysqli_query($conexion, $entrenadores);
        while($row=mysqli_fetch_assoc($resultado)) { ?>
        <tbody>
            <tr>
                <th><?php echo $row['Doc_identidad'];?></th>
                <th><?php echo $row['Tipo_doc'];?></th>
                <th><?php echo $row['Nombres'];?></th>
                <th><?php echo $row['Apellidos'];?></th>
                <th><?php echo $row['Tel_contacto'];?></th>
                <th><?php echo $row['Cel_contacto'];?></th>
                <th><?php echo $row['Email'];?></th>
            </tr>
        </tbody>
        <?php } ?>
    </table>
</section>

        <p class="espaciobot"></p>



</body>

</html>