-- MySQL Script generated by MySQL Workbench
-- Sat Jan 30 23:32:32 2021
-- Model: Sakila Full    Version: 2.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema GYM
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `GYM` ;

-- -----------------------------------------------------
-- Schema GYM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GYM` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci ;
USE `GYM` ;

-- -----------------------------------------------------
-- Table `GYM`.`LOGIN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`LOGIN` (
  `DOC_identidad` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Tipo_Usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DOC_identidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GYM`.`ADMINISTRADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`ADMINISTRADOR` (
  `DOC_identidad` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Primer_Apellido` VARCHAR(45) NOT NULL,
  `Segundo_Apellido` VARCHAR(45) NOT NULL,
  `Numero_contacto` INT NOT NULL,
  `LOGIN_DOC_identidad` INT NOT NULL,
  PRIMARY KEY (`DOC_identidad`, `LOGIN_DOC_identidad`),
  CONSTRAINT `fk_ADMINISTRADOR_LOGIN1`
    FOREIGN KEY (`LOGIN_DOC_identidad`)
    REFERENCES `GYM`.`LOGIN` (`DOC_identidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ADMINISTRADOR_LOGIN1_idx` ON `GYM`.`ADMINISTRADOR` (`LOGIN_DOC_identidad` ASC);


-- -----------------------------------------------------
-- Table `GYM`.`CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`CLIENTES` (
  `DOC_identidad` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Primer_Apellido` VARCHAR(45) NOT NULL,
  `Segundo_Apellido` VARCHAR(45) NOT NULL,
  `Numero_contacto` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `LOGIN_DOC_identidad` INT NOT NULL,
  PRIMARY KEY (`DOC_identidad`, `LOGIN_DOC_identidad`),
  CONSTRAINT `fk_CLIENTES_LOGIN1`
    FOREIGN KEY (`LOGIN_DOC_identidad`)
    REFERENCES `GYM`.`LOGIN` (`DOC_identidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CLIENTES_LOGIN1_idx` ON `GYM`.`CLIENTES` (`LOGIN_DOC_identidad` ASC);


-- -----------------------------------------------------
-- Table `GYM`.`ENTRENADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`ENTRENADOR` (
  `DOC_identidad` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Primer_Apellido` VARCHAR(45) NOT NULL,
  `Segundo_Apellido` VARCHAR(45) NOT NULL,
  `Numero_contacto` VARCHAR(45) NOT NULL,
  `LOGIN_DOC_identidad` INT NOT NULL,
  PRIMARY KEY (`DOC_identidad`, `LOGIN_DOC_identidad`),
  CONSTRAINT `fk_ENTRENADOR_LOGIN1`
    FOREIGN KEY (`LOGIN_DOC_identidad`)
    REFERENCES `GYM`.`LOGIN` (`DOC_identidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ENTRENADOR_LOGIN1_idx` ON `GYM`.`ENTRENADOR` (`LOGIN_DOC_identidad` ASC);


-- -----------------------------------------------------
-- Table `GYM`.`CLIENTES_has_ENTRENADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`CLIENTES_has_ENTRENADOR` (
  `CLIENTES_DOC_identidad` INT NOT NULL,
  `ENTRENADOR_DOC_identidad` INT NOT NULL,
  PRIMARY KEY (`CLIENTES_DOC_identidad`, `ENTRENADOR_DOC_identidad`),
  CONSTRAINT `fk_CLIENTES_has_ENTRENADOR_CLIENTES1`
    FOREIGN KEY (`CLIENTES_DOC_identidad`)
    REFERENCES `GYM`.`CLIENTES` (`DOC_identidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTES_has_ENTRENADOR_ENTRENADOR1`
    FOREIGN KEY (`ENTRENADOR_DOC_identidad`)
    REFERENCES `GYM`.`ENTRENADOR` (`DOC_identidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_CLIENTES_has_ENTRENADOR_ENTRENADOR1_idx` ON `GYM`.`CLIENTES_has_ENTRENADOR` (`ENTRENADOR_DOC_identidad` ASC);

CREATE INDEX `fk_CLIENTES_has_ENTRENADOR_CLIENTES1_idx` ON `GYM`.`CLIENTES_has_ENTRENADOR` (`CLIENTES_DOC_identidad` ASC);


-- -----------------------------------------------------
-- Table `GYM`.`RUTINAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`RUTINAS` (
  `COD_Rutina` INT NOT NULL,
  `Nombre_Rutina` VARCHAR(45) NOT NULL,
  `Tipo_Rutina` VARCHAR(45) NOT NULL,
  `CLIENTES_has_ENTRENADOR_CLIENTES_DOC_identidad` INT NOT NULL,
  `CLIENTES_has_ENTRENADOR_ENTRENADOR_DOC_identidad` INT NOT NULL,
  PRIMARY KEY (`COD_Rutina`, `CLIENTES_has_ENTRENADOR_CLIENTES_DOC_identidad`, `CLIENTES_has_ENTRENADOR_ENTRENADOR_DOC_identidad`),
  CONSTRAINT `fk_RUTINAS_CLIENTES_has_ENTRENADOR1`
    FOREIGN KEY (`CLIENTES_has_ENTRENADOR_CLIENTES_DOC_identidad` , `CLIENTES_has_ENTRENADOR_ENTRENADOR_DOC_identidad`)
    REFERENCES `GYM`.`CLIENTES_has_ENTRENADOR` (`CLIENTES_DOC_identidad` , `ENTRENADOR_DOC_identidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_RUTINAS_CLIENTES_has_ENTRENADOR1_idx` ON `GYM`.`RUTINAS` (`CLIENTES_has_ENTRENADOR_CLIENTES_DOC_identidad` ASC, `CLIENTES_has_ENTRENADOR_ENTRENADOR_DOC_identidad` ASC);


-- -----------------------------------------------------
-- Table `GYM`.`PAGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GYM`.`PAGO` (
  `Numero_Factura` INT NOT NULL,
  `Fecha_pago` DATETIME NOT NULL,
  `Valor` VARCHAR(45) NOT NULL,
  `Suscripcion` VARCHAR(45) NOT NULL,
  `ADMINISTRADOR_DOC_identidad` INT NOT NULL,
  `CLIENTES_DOC_identidad` INT NOT NULL,
  PRIMARY KEY (`Numero_Factura`, `ADMINISTRADOR_DOC_identidad`, `CLIENTES_DOC_identidad`),
  CONSTRAINT `fk_PAGO_ADMINISTRADOR`
    FOREIGN KEY (`ADMINISTRADOR_DOC_identidad`)
    REFERENCES `GYM`.`ADMINISTRADOR` (`DOC_identidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PAGO_CLIENTES1`
    FOREIGN KEY (`CLIENTES_DOC_identidad`)
    REFERENCES `GYM`.`CLIENTES` (`DOC_identidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_PAGO_ADMINISTRADOR_idx` ON `GYM`.`PAGO` (`ADMINISTRADOR_DOC_identidad` ASC);

CREATE INDEX `fk_PAGO_CLIENTES1_idx` ON `GYM`.`PAGO` (`CLIENTES_DOC_identidad` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;