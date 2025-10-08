<?php
    class Funcionario {
        // Atributos
      
        private $idFuncionario;
        private $nome;
        

        // Métodos
        public function getIdFuncionario() {
            return $this->idfuncionario;
        }

        public function setIdFuncionario($idfuncionario) {
            $this->idfuncionario = $idfuncionario;
        }

        public function getNome() {
            return $this->nome;
        }

        public function setNome($nome) {
            $this->telefone = $nome;
        }


      
        

        // Método para retornar uma string do objeto
        public function __toString() {
            return $this->razaoSocial;
        }
    }