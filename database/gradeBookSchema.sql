-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GradeBook
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GradeBook
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GradeBook` ;
USE `GradeBook` ;

-- -----------------------------------------------------
-- Table `GradeBook`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GradeBook`.`Students` (
  `idStudent` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE INDEX `ID_UNIQUE` (`idStudent` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GradeBook`.`Instructors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GradeBook`.`Instructors` (
  `idInstructors` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInstructors`),
  UNIQUE INDEX `idInstructors_UNIQUE` (`idInstructors` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GradeBook`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GradeBook`.`courses` (
  `idcourses` INT NOT NULL AUTO_INCREMENT,
  `courseName` VARCHAR(45) NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcourses`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GradeBook`.`Assignements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GradeBook`.`Assignements` (
  `idAssignements` INT NOT NULL AUTO_INCREMENT,
  `assignment_name` VARCHAR(45) NOT NULL,
  `value` FLOAT NOT NULL,
  `due_date` DATE NOT NULL,
  `idInstructors` INT NOT NULL,
  `idcourses` INT NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAssignements`),
  INDEX `fk_idInstructors_idx` (`idInstructors` ASC) VISIBLE,
  INDEX `fk_idCourses_idx` (`idcourses` ASC) VISIBLE,
  CONSTRAINT `fk_idInstructors`
    FOREIGN KEY (`idInstructors`)
    REFERENCES `GradeBook`.`Instructors` (`idInstructors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idCourses`
    FOREIGN KEY (`idcourses`)
    REFERENCES `GradeBook`.`courses` (`idcourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GradeBook`.`Scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GradeBook`.`Scores` (
  `idStudent` INT NOT NULL,
  `idAssignements` INT NOT NULL,
  `score` FLOAT ZEROFILL NOT NULL,
  PRIMARY KEY (`idStudent`, `idAssignements`),
  INDEX `fk_Students_has_Assignements_Assignements1_idx` (`idAssignements` ASC) VISIBLE,
  INDEX `fk_Students_has_Assignements_Students_idx` (`idStudent` ASC) VISIBLE,
  CONSTRAINT `fk_Students_has_Assignements_Students`
    FOREIGN KEY (`idStudent`)
    REFERENCES `GradeBook`.`Students` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_has_Assignements_Assignements1`
    FOREIGN KEY (`idAssignements`)
    REFERENCES `GradeBook`.`Assignements` (`idAssignements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

