<?php
	//include_once("principal.php");
    include ("../app/configuracao.php");
    include 'pagina_principal_secret.php';
    include ('../app/controlers/funcoes/listar_configuracoes.php');
    //include './selects_bd/select_inscri.php';
    //include ('../app/select_inscri.php');
    //include ('../app/controlers/funcoes/selecionar_classe_inscr.php');

    //SUBSTITUIR PAGINA select_inscri:php PELO CODIGO A SEGUIR
    $sql = "SELECT id_inscricacao, nome_aluno, email, contacto, dataNascCandidato, numero_bi, sexoCandidato, estadoCandidato, NacionalidadeCandidato, provincia_nasc, municipio_nasc, provincia_reside, municipio_reside, morada, classeCandidato, pai_candidato, mae_candidato, contactoEncarregado, escola_ant, ano_saida, classe_freq_escAnt, turma_frequentada,dataCadastro, dataModificacao FROM inscricao";
    $query_consultbd = $pdo->prepare($sql);
    $query_consultbd->execute();
    $inscricoes = $query_consultbd->fetchAll(PDO::FETCH_ASSOC);

    //PEGAR ULTIMO ID
    $sql_pegaultimoid = "SELECT id_inscricacao FROM inscricao ORDER BY id_inscricacao DESC LIMIT 1";
    $query_consultbd_ultmoid = $pdo->prepare($sql);
    $query_consultbd_ultmoid->execute();
    $ultimoid = $query_consultbd_ultmoid->fetchAll(PDO::FETCH_ASSOC);

?>

<style>
        h11 {
            color: red;
        }

        .modal-body {
            max-height: 60vh;
            overflow-y: auto;
        }

        .panel-heading {
            font-size: 150%;
        }

        .form-group {
            margin-bottom: 15px;
        }
        /* Estilo para a borda do fundo azul */
        .modal-content {
            border: 2px solid #007bff;
        }

        /* Estilo para cada <hr> com cores diferentes */
        hr.custom-hr {
            border: 0;
            height: 2px;
            background: linear-gradient(90deg, #ff0000, #00ff00, #0000ff);
            margin: 20px 0;
        }

        hr.custom-hr:nth-child(1) {
            background: linear-gradient(90deg, #ff0000, #ff7f00);
        }

        hr.custom-hr:nth-child(2) {
            background: linear-gradient(90deg, #ff7f00, #ffff00);
        }

        hr.custom-hr:nth-child(3) {
            background: linear-gradient(90deg, #ffff00, #00ff00);
        }

        hr.custom-hr:nth-child(4) {
            background: linear-gradient(90deg, #00ff00, #0000ff);
        }

        hr.custom-hr:nth-child(5) {
            background: linear-gradient(90deg, #0000ff, #4b0082);
        }

        hr.custom-hr:nth-child(6) {
            background: linear-gradient(90deg, #4b0082, #9400d3);
        }
          /* Estilo para o cabeçalho da modal (fundo verde) */
          .modal-header {
            background-color: #28a745; /* Verde */
            color: white; /* Texto branco */
            border-bottom: none; /* Remove a borda inferior */
        }

        /* Estilo para o título do cabeçalho */
        .modal-header .modal-title {
            color: white; /* Texto branco */
        }

        /* Estilo para o botão de fechar no cabeçalho */
        .modal-header .close {
            color: white; /* Ícone branco */
        }

        /* Estilo para o rodapé da modal (fundo verde) 
        .modal-footer {
            background-color: #28a745; /* Verde */
            /*color: white; /* Texto branco */
            /*border-top: none; /* Remove a borda superior */
       /* }
        */
        /* Estilo para o botão de fechar no rodapé */
        .modal-footer .btn-default {
            background-color: transparent;
            /*border-color: white; /* Borda branca */
            background-color: #28a745;
            color: white; /* Texto branco */
        }

        /* Estilo para a borda interna da modal (onde estão os elementos) */
        .modal-content {
            border: 2px solid #28a745; /* Borda verde */
        }

        /* Estilo para o corpo da modal (espaçamento interno) */
        .modal-body {
            padding: 20px;
        }

    </style>
<!-- area lista incrições -->
<div class="content-wrapper" >
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card card-success">
                    <div class="card-header">
                        <h3 class="card-title">INSCRIÇÕES</h3>
                        <div class="card-tools">
                            <a href="#" data-toggle="modal" data-target="#myModal" 
                                class="btn btn-sm btn-primary shadow-sm">
                                <i class="fas fa-plus fa-sm text-white-100"> Inscrições</i> </a>
                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                <i class="fas fa-minus"></i>
                            </button>
                        </div>
                        <div class="quantidade">
                            <p><label for="texto">Número de Inscritos:</label></p>
                        </div>
                    </div>
                    <div class="card-body">
                        <form name="form2" method="post" action="">
                            <div class="form-group row d-none">
                                <div class="col-sm-3">
                                    <input type="text" class="form-control form-control-sm" name="PalavraChave" maxlength="30" placeholder="Número do processo ou nome" required>
                                </div>
                                <div class="col-sm-1">
                                    <button class="btn btn-sm btn-success" name="buscar">
                                        <i class="fas fa-search"></i> Pesquisar
                                    </button>
                                </div>
                            </div>
                        </form>

                        <div class="table-responsive">
                            <form name="form1" method="post" action="">
                                <table id="Tabela" class="table table-striped table-hover table-sm" cellspacing="0">
                                    <thead class="bg-success">
                                        <tr class="filters">
                                            <th>ID</th>
                                            <th>NOME</th>
                                            <th>NÚMERO BI</th>
                                            <th>EMAIL</th>
                                            <th>CONTACTO</th>
                                            <th>SEXO</th>
                                            <th>CLASSE</th>
                                            <th class="align-center actions-column">ACÇÕES</th>
                                        </tr>
                                    </thead>
                                    <tbody class="searchable">
                                        <!-- Dados da tabela serão preenchidos aqui -->
                                        <?php
                                        $contador_incricoes = 0;
                                        foreach ($inscricoes as $inscricao) {
                                            //$id_inscricacao = $inscricao['id_categoria']; 
                                            //$contador_inscricoes = $contador_inscricoes +1
                                            ?>
                                            <tr>
                                                <td><?=$inscricao['id_inscricacao'];?></td>
                                                <td><?=$inscricao['nome_aluno'];?></td>
                                                <td><?=$inscricao['numero_bi'];?></td>
                                                <td><?=$inscricao['email'];?></td>
                                                <td><?=$inscricao['contacto'];?></td>
                                                <td><?=$inscricao['sexoCandidato'];?></td>
                                                <td><?=$inscricao['classeCandidato'];?></td>
                                                <style>
                                                    .align-right {
                                                        text-align: right;
                                                    }
                                                    .actions-column {
                                                        width: 190px; /* Define a largura fixa da coluna */
                                                    }
                                                    .align-right {
                                                        text-align: right; /* Alinha o conteúdo à direita */
                                                    }
                                                    .btn-sm {
                                                        padding: 0.25rem 0.5rem; /* Ajusta o tamanho dos botões */
                                                        font-size: 0.75rem; /* Reduz a fonte */
                                                    }
                                                </style>
                                                <td class="align-right actions-column">
                                                    <!-- Botão de Ver -->
                                                    <a href="ver_inscricao.php?id=<?=$inscricao['id_inscricacao'];?>" 
                                                    class="btn btn-info btn-sm">
                                                    Ver
                                                    </a>

                                                    <!-- Botão de Editar -->
                                                     <!-- A variavel $inscricao ela pega faz a ligação com -->
                                                    <a href="#" 
                                                    class="btn btn-warning btn-sm editarBtn" 
                                                    data-toggle="modal" 
                                                    data-target="#editarModal"
                                                    data-id="<?= $inscricao['id_inscricacao'] ?>"
                                                    data-nome="<?= $inscricao['nome_aluno'] ?>"
                                                    data-email="<?= $inscricao['email'] ?>"
                                                    data-contacto="<?= $inscricao['contacto'] ?>"
                                                    data-datanasc="<?= $inscricao['dataNascCandidato'] ?>"
                                                    data-documento="<?= $inscricao['numero_bi'] ?>"
                                                    data-sexocandidato="<?= $inscricao['sexoCandidato'] ?>"
                                                    data-estado="<?= $inscricao['estadoCandidato'] ?>"
                                                    data-nacionalidade="<?= $linha['nacionalidadeCandidato'] ?>"
                                                    data-provincia_nasc="<?= $inscricao['provincia_nasc'] ?>"
                                                    data-municipio_nasc="<?= $inscricao['municipio_nasc'] ?>"
                                                    data-provinciareside="<?= $inscricao['provincia_reside'] ?>"
                                                    data-municipioreside="<?= $inscricao['municipio_reside'] ?>"
                                                    data-morada="<?= $inscricao['morada'] ?>"
                                                    data-classe="<?= $inscricao['classeCandidato'] ?>"
                                                    data-pai-candidato="<?= $inscricao['pai_candidato'] ?>"
                                                    data-datacadastro="<?= $inscricao['dataCadastro'] ?>"
                                                    data-mae-candidato="<?= $inscricao['mae_candidato'] ?>"
                                                    data-contactoencarregado="<?= $inscricao['contactoEncarregado'] ?>"
                                                    data-escola_ant="<?= $inscricao['escola_ant'] ?>"
                                                    data-classeanterior="<?= $inscricao['classe_freq_escAnt'] ?>"
                                                    data-turmafreqdanterior="<?= $inscricao['turma_frequentada'] ?>"
                                                    data-anosaida="<?= $inscricao['ano_saida'] ?>"

                                                    data-datamodif="<?= $inscricao['dataModificacao'] ?>">
                                                    <i class="fas fa-edit"></i> Editar
                                                    </a>

                                                    <!-- Botão de Apagar -->
                                                    <a href="delete_inscricoes.php?id=<?=$inscricao['id_inscricacao'];?>" 
                                                    class="btn btn-danger btn-sm"
                                                    onclick="return confirm('Tem certeza que deseja excluir esta inscrição?');">
                                                    Apagar
                                                    </a>
                                                </td>

                                            </tr>
                                            <?php
                                        }
                                    ?>
                                        <!--Fim dados da tabela-->
                                    </tbody>
                                </table>
                            </form>
                        </div>

                        <div class="text-right mt-3">
                            <button type="button" onclick="Voltar()" class="btn btn-info">
                                <i class="fas fa-arrow-left"></i> Voltar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fim area lista -->
<?php
  include ("../admin/layout/face02.php");
  //incorporar mensagem
  include ("../layout/feedback.php");//vamos tambem icorporar na face01 essa pagina que vem do layout que é de mensagem de sessoes
?>

<!-- Nova Modal cadastro -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document"> <!-- Alterado para modal-xl -->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">INSCRIÇÃO ALUNOS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="regForm" action="./inserts_bd/insert_inscr.php" name="inscreverAluno"  method="POST" accept-charset="utf-8">
                    <fieldset>
                        <div class="card card-primary" style="border: 2px solid #28a745;"> <!-- Borda verde adicionada -->
                            <div class="card-body">
                                <div class="form-group">
                                    <div class="col-md-11 control-label">
                                        <p class="help-block"><h11>*</h11> Campo Obrigatório</p>
                                    </div>
                                </div>
                                <hr class="custom-hr">
                                <!-- Nome -->
                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="nome_aluno">Nome <h11>*</h11></label>
                                    <div class="col-md-10">
                                        <input id="nome_aluno" name="nome_aluno" placeholder="" class="form-control" required="" type="text">
                                    </div>
                                </div>

                                <!-- BI e Nascimento -->
                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="numero_bi">BI <h11>*</h11></label>
                                    <div class="col-md-4">
                                        <input id="numero_bi" name="numero_bi" placeholder="Insira o número do seu BI" class="form-control" required="" type="text" maxlength="14">
                                    </div>

                                    <label class="col-md-2 control-label" for="dataNascCandidato">Nascimento<h11>*</h11></label>
                                    <div class="col-md-4">
                                        <input id="dataNascCandidato" name="dataNascCandidato" placeholder="DD/MM/AAAA" class="form-control" required="" type="text" maxlength="10" OnKeyPress="formatar('##/##/####', this)" onBlur="showhide()">
                                    </div>
                                </div>

                                <!-- Sexo -->
                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="radios">Sexo <h11>*</h11></label>
                                    <div class="col-md-4">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="sexoCandidato" id="sexoCandidatoFeminino" value="feminino" required>
                                            <label class="form-check-label" for="sexoCandidatoFeminino">Feminino</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="sexoCandidato" id="sexoCandidatoMasculino" value="masculino">
                                            <label class="form-check-label" for="sexoCandidatoMasculino">Masculino</label>
                                        </div>
                                    </div>
                                    <!-- Nacionalidade -->
                                    <label class="col-md-2 control-label" for="NacionalidadeCandidato">Nacionalidade</label>
                                    <div class="col-md-4">
                                        <select id="NacionalidadeCandidato" name="NacionalidadeCandidato" class="form-control" onchange="carregarProvincias()" required>
                                            <option value="">Selecione o país</option>
                                            <option value="angola">Angola</option>
                                            <option value="brasil">Brasil</option>
                                            <option value="mocambique">Moçambique</option>
                                            <option value="cabo_verde">Cabo Verde</option>
                                            <option value="africa_sul">África do Sul</option>
                                            <option value="portugal">Portugal</option>
                                            <option value="namibia">Namíbia</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Naturalidade -->
                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="provincia">Naturalidade</label>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Província <h11>*</h11></span>
                                            </div>
                                            <select id="provincia" name="provincia_nasc" class="form-control" onchange="carregarMunicipios()" required>
                                                <option value="">Selecione a província</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Município</span>
                                            </div>
                                            <select id="municipio" name="municipio_nasc" class="form-control" required>
                                                <option value="">Selecione o município</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- Endereço -->
                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="provincia_m">Morada Atual</label>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Província <h11>*</h11></span>
                                            </div>
                                            <input id="provincia_m" name="provincia_m" class="form-control" placeholder="" required="" type="text">
                                        </div>
                                    </div>
                                    <label class="col-md-2 control-label" for="municipio_m">Município <h11>*</h11></label>
                                    <div class="col-md-3">
                                        <input id="municipio_m" name="municipio_m" placeholder="Insira o município" class="form-control" required="" type="text">
                                    </div>
                                </div>

                                <!-- Telefone e Estado Civil -->
                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="morada">Bairro/Rua <h11>*</h11></label>
                                    <div class="col-md-5">
                                        <input id="morada" name="morada" placeholder="Bairro/Rua" class="form-control" required="" type="text">
                                    </div>
                                    <label class="col-md-2 control-label" for="estadoCandidato">Estado Civil <h11>*</h11></label>
                                    <div class="col-md-3">
                                        <select id="estadoCandidato" name="estadoCandidato" class="form-control" required>
                                            <option value="">Selecione</option>
                                            <option value="Solteiro(a)">Solteiro(a)</option>
                                            <option value="Casado(a)">Casado(a)</option>
                                            <option value="Divorciado(a)">Divorciado<a></option>
                                            <option value="Viuvo(a)">Viúvo(a)</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Email -->
                                <div class="form-group row">
                                    <label class="col-md-2 control-label" for="telefone">Telefone</label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                            </div>
                                            <input id="contacto" name="contacto" placeholder="+244 xxx-xxx-xxx" class="form-control" type="text" maxlength="13" pattern="\[0-9]{2}\ [0-9]{4,6}-[0-9]{3,4}$" OnKeyPress="formatar('### ###-###-###', this)">
                                        </div>
                                    </div>
                                    <label class="col-md-2 control-label" for="email">Email <h11>*</h11></label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                            </div>
                                            <input id="email" name="email" placeholder="email@email.com" class="form-control" required="" type="email">
                                        </div>
                                    </div>
                                </div>
                                <!-- Encarregado de Educação -->
                                <hr class="custom-hr">
                                <div class="col-md-11 control-label">
                                    <p class="help-block"><h11>*</h11> Campo Obrigatório - Dados de Inscrição</p>
                                </div>

                                <!-- Classe de Inscrição -->
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label" for="classeCandidato">Classe Inscrição <h11>*</h11></label>
                                    <div class="col-md-9">
                                        <select required id="classeCandidato" name="classeCandidato" class="form-control">
                                            <option value="">SELECIONAR</option>
                                            <?php foreach ($consultar_classe as $consult) { ?>
                                            <option value="<?= $consult['id_classe']; ?>">
                                                <?= $consult['nome_classe']; ?> 
                                            </option>
                                        <?php } ?>
                                        </select>
                                    </div>
                                </div>

                                <!-- Encarregado de Educação -->
                                <div class="col-md-11 control-label">
                                    <p class="help-block"><h11>*</h11> Campo Obrigatório - Encarregado Escolar</p>
                                </div>
                                <hr class="custom-hr">

                                <!-- Nome do Encarregado -->
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label" for="pai_candidato">Nome <h11>*</h11></label>
                                    <div class="col-md-9">
                                        <input id="pai_candidato" name="pai_candidato" placeholder="Nome do encarregado" class="form-control" required="" type="text">
                                    </div>
                                </div>

                                <!-- Telefone do Encarregado e Vínculo -->
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label" for="contacto_encarre">Telefone <h11>*</h11></label>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                            </div>
                                            <input id="contacto_encarre" name="contacto_encarre" class="form-control" placeholder="+244 xxx-xxx-xxx" required="" type="text" maxlength="13" pattern="\[0-9]{2}\ [0-9]{4,6}-[0-9]{3,4}$" OnKeyPress="formatar('## #####-####', this)">
                                        </div>
                                    </div>
                                    <label class="col-md-2 col-form-label" for="vinculo">Vínculo com Aluno</label>
                                    <div class="col-md-3">
                                        <input id="mae_candidato" name="mae_candidato" placeholder="Grau parentesco" class="form-control" required="" type="text">
                                    </div>
                                </div>

                                <!-- Dados Escolares Anteriores -->
                                <div class="col-md-11 control-label">
                                    <p class="help-block"><h11>*</h11> Campo Obrigatório - Dados Escolar Anterior</p>
                                </div>
                                <hr class="custom-hr">

                                <!-- Escola Anterior e Última Classe -->
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label" for="escola_ant">Escola Anterior<h11>*</h11></label>
                                    <div class="col-md-4">
                                        <input id="escola_ant" name="escola_ant" type="text" placeholder="" class="form-control" required="">
                                    </div>
                                    <label class="col-md-2 col-form-label" for="classe_freq_escAnt">Última Classe <h11>*</h11></label>
                                    <div class="col-md-3">
                                    <select class="input-xs form-control in" id="classe_freq_escAnt" name="classe_freq_escAnt" required="">
                                    <option value="">Selecione</option>
                                    <?php foreach ($consultar_classe as $consult) { ?>
                                            <option value="<?= $consult['id_classe']; ?>">
                                                <?= $consult['nome_classe']; ?> 
                                            </option>
                                        <?php } ?>
                                </select>
                                    </div>
                                </div>

                                <!-- Ano de Saída e Turma -->
                                <div class="form-group row">
                                    <label class="col-md-3 col-form-label" for="ano_saida">Ano Saída <h11>*</h11></label>
                                    <div class="col-md-4">
                                        <input id="ano_saida" name="ano_saida" placeholder="" class="form-control" required="" type="text">
                                    </div>
                                    <label class="col-md-2 col-form-label" for="classe_freq_escAnt">Turma<h11>*</h11></label>
                                    <div class="col-md-3">
                                        <input id="turma_frequentada" name="turma_frequentada" type="text" placeholder="" class="form-control" required="">
                                    </div>
                                </div>
                                <!-- Botões de Cadastrar e Cancelar "retirei" -->
                                
                            </div>
                        </div>
                    </fieldset>
                                    <!--TIREI AQUI O </form>-->
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-success">Cadastrar</button>
                <button type="reset" class="btn btn-info" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
            </div>
            </form>
        </div>
    </div>
</div>
<!-- fim Modal cadastro -->
<script>
    function formatar(mascara, documento) {
        var i = documento.value.length;
        var saida = mascara.substring(0, 1);
        var texto = mascara.substring(i);
        if (texto.substring(0, 1) != saida) {
            documento.value += texto.substring(0, 1);
        }
    }
</script>



<style>
    .custom-modal {
        max-width: 690px; /* Ajusta a largura */
        height: 90%;
    }
</style>
<!-- Modal de Edição Inscrição -->
<div class="modal fade" id="editarModal" tabindex="-1" role="dialog" aria-labelledby="editarModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editarModalLabel">EDITAR DADOS DA INSCRIÇÃO</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>  
            <div class="modal-body" id="teste2">
                <form class="form-horizontal" id="editForm" action="./inserts_bd/atualizar_taixa.php" method="POST" accept-charset="utf-8">
                    <fieldset>
                        <div class="card card-primary" style="border: 2px solid #0b3d0b;">
                            <div class="card-body">
                                <div class="col-md-11 control-label">
                                    <p class="help-block"><h11>*</h11> Campo Obrigatório - DADOS PESSOAS </p>
                                </div>
                                <hr class="custom-hr">
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_id">
                                            <i class="fas fa-clipboard-list text-success"></i> ID INSCRIÇÃO <h11>*</h11>
                                        </label>
                                        <input id="edit_id" name="edit_id" class="form-control" readonly required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_nome">
                                           <i class="fas fa-user-graduate text-success"></i>
 NOME ALUNO <h11>*</h11>
                                        </label>
                                        <input id="edit_nome" name="edit_nome" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_sexoCandidato">
                                           <i class="fas fa-venus-mars text-success"></i>
 SEXO <h11>*</h11>
                                        </label>
                                        <input type="text" id="edit_sexoCandidato" name="edit_sexoCandidato" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_dataNasc">
                                            <i class="fas fa-calendar-alt text-success"></i>
DATA NASCIMENTO <h11>*</h11>
                                        </label>
                                        <input type="text" id="edit_dataNasc" name="edit_dataNasc" class="form-control" required>
                                    </div>
                                    
                                </div>
            
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_provincia_nasc">
                                           <i class="fas fa-globe text-success"></i> NATURAL <h11>*</h11>
                                        </label>
                                        <input id="edit_provincia_nasc" name="edit_provincia_nasc" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_municipio_nasc">
                                            <i class="fas fa-calendar-alt text-success"></i> Municipio <h11>*</h11>
                                        </label>
                                        <input type="text" id="edit_municipio_nasc" name="edit_municipio_nasc" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_documento">
                                            <i class="fas fa-id-card text-success"></i>
DOCUMENTO <h11>*</h11>
                                        </label>
                                        <input type="text" id="edit_documento" name="edit_documento" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row"><!--COLUNA ESCOLA ANTERIOR-->
                                
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_estado">
                                           <i class="fas fa-ring text-success"></i>   Estado Civil <h11>*</h11>
                                        </label>
                                        <input type="text" id="edit_estado" name="edit_estado" class="form-control" required>
                                    </div>
                                </div>
                                <!--FIM ESCOLA ANTERIOR-->
                                
                                <div class="col-md-11 control-label">
                                    <p class="help-block"><h11>*</h11> Campo Obrigatório - MORADA & CONTACTOS</p>
                                </div>
                                <hr class="custom-hr">

                                <div class="form-group row"><!--COLUNA ENDEREÇO-->
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_provincia_reside">
                                           <i class="fas fa-venus-mars text-success"></i>Provincia Residência<h11>*</h11>
                                        </label>
                                        <input id="edit_provincia_reside" name="edit_provincia_reside" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="municipio_m">
                                           <i class="fas fa-ring text-success"></i>Municipio Residência <h11>*</h11>
                                        </label>
                                        <input type="text" id="edit_municipio_reside" name="edit_municipio_reside" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_morada">Bairro/Rua <h11>*</h11></label>
                                        <input type="text" id="edit_morada" name="edit_morada" class="form-control" required>
                                    </div>
                                </div>
                                <!--FIM COLUNA ENDEREÇO-->  
                                <div class="form-group row"><!--COLUNA CONTACTOS-->
                                    <div class="col-md-4">
                                        <label class="control-label" for="contacto">
                                           <i class="fas fa-venus-mars text-success"></i>Telefone<h11>*</h11>
                                        </label>
                                        <input id="edit_contacto" name="contacto" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="email">
                                           <i class="fas fa-ring text-success"></i>Email <h11>*</h11>
                                        </label>
                                        <input type="text" id="edit_email" name="edit_email" class="form-control" required>
                                    </div>
                                </div>
                                <!--FIM COLUNA CONTACTOS-->
                                
                                <div class="col-md-11 control-label">
                                    <p class="help-block"><h11>*</h11> Campo Obrigatório - DADOS DA INSCRIÇÃO</p>
                                </div>
                                <hr class="custom-hr">
                                <div class="form-group row"><!--COLUNA CLASSE INSCRIÇÃO-->
                                    <div class="col-md-6">
                                        <label class="control-label" for="edit_classe">
                                           <i class="fas fa-venus-mars text-success"></i>Classe de Inscrição<h11>*</h11>
                                        </label>
                                        <input id="edit_classe" name="edit_classe" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label" for="edit_datacadastro">
                                           <i class="fas fa-ring text-success"></i>Data Inscrição <h11>*</h11>
                                        </label>
                                        <input type="text" id="edit_datacadastro" name="edit_datacadastro" class="form-control" required>
                                    </div>
                                </div>
                                <!--FIM COLUNA CLASSE INSCRIÇÃO-->
                                <div class="col-md-11 control-label">
                                    <p class="help-block"><h11>*</h11> Campo Obrigatório - ENCARREGADO DE EDUCAÇÃO</p>
                                </div>
                                <hr class="custom-hr">
                                <div class="form-group row"><!--COLUNA CLASSE INSCRIÇÃO-->
                                    <div class="col-md-4">
                                        <label class="control-label" for="pai_candidato">
                                           <i class="fas fa-venus-mars text-success"></i> Encarregado<h11>*</h11>
                                        </label>
                                        <input id="edit_encarregado" name="edit_encarregado" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="edit_mae_candidato">
                                           <i class="fas fa-ring text-success"></i> Vínculo/Aluno  <h11>*</h11>
                                        </label>
                                        <input type="text" id="edit_mae_candidato" name="edit_mae_candidato" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="contactoEncarregado">
                                           <i class="fas fa-venus-mars text-success"></i> Contactos<h11>*</h11>
                                        </label>
                                        <input id="edit_contactoencarregado" name="edit_contactoencarregado" class="form-control" required>
                                    </div>
                                </div>
                                <!--FIM COLUNA CLASSE INSCRIÇÃO-->
                                <div class="col-md-11 control-label">
                                    <p class="help-block"><h11>*</h11> Campo Obrigatório - ENCARREGADO DE EDUCAÇÃO</p>
                                </div>
                                <hr class="custom-hr">
                                <div class="form-group row"><!--COLUNA ESCOLA ANTERIOR-->
                                    <div class="col-md-4">
                                        <label class="control-label" for="editescola_ant">
                                           <i class="fas fa-venus-mars text-success"></i>  Escola Anterior<h11>*</h11>
                                        </label>
                                        <input id="editescola_ant" name="editescola_ant" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="classe_freq_escAnt">
                                           <i class="fas fa-ring text-success"></i>  Classe anterior <h11>*</h11>
                                        </label>
                                        <input type="text" id="classeanterior" name="classeanterior" class="form-control" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="control-label" for="turma_frequentada">
                                           <i class="fas fa-ring text-success"></i>   Turma <h11>*</h11>
                                        </label>
                                        <input type="text" id="turmafreqdanterior" name="turmafreqdanterior" class="form-control" required>
                                    </div>
                                </div>
                                <!--FIM ESCOLA ANTERIOR-->
                                <div class="form-group row"><!--COLUNA ESCOLA ANTERIOR-->
                                
                                    <div class="col-md-4">
                                        <label class="control-label" for="ano_saida">
                                           <i class="fas fa-ring text-success"></i>   Ano saida <h11>*</h11>
                                        </label>
                                        <input type="text" id="anosaida" name="anosaida" class="form-control" required>
                                    </div>
                                </div>
                                <!--FIM ESCOLA ANTERIOR-->
                            </div>
                        </div>
                    </fieldset>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">
                            <i class="fas fa-print"></i> Imprimir
                        </button>
                        <!--
                        <button type="button" class="btn btn-info">
                            <i class="fas fa-file-alt"></i> Gerar ficha
                        </button>
                        -->
                            <input type="hidden" name="id_candidato" value="<?= $linha['id_candidato'] ?>">
                            <button type="button" id="teste" class="btn btn-info">
                                <i class="fas fa-file-alt"></i> Gerar ficha
                            </button>
                        <button type="submit" class="btn btn-success">Salvar Alterações</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    let dados = new FormData();
$(document).on("click", ".editarBtn", function () {
    // lê os data-* do botão (esses já tens no botão Editar)
    var id = $(this).data('id');
    var nome = $(this).data('nome');
    var email = $(this).data('email');
    var contacto = $(this).data('contacto');
    var dataNasc = $(this).data('datanasc');
    var documento = $(this).data('documento');
    var sexoCandidato = $(this).data('sexocandidato');
    var estado = $(this).data('estado');
    var nacionalidade = $(this).data('nacionalidade');
    var provincia_nasc = $(this).data('provincia_nasc');
    var municipio_nasc = $(this).data('municipio_nasc');
    var provincia_reside = $(this).data('provinciareside');
    var municipio_reside = $(this).data('municipioreside');
    var morada = $(this).data('morada');
    var classe = $(this).data('classe');
    var datacadastro = $(this).data('datacadastro');
    var paiCandidato = $(this).data('paiCandidato') || $(this).data('pai-candidato') || $(this).data('pai_candidato');
    var maeCandidato = $(this).data('maeCandidato') || $(this).data('mae-candidato') || $(this).data('mae_candidato');
    var contactoEncarregado = $(this).data('contactoencarregado') || $(this).data('contacto-encarregado');
    var escola_ant = $(this).data('escola_ant');
    var classeanterior = $(this).data('classeanterior');
    var turmafreqdanterior = $(this).data('turmafreqdanterior');
    var anosaida = $(this).data('anosaida');

    // preenche os inputs visíveis da modal (IDs devem existir na modal)
    
    $("#edit_id").val(id);
    $("#edit_nome").val(nome);
    $("#edit_email").val(email);
    $("#edit_contacto").val(contacto);
    $("#edit_dataNasc").val(dataNasc);
    $("#edit_documento").val(documento);
    $("#edit_sexoCandidato").val(sexoCandidato);
    $("#edit_estado").val(estado);
    $("#edit_nacionalidade").val(nacionalidade);
    $("#edit_provincia_nasc").val(provincia_nasc);
    $("#edit_municipio_nasc").val(municipio_nasc);
    $("#edit_provincia_reside").val(provincia_reside);
    $("#edit_municipio_reside").val(municipio_reside);
    $("#edit_morada").val(morada);
    $("#edit_classe").val(classe);
    $("#edit_datacadastro").val(datacadastro);
    $("#edit_encarregado").val(paiCandidato);
    $("#edit_mae_candidato").val(maeCandidato);
    $("#edit_contactoencarregado").val(contactoEncarregado);
    $("#editescola_ant").val(escola_ant);
    $("#classeanterior").val(classeanterior);
    $("#turmafreqdanterior").val(turmafreqdanterior);
    $("#anosaida").val(anosaida);

    dados.append("id",id);
    dados.append("nome",nome);
    dados.append("email",email);
    dados.append("contacto", contacto);
    dados.append("dataNasc", dataNasc);
    dados.append("documento",documento);/*
    $("#edit_sexoCandidato").val(sexoCandidato);
    $("#edit_estado").val(estado);
    $("#edit_nacionalidade").val(nacionalidade);
    $("#edit_provincia_nasc").val(provincia_nasc);
    $("#edit_municipio_nasc").val(municipio_nasc);
    $("#edit_provincia_reside").val(provincia_reside);
    $("#edit_municipio_reside").val(municipio_reside);
    $("#edit_morada").val(morada);*/
    dados.append("classe",classe);
    /*$("#edit_datacadastro").val(datacadastro);
    $("#edit_encarregado").val(paiCandidato);
    $("#edit_mae_candidato").val(maeCandidato);
    $("#edit_contactoencarregado").val(contactoEncarregado);*/
    dados.append("escola_ant",escola_ant);
    /*$("#classeanterior").val(classeanterior);
    $("#turmafreqdanterior").val(turmafreqdanterior);
    $("#anosaida").val(anosaida);*/
});

// Handler do botão "Gerar ficha" — cria form POST e abre em nova aba
$(document).on("click", "#btnGerarFicha", function (e) {
    e.preventDefault();

    // lê valores actuais da modal (visíveis ou hidden)
    var data = {
        id_inscricao: $("#edit_id").val(),
        nome: $("#edit_nome").val(),
        numero_bi: $("#edit_documento").val(),
        dataNasc: $("#edit_dataNasc").val(),
        sexo: $("#edit_sexoCandidato").val(),
        nacionalidade: $("#edit_nacionalidade").val(),
        provincia_nasc: $("#edit_provincia_nasc").val(),
        municipio_nasc: $("#edit_municipio_nasc").val(),
        provincia_reside: $("#edit_provincia_reside").val(),
        municipio_reside: $("#edit_municipio_reside").val(),
        morada: $("#edit_morada").val(),
        contacto: $("#edit_contacto").val(),
        email: $("#edit_email").val(),
        classe: $("#edit_classe").val(),
        pai_candidato: $("#edit_encarregado").val(),
        mae_candidato: $("#edit_mae_candidato").val(),
        contactoEncarregado: $("#edit_contactoencarregado").val(),
        escola_ant: $("#editescola_ant").val(),
        classeanterior: $("#classeanterior").val(),
        turmafreqdanterior: $("#turmafreqdanterior").val(),
        ano_saida: $("#anosaida").val(),
        datacadastro: $("#edit_datacadastro").val()
    };

    // cria form dinamicamente e submete para gerarpdf_insc.php em nova aba
    var $form = $('<form>', {
        action: 'gerarpdf_insc.php',
        method: 'POST',
        target: '_blank',
        style: 'display:none;'
    });

    $.each(data, function (name, value) {
        $form.append($('<input>', { type: 'hidden', name: name, value: value }));
    });

    $('body').append($form);
    $form.submit();
    $form.remove();
});

document.getElementById("teste").addEventListener('click',()=>{
    //alert("OLA MUNDO 33")
    //let editar = document.getElementById("teste2")
   // editar.style.display="none"
   


   let = xhr = new XMLHttpRequest();
    xhr.open("POST","gerarpdf_insc.php", true)
    xhr.responseType = "blob"

    xhr.onload = ()=>{
        if (xhr.status===200) {

           let blob = new Blob ([xhr.response],{type: "application/pdf"});
           let url = window.URL.createObjectURL(blob);
           window.open(url,"_blank");
           //onsole.log(xhr.responseText);
        }else{
            alert("Erro ao tentar gerar ficha")
        }
    }
    xhr.send(dados)

})
</script>




