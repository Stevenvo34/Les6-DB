-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercise4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercise4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercise4` ;
USE `Exercise4` ;

-- -----------------------------------------------------
-- Table `Exercise4`.`appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`appointment` (
  `date` DATE NULL,
  `time` VARCHAR(45) NULL,
  `idappointment` INT NOT NULL,
  PRIMARY KEY (`idappointment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Doctor` (
  `Doctor_id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  ` Date_of_birth` DATE NULL,
  `addres` VARCHAR(45) NULL,
  `phone id` INT NULL,
  `salary` INT NULL,
  `appointment_idappointment` INT NOT NULL,
  PRIMARY KEY (`Doctor_id`, `appointment_idappointment`),
  CONSTRAINT `fk_Doctor_appointment1`
    FOREIGN KEY (`Doctor_id` , `appointment_idappointment`)
    REFERENCES `Exercise4`.`appointment` (`idappointment` , `idappointment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Medical` (
  `idMedical` INT NOT NULL,
  `Medicalcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedical`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Specialist` (
  `idSpecialist` INT NOT NULL,
  `Field_area` VARCHAR(45) NULL,
  PRIMARY KEY (`idSpecialist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Patient` (
  `idPatient` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_numer` INT NULL,
  `Date_of_birth` DATE NULL,
  `appointment_idappointment` INT NOT NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `fk_Patient_appointment1_idx` (`appointment_idappointment` ASC, `idPatient` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_appointment1`
    FOREIGN KEY (`appointment_idappointment` , `idPatient`)
    REFERENCES `Exercise4`.`appointment` (`idappointment` , `idappointment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Doctor_has_Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Doctor_has_Specialist` (
  `Doctor_Doctor_id` INT NOT NULL,
  `Specialist_idSpecialist` INT NOT NULL,
  PRIMARY KEY (`Doctor_Doctor_id`, `Specialist_idSpecialist`),
  INDEX `fk_Doctor_has_Specialist_Specialist1_idx` (`Specialist_idSpecialist` ASC) VISIBLE,
  INDEX `fk_Doctor_has_Specialist_Doctor1_idx` (`Doctor_Doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Doctor_has_Specialist_Doctor1`
    FOREIGN KEY (`Doctor_Doctor_id`)
    REFERENCES `Exercise4`.`Doctor` (`Doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_has_Specialist_Specialist1`
    FOREIGN KEY (`Specialist_idSpecialist`)
    REFERENCES `Exercise4`.`Specialist` (`idSpecialist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercise4`.`Patient_has_Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercise4`.`Patient_has_Specialist` (
  `Patient_idPatient` INT NOT NULL,
  `Specialist_idSpecialist` INT NOT NULL,
  PRIMARY KEY (`Patient_idPatient`, `Specialist_idSpecialist`),
  INDEX `fk_Patient_has_Specialist_Specialist1_idx` (`Specialist_idSpecialist` ASC) VISIBLE,
  INDEX `fk_Patient_has_Specialist_Patient1_idx` (`Patient_idPatient` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_has_Specialist_Patient1`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `Exercise4`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_has_Specialist_Specialist1`
    FOREIGN KEY (`Specialist_idSpecialist`)
    REFERENCES `Exercise4`.`Specialist` (`idSpecialist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
