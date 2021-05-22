<?php
require('fpdf/fpdf.php');

class PDF extends FPDF
{
// Cabecera de página
function Header()
{
    // Arial bold 15
    $this->SetFont('Arial','B',12);
    // Movernos a la derecha
    $this->Cell(60);
    // Título
    $this->Cell(70,10,'Reporte usuarios del gimnasio',0,0,'C');
    // Salto de línea
    $this->Ln(20);

    $this->Cell(25, 10, 'Nombre', 1, 0, 'C', 0);
    $this->Cell(25, 10, 'Apellido', 1, 0, 'C', 0);
    $this->Cell(28, 10, utf8_decode('Contraseña'), 1, 0, 'C', 0);
    $this->Cell(28, 10, 'Documento', 1, 0, 'C', 0);
    $this->Cell(48, 10, 'Email', 1, 0, 'C', 0);
    $this->Cell(30, 10, 'Tipo usuario', 1, 1, 'C', 0);

}

// Pie de página
function Footer()
{
    // Posición: a 1,5 cm del final
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Número de página
    $this->Cell(0,10,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'C');
}
}

require 'conexion.php';
$consulta = "SELECT * FROM users";
$resultado = $mysqli->query($consulta);

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Arial','',11);

while($row = $resultado->fetch_assoc()){
    $pdf->Cell(25, 10, $row['nombre'], 1, 0, 'C', 0);
    $pdf->Cell(25, 10, $row['apellido'], 1, 0, 'C', 0);
    $pdf->Cell(28, 10, $row['pw'], 1, 0, 'C', 0);
    $pdf->Cell(28, 10, $row['documento'], 1, 0, 'C', 0);
    $pdf->Cell(48, 10, $row['email'], 1, 0, 'C', 0);
    $pdf->Cell(30, 10, $row['tipo_usuario'], 1, 1, 'C', 0);
}


$pdf->Output();
?>