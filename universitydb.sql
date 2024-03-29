-- MySQL Script generated by MySQL Workbench
-- Thu Feb 15 02:18:38 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema universitydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema universitydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `universitydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `universitydb` ;

-- -----------------------------------------------------
-- Table `universitydb`.`disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`disciplinas` (
  `DisciplinaID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Codigo` VARCHAR(20) NULL DEFAULT NULL,
  `Creditos` INT NULL DEFAULT NULL,
  PRIMARY KEY (`DisciplinaID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `universitydb`.`estudantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`estudantes` (
  `EstudanteID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `DataNascimento` DATE NULL DEFAULT NULL,
  `Curso` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`EstudanteID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `universitydb`.`professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`professores` (
  `ProfessorID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Especialidade` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ProfessorID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `universitydb`.`turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`turmas` (
  `TurmaID` INT NOT NULL AUTO_INCREMENT,
  `DisciplinaID` INT NULL DEFAULT NULL,
  `ProfessorID` INT NULL DEFAULT NULL,
  `Ano` INT NULL DEFAULT NULL,
  `Semestre` ENUM('Inverno', 'Verão', 'Outono', 'Primavera') NULL DEFAULT NULL,
  PRIMARY KEY (`TurmaID`),
  INDEX `DisciplinaID` (`DisciplinaID` ASC) VISIBLE,
  INDEX `ProfessorID` (`ProfessorID` ASC) VISIBLE,
  CONSTRAINT `turmas_ibfk_1`
    FOREIGN KEY (`DisciplinaID`)
    REFERENCES `universitydb`.`disciplinas` (`DisciplinaID`),
  CONSTRAINT `turmas_ibfk_2`
    FOREIGN KEY (`ProfessorID`)
    REFERENCES `universitydb`.`professores` (`ProfessorID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `universitydb`.`matriculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitydb`.`matriculas` (
  `MatriculaID` INT NOT NULL AUTO_INCREMENT,
  `EstudanteID` INT NULL DEFAULT NULL,
  `TurmaID` INT NULL DEFAULT NULL,
  `Nota` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`MatriculaID`),
  INDEX `EstudanteID` (`EstudanteID` ASC) VISIBLE,
  INDEX `TurmaID` (`TurmaID` ASC) VISIBLE,
  CONSTRAINT `matriculas_ibfk_1`
    FOREIGN KEY (`EstudanteID`)
    REFERENCES `universitydb`.`estudantes` (`EstudanteID`),
  CONSTRAINT `matriculas_ibfk_2`
    FOREIGN KEY (`TurmaID`)
    REFERENCES `universitydb`.`turmas` (`TurmaID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
