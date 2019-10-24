-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SIRC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SIRC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SIRC` DEFAULT CHARACTER SET utf8 ;
USE `SIRC` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIRC`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIRC`.`Administrador` (
  `idAdministrador` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdministrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cancha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIRC`.`Cancha` (
  `idCancha` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCancha`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SIRC`.`Reserva` (
  `idReserva` INT NOT NULL AUTO_INCREMENT,
  `Hora` DATE NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Administrador_idAdministrador` INT NOT NULL,
  `Cancha_idCancha` INT NOT NULL,
  PRIMARY KEY (`idReserva`, `Usuario_idUsuario`, `Administrador_idAdministrador`, `Cancha_idCancha`),
  INDEX `fk_Reserva_Usuario_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Reserva_Administrador1_idx` (`Administrador_idAdministrador` ASC) VISIBLE,
  INDEX `fk_Reserva_Cancha1_idx` (`Cancha_idCancha` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `mydb`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Cancha1`
    FOREIGN KEY (`Cancha_idCancha`)
    REFERENCES `mydb`.`Cancha` (`idCancha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
