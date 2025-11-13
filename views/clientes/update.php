<?php
    require "../../autoload.php";

    // Construir o objeto do Cliente
    $cliente = new cliente();
    $cliente->setIdCliente($_POST['idclientes']);
    $cliente->setNome($_POST['nome']);
    $cliente->setTelefone($_POST['telefone']);


    // Atualizar registro no Banco de Dados
    $dao = new ClienteDAO();
    $dao->update($cliente);

    // Redirecionar para o index (Comentar quando não funcionar)
    header('Location: index.php');