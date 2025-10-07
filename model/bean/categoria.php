<?php
    class Categoria {
        // Atributos
        private $id;
        private $cliente;
        private $funcionario;
        private $categoria;
        private $formapagamento;

        // Métodos
        public function getId() {
            return $this->id;
        }

        public function setId($id) {
            $this->id = $id;
        }

        public function getCliente() {
            return $this->cliente;
        }

        public function setCnpj($cliente) {
            $this->cliente = $cliente;
        }

        public function getFuncionario() {
            return $this->funcionario;
        }

        public function setFuncionario($funcionario) {
            $this->funcionario = $funcionario;
        }

        public function getCategoria() {
            return $this->categoria;
        }

        public function setCategoria($categoria) {
            $this->categoria = $categoria;
        }

        public function getFormaPagamento() {
            return $this->formapagamento;
        }

        public function setTelefone($telefone) {
            $this->formapagamento = $formapagamento;
        }

        // Método para retornar uma string do objeto
        public function __toString() {
            return $this->razaoSocial;
        }
    }