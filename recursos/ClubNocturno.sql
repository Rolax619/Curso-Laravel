-- MySQL Script generated by MySQL Workbench
-- Thu Nov 28 16:17:44 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema casas_nocturnas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema casas_nocturnas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `casas_nocturnas` DEFAULT CHARACTER SET utf8mb4 ;
USE `casas_nocturnas` ;

-- -----------------------------------------------------
-- Table `casas_nocturnas`.`damas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casas_nocturnas`.`damas` (
  `id_dama` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `nacionalidad` VARCHAR(20) NOT NULL,
  `edad` INT(11) NOT NULL,
  `descripcion` VARCHAR(50) NOT NULL,
  `imagen` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_dama`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `casas_nocturnas`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casas_nocturnas`.`empresa` (
  `id_empresa` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `longitud` DECIMAL(65,0) NOT NULL,
  `latitud` DECIMAL(65,0) NOT NULL,
  `imagen` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_empresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `casas_nocturnas`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casas_nocturnas`.`servicios` (
  `id_servicio` INT(11) NOT NULL AUTO_INCREMENT,
  `id_servempresa` INT(11) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `costo` DECIMAL(65,0) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  INDEX `id_servempresa` (`id_servempresa` ASC) VISIBLE,
  CONSTRAINT `servicios_ibfk_1`
    FOREIGN KEY (`id_servempresa`)
    REFERENCES `casas_nocturnas`.`empresa` (`id_empresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `casas_nocturnas`.`detalle_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casas_nocturnas`.`detalle_servicio` (
  `id_detalleServ` INT(11) NOT NULL AUTO_INCREMENT,
  `id_servicio` INT(11) NOT NULL,
  `id_detalleDama` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `forma_pago` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_detalleServ`),
  INDEX `id_servicio` (`id_servicio` ASC) VISIBLE,
  INDEX `id_detalleDama` (`id_detalleDama` ASC) VISIBLE,
  CONSTRAINT `detalle_servicio_ibfk_1`
    FOREIGN KEY (`id_servicio`)
    REFERENCES `casas_nocturnas`.`servicios` (`id_servicio`),
  CONSTRAINT `detalle_servicio_ibfk_2`
    FOREIGN KEY (`id_detalleDama`)
    REFERENCES `casas_nocturnas`.`damas` (`id_dama`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `casas_nocturnas`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casas_nocturnas`.`personas` (
  `id_persona` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `ci` VARCHAR(20) NOT NULL,
  `edad` INT(11) NOT NULL,
  `telefono` VARCHAR(12) NOT NULL,
  `correo` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(50) NOT NULL,
  `usuario` VARCHAR(20) NULL DEFAULT NULL,
  `constrasena` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `casas_nocturnas`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casas_nocturnas`.`reserva` (
  `id_reserva` INT(11) NOT NULL AUTO_INCREMENT,
  `id_resservicio` INT(11) NOT NULL,
  `id_respersona` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `forma_pago` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_reserva`),
  INDEX `id_resservicio` (`id_resservicio` ASC) VISIBLE,
  INDEX `id_respersona` (`id_respersona` ASC) VISIBLE,
  CONSTRAINT `reserva_ibfk_1`
    FOREIGN KEY (`id_resservicio`)
    REFERENCES `casas_nocturnas`.`servicios` (`id_servicio`),
  CONSTRAINT `reserva_ibfk_2`
    FOREIGN KEY (`id_respersona`)
    REFERENCES `casas_nocturnas`.`personas` (`id_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
