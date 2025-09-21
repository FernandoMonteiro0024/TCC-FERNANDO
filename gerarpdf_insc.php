<?php
/*
inclued("../app/configuracao.php");
require_once('../tcpdf/tcpdf.php');

echo "OLA MUNDO";
*/
/*
// Receber dados via POST (vêm do form hidden da modal)
$id_inscricao   = $_POST['id_inscricao'] ?? '';
$nome           = $_POST['nome'] ?? '';
$sexo           = $_POST['sexo'] ?? '';
$dataNasc       = $_POST['dataNasc'] ?? '';
$provincia      = $_POST['provincia_nasc'] ?? '';
$municipio      = $_POST['municipio_nasc'] ?? '';
$documento      = $_POST['documento'] ?? '';
$estado         = $_POST['estado'] ?? '';

// Criar novo PDF
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Instituto Nacional de Formação de Quadros');
$pdf->SetTitle('Ficha de Inscrição');

// Remover cabeçalho e rodapé padrão
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);

// Adicionar página
$pdf->AddPage();

// Definir fonte
$pdf->SetFont('dejavusans', '', 10);

// Cabeçalho oficial
$html = '
<h3 style="text-align:center;">REPÚBLICA DE ANGOLA<br>
MINISTÉRIO DA EDUCAÇÃO<br>
INSTITUTO NACIONAL DE FORMAÇÃO DE QUADROS DA EDUCAÇÃO</h3>
<h4 style="text-align:center;">FICHA DE INSCRIÇÃO Nº '.$id_inscricao.'</h4>
<hr>
';

// Dados do candidato
$html .= '
<table border="1" cellpadding="4">
    <tr><td colspan="2" bgcolor="#d9edf7"><b>DADOS DO CANDIDATO</b></td></tr>
    <tr><td width="30%"><b>Nome Completo</b></td><td>'.$nome.'</td></tr>
    <tr><td><b>Género</b></td><td>'.$sexo.'</td></tr>
    <tr><td><b>Data de Nascimento</b></td><td>'.$dataNasc.'</td></tr>
    <tr><td><b>Província de Nascimento</b></td><td>'.$provincia.'</td></tr>
    <tr><td><b>Município</b></td><td>'.$municipio.'</td></tr>
    <tr><td><b>Documento</b></td><td>'.$documento.'</td></tr>
    <tr><td><b>Estado Civil</b></td><td>'.$estado.'</td></tr>
</table>
<br><br>
';

// Aqui pode entrar a tabela da Escola Anterior e Dados da Inscrição
$html .= '
<table border="1" cellpadding="4">
    <tr><td colspan="4" bgcolor="#d9edf7"><b>ESCOLA ANTERIOR ONDE FREQUENTOU</b></td></tr>
    <tr>
        <td><b>Nome</b></td>
        <td><b>Município</b></td>
        <td><b>Média</b></td>
        <td><b>Ano de Conclusão</b></td>
    </tr>
    <tr>
        <td>Complexo Escolar nº2014</td>
        <td>Belas</td>
        <td>14</td>
        <td>2025</td>
    </tr>
</table>
<br><br>
';

// Dados da inscrição
$html .= '
<table border="1" cellpadding="4">
    <tr><td colspan="2" bgcolor="#d9edf7"><b>DADOS DA INSCRIÇÃO</b></td></tr>
    <tr><td><b>Província</b></td><td>Luanda</td></tr>
    <tr><td><b>Instituto</b></td><td>Complexo Escolar</td></tr>
    <tr><td><b>1ª Curso</b></td><td>C.E.J</td></tr>
    <tr><td><b>2ª Curso</b></td><td>C.F.B</td></tr>
</table>
<br><br>
';

// Local de exame
$html .= '
<table border="1" cellpadding="4">
    <tr><td colspan="3" bgcolor="#d9edf7"><b>LOCAL, SALA E DATA DO EXAME</b></td></tr>
    <tr>
        <td><b>Local do Exame</b></td>
        <td><b>Sala</b></td>
        <td><b>Horário</b></td>
    </tr>
    <tr>
        <td>ITEL (Instituto de Telecomunicações)</td>
        <td>12</td>
        <td>12/08/2025 das 08:00 às 10:00</td>
    </tr>
</table>
<br>
<p><i>Estudante candidato, somos a informar que deve chegar 30 min antes do exame...</i></p>
';

// Escrever HTML no PDF
$pdf->writeHTML($html, true, false, true, false, '');

// Saída do PDF
$pdf->Output('ficha_inscricao_'.$id_inscricao.'.pdf', 'I');
*/
// Inclui a biblioteca TCPDF
require_once('../tcpdf/tcpdf.php'); // Ajuste o caminho conforme sua estrutura
include("../app/configuracao.php"); // Conexão com o banco de dados

$ID            = $_POST['id'] ?? '';
$Nome            = $_POST['nome'] ?? '';
$DataNascimento  = $_POST['data_nascimento'] ?? '';
$NumeroBI        = $_POST['numero_bi'] ?? '';
$Telefone        = $_POST['telefone'] ?? '';
$EscolaAntes     = $_POST['escola_ant'] ?? '';
$ClasseIncricao  = $_POST['classe'];

$pdf = new TCPDF();
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Sistema Escolar');
$pdf->SetTitle("Ficha de Inscrição - $Nome");

// Definição de margens e página
$pdf->SetMargins(25, 30, 25);
$pdf->SetAutoPageBreak(true, 20);
$pdf->AddPage();

// --- LOGO ---
$logo = '../public/dist/img/compl_sgt.jpg';
if (file_exists($logo)) {
    // Centralizado e menor
    $pdf->Image($logo, 90, 10, 30, 30); 
    $pdf->Ln(9); // espaço: altura logo (30mm) + 15mm
}

// --- SUBTÍTULOS ---
$pdf->SetFont('helvetica', 'B', 12);
$pdf->Cell(0, 6, 'República de Angola', 0, 1, 'C');

$pdf->SetFont('helvetica', '', 11);
$pdf->Cell(0, 6, 'Ministério da Educação', 0, 1, 'C');

$pdf->SetFont('helvetica', '', 11);
$pdf->Cell(0, 6, 'Complexo Escolar Simão Gonçalves Toco', 0, 1, 'C');

// Espaço perfeito antes dos Dados Pessoais
$pdf->Ln(10);

// --- TÍTULO PRINCIPAL ---
$pdf->SetFont('helvetica', 'B', 14);
$pdf->Cell(0, 10, 'FICHA DE INSCRIÇÃO', 0, 1, 'C');
$pdf->Ln(10); // espaço antes dos Dados Pessoais

// --- DADOS PESSOAIS ---
$pdf->SetFont('helvetica', 'B', 12);
$pdf->SetFillColor(217, 237, 247); 
$pdf->Cell(0, 8, 'DADOS PESSOAIS', 1, 1, 'C', 1);
$pdf->Ln(3);

// Conteúdo
$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(60, 7, 'Codigo Inscrição:', 1, 0, 'L');
$pdf->SetFont('helvetica', '', 10);
$pdf->Cell(100, 7, $ID, 1, 1, 'L');


$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(60, 7, 'Nome:', 1, 0, 'L');
$pdf->SetFont('helvetica', '', 10);
$pdf->Cell(100, 7, $Nome, 1, 1, 'L');

$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(60, 7, 'Data de Nascimento:', 1, 0, 'L');
$pdf->SetFont('helvetica', '', 10);
$pdf->Cell(100, 7, $DataNascimento, 1, 1, 'L');

$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(60, 7, 'BI nº:', 1, 0, 'L');
$pdf->SetFont('helvetica', '', 10);
$pdf->Cell(100, 7, $NumeroBI, 1, 1, 'L');

$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(60, 7, 'Telefone:', 1, 0, 'L');
$pdf->SetFont('helvetica', '', 10);
$pdf->Cell(100, 7, $Telefone, 1, 1, 'L');


// --- DADOS ESCOLA ANTERIOR ---
$pdf->Ln(12); // espaço maior para separar bem das informações pessoais
$pdf->SetFont('helvetica', 'B', 12);
$pdf->SetFillColor(217, 237, 247); 
$pdf->Cell(0, 8, 'DADOS ESCOLA ANTERIOR', 1, 1, 'C', 1);
$pdf->Ln(3);

$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(60, 7, 'Nome da Escola:', 1, 0, 'L');
$pdf->SetFont('helvetica', '', 10);
$pdf->Cell(100, 7, $EscolaAntes, 1, 1, 'L');

// --- DADOS DA CLASSE DE INSCRIÇÃO ---
$pdf->Ln(12); // espaço maior para separar das informações da escola anterior
$pdf->SetFont('helvetica', 'B', 12);
$pdf->SetFillColor(217, 237, 247); 
$pdf->Cell(0, 8, 'DADOS DA CLASSE DE INSCRIÇÃO', 1, 1, 'C', 1);
$pdf->Ln(5);

$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(60, 7, 'Classe de Incrição:', 1, 0, 'L');
$pdf->SetFont('helvetica', '', 10);
$pdf->Cell(100, 7, $ClasseIncricao, 1, 1, 'L');



$pdf->Output("ficha.pdf", "I");


// Gera o PDF e exibe no navegador
//$pdf->Output("Lista_Alunos_$Nome.pdf", 'I');

