<?php
    class Clientes {
        // Atributos
        
        private $idClientes;
        private $nome;
        private $telefone;
       

        // Métodos
        public function getIdClientes() {
            return $this->idClientes;
        }

        public function setIdClientes($idClientes) {
            $this->idClientes = $idClientes;
        }

        public function getNome() {
            return $this->nome;
        }

        public function setNome($nome) {
            $this->nome = $nome;
        }

        public function getTelefone() {
            return $this->telefone;
        }

        public function setTelefone($telefone) {
            $this->telefone = $telefone;
        }

    

        // Método para retornar uma string do objeto
        public function __toString() {
            return $this->razaoSocial;
        }
    }