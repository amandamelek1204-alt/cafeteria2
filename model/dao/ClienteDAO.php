<?php
    class ClienteDAO {
        public function create($cliente) {
            try {
                $query = BD::getConexao()->prepare(
                    "INSERT INTO clientes(nome, telefone) 
                     VALUES (:n, :t)"
                );
          
                $query->bindValue(':n',$cliente->getNome(), PDO::PARAM_STR);
                $query->bindValue(':t',$cliente->getTelefone(), PDO::PARAM_STR);
                
                if(!$query->execute())
                    print_r($query->errorInfo());
            }
            catch(PDOException $e) {
                echo "Erro #1: " . $e->getMessage();
            }
        }

        public function read() {
            try {
                $query = BD::getConexao()->prepare("SELECT * FROM clientes");
                

                if(!$query->execute())
                    print_r($query->errorInfo());

                $clientees = array();
                foreach($query->fetchAll(PDO::FETCH_ASSOC) as $linha) {
                    $cliente = new clientes();
                    $cliente->setIdClientes($linha['id_clientes']);
                    $cliente->setNome($linha['nome']);
                    $cliente->setTelefone($linha['telefone']);

                    array_push($clientees,$cliente);
                }

                return $clientees;
            }
            catch(PDOException $e) {
                echo "Erro #2: " . $e->getMessage();
            }
        }

        public function find($id) {
            try {
                $query = BD::getConexao()->prepare("SELECT * FROM cliente WHERE id_cliente = :i");
                $query->bindValue(':i',$id, PDO::PARAM_INT);

                if(!$query->execute())
                    print_r($query->errorInfo());

                $linha = $query->fetch(PDO::FETCH_ASSOC);
                $cliente = new cliente();
                $cliente->setId($linha['id_cliente']);
                $cliente->setCnpj($linha['nome']);
                $cliente->setTelefone($linha['telefone']);

                return $cliente;
            }
            catch(PDOException $e) {
                echo "Erro #3: " . $e->getMessage();
            }
        }

        public function update($cliente) {
            try {
                $query = BD::getConexao()->prepare(
                    "UPDATE cliente 
                     SET idcliente = :c , nome = :n, telefone = :t 
                     WHERE id_cliente = :i"
                );
                $query->bindValue(':c',$cliente->getidCliente(), PDO::PARAM_STR);
                $query->bindValue(':r',$cliente->getNome(), PDO::PARAM_STR);
                $query->bindValue(':t',$cliente->getTelefone(), PDO::PARAM_STR);
               

                if(!$query->execute())
                    print_r($query->errorInfo());
            }
            catch(PDOException $e) {
                echo "Erro #4: " . $e->getMessage();
            }
        }

        public function destroy($id) {
            try {
                $query = BD::getConexao()->prepare(
                    "DELETE FROM clientes 
                     WHERE id_clientes = :i"
                );
                $query->bindValue(':i',$id, PDO::PARAM_INT);

                if(!$query->execute())
                    print_r($query->errorInfo());
            }
            catch(PDOException $e) {
                echo "Erro #5: " . $e->getMessage();
            }
        }
    }