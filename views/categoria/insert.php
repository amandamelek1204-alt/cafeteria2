<?php
    require "../../autoload.php";

    // Construir o objeto do Cliente
   $cliente = new Clientes();
   $cliente->setNome($_POST['nome']);
   $cliente->setTelefone($_POST['telefone']);

    // Inserir no Banco de Dados
    $dao = new ClienteDAO();
    $dao->create($cliente);

    // Redirecionar para o index (Comentar quando não funcionar)
    header('Location: index.php');