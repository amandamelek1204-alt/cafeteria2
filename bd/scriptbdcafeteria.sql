-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_cafeteria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_cafeteria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_cafeteria` DEFAULT CHARACTER SET utf8 ;
USE `bd_cafeteria` ;

-- -----------------------------------------------------
-- Table `bd_cafeteria`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cafeteria`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_cafeteria`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cafeteria`.`produtos` (
  `id_pedidos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `preco` DECIMAL NULL,
  `descricao` TEXT NULL,
  `categoria_idcategoria` INT NOT NULL,
  PRIMARY KEY (`id_pedidos`),
  INDEX `fk_produtos_categoria_idx` (`categoria_idcategoria` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_categoria`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `bd_cafeteria`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_cafeteria`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cafeteria`.`clientes` (
  `id_clientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`id_clientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_cafeteria`.`formapagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cafeteria`.`formapagamento` (
  `idpagamento` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idpagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_cafeteria`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cafeteria`.`funcionarios` (
  `id_funcionarios` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id_funcionarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_cafeteria`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cafeteria`.`pedido` (
  `idpedido` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NULL,
  `clientes_id_clientes` INT NOT NULL,
  `formapagamento_idpagamento` INT NOT NULL,
  `funcionarios_id_funcionarios` INT NOT NULL,
  PRIMARY KEY (`idpedido`, `formapagamento_idpagamento`),
  INDEX `fk_pedido_clientes1_idx` (`clientes_id_clientes` ASC) VISIBLE,
  INDEX `fk_pedido_formapagamento1_idx` (`formapagamento_idpagamento` ASC) VISIBLE,
  INDEX `fk_pedido_funcionarios1_idx` (`funcionarios_id_funcionarios` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_clientes1`
    FOREIGN KEY (`clientes_id_clientes`)
    REFERENCES `bd_cafeteria`.`clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_formapagamento1`
    FOREIGN KEY (`formapagamento_idpagamento`)
    REFERENCES `bd_cafeteria`.`formapagamento` (`idpagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_funcionarios1`
    FOREIGN KEY (`funcionarios_id_funcionarios`)
    REFERENCES `bd_cafeteria`.`funcionarios` (`id_funcionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_cafeteria`.`produtos_has_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cafeteria`.`produtos_has_pedido` (
  `produtos_id_pedidos` INT NOT NULL,
  `pedido_idpedido` INT NOT NULL,
  `pedido_formapagamento_idpagamento` INT NOT NULL,
  PRIMARY KEY (`produtos_id_pedidos`, `pedido_idpedido`, `pedido_formapagamento_idpagamento`),
  INDEX `fk_produtos_has_pedido_pedido1_idx` (`pedido_idpedido` ASC, `pedido_formapagamento_idpagamento` ASC) VISIBLE,
  INDEX `fk_produtos_has_pedido_produtos1_idx` (`produtos_id_pedidos` ASC) VISIBLE,
  CONSTRAINT `fk_produtos_has_pedido_produtos1`
    FOREIGN KEY (`produtos_id_pedidos`)
    REFERENCES `bd_cafeteria`.`produtos` (`id_pedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_has_pedido_pedido1`
    FOREIGN KEY (`pedido_idpedido` , `pedido_formapagamento_idpagamento`)
    REFERENCES `bd_cafeteria`.`pedido` (`idpedido` , `formapagamento_idpagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
