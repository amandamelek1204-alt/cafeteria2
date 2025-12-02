<?php
    require "../../autoload.php";

    // Construir o objeto do Cliente
   $cliente = new Clientes();
   $cliente->setNome($_POST['id_categoria']);
   $cliente->setTelefone($_POST['descricao']);

    // Inserir no Banco de Dados
    $dao = new ClienteDAO();
    $dao->create($categoria);

    // Redirecionar para o index (Comentar quando não funcionar)
    header('Location: index.php');