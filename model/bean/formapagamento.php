<?php
    class Formapagamento {
        // Atributos
       
       
        private $idPagamento;
        private $descricao;


        // Métodos
        public function getIdPagamento() {
            return $this->idpagamento;
        }

        public function setIdPagamento($idPagamento) {
            $this->idpagamento = $idpagamento;
        }

        public function getDescricao() {
            return $this->descricao;
        }

        public function setDescricao($descricao) {
            $this->descricao = $descricao;
        }

       
        

        // Método para retornar uma string do objeto
        public function __toString() {
            return $this->descricao;
        }
    }