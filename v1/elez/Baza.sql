SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';



CREATE SCHEMA IF NOT EXISTS `ELEZ` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

USE `ELEZ` ;



-- -----------------------------------------------------

-- Table `ELEZ`.`Licenca`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `ELEZ`.`Licenca` ;



CREATE  TABLE IF NOT EXISTS `ELEZ`.`Licenca` (

  `idLicenca` INT NOT NULL AUTO_INCREMENT ,

  `serijskiBroj` VARCHAR(45) NULL ,

  `trajanje` INT NULL ,

  `vrsta` VARCHAR(45) NOT NULL ,

  `cijena` FLOAT NOT NULL ,

  `status` VARCHAR(45) NOT NULL ,

  `brojNabavljenih` INT NOT NULL ,

  `brojDostupnih` INT NOT NULL ,

  `brojNabavke` INT NOT NULL ,

  `datumNabavke` VARCHAR(45) NOT NULL ,

  PRIMARY KEY (`idLicenca`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `ELEZ`.`Korisnik`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `ELEZ`.`Korisnik` ;



CREATE  TABLE IF NOT EXISTS `ELEZ`.`Korisnik` (

  `idKorisnik` INT NOT NULL AUTO_INCREMENT ,

  `ime` VARCHAR(45) NOT NULL ,

  `prezime` VARCHAR(45) NOT NULL ,

  `brojTelefona` VARCHAR(45) NOT NULL ,

  `email` VARCHAR(45) NOT NULL ,

  `korisnickoIme` VARCHAR(45) NOT NULL ,

  `lozinka` VARCHAR(45) NOT NULL ,

  `privilegije` VARCHAR(45) NOT NULL ,

  `datumKreiranja` VARCHAR(45) NOT NULL ,

  PRIMARY KEY (`idKorisnik`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `ELEZ`.`Filijala`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `ELEZ`.`Filijala` ;



CREATE  TABLE IF NOT EXISTS `ELEZ`.`Filijala` (

  `idFilijala` INT NOT NULL AUTO_INCREMENT ,

  `naziv` VARCHAR(45) NOT NULL ,

  `grad` VARCHAR(45) NOT NULL ,

  `adresa` VARCHAR(45) NOT NULL ,

  `brojTelefona` VARCHAR(45) NOT NULL ,

  `email` VARCHAR(45) NOT NULL ,

  PRIMARY KEY (`idFilijala`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `ELEZ`.`Racunar`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `ELEZ`.`Racunar` ;



CREATE  TABLE IF NOT EXISTS `ELEZ`.`Racunar` (

  `idRacunar` INT NOT NULL AUTO_INCREMENT ,

  `imeHosta` VARCHAR(45) NOT NULL ,

  `operativniSistem` VARCHAR(45) NOT NULL ,

  `Filijala_idFilijala` INT NOT NULL ,

  PRIMARY KEY (`idRacunar`) ,

  INDEX `fk_Racunar_Filijala_idx` (`Filijala_idFilijala` ASC) ,

  CONSTRAINT `fk_Racunar_Filijala`

    FOREIGN KEY (`Filijala_idFilijala` )

    REFERENCES `ELEZ`.`Filijala` (`idFilijala` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `ELEZ`.`Softver`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `ELEZ`.`Softver` ;



CREATE  TABLE IF NOT EXISTS `ELEZ`.`Softver` (

  `idSoftver` INT NOT NULL AUTO_INCREMENT ,

  `datumInstalacije` VARCHAR(45) NOT NULL ,

  `naziv` VARCHAR(45) NOT NULL ,

  `verzija` VARCHAR(45) NOT NULL ,

  `proizvodjac` VARCHAR(45) NOT NULL ,

  `Racunar_idRacunar` INT NOT NULL ,

  PRIMARY KEY (`idSoftver`) ,

  INDEX `fk_Softver_Racunar1_idx` (`Racunar_idRacunar` ASC) ,

  CONSTRAINT `fk_Softver_Racunar1`

    FOREIGN KEY (`Racunar_idRacunar` )

    REFERENCES `ELEZ`.`Racunar` (`idRacunar` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `ELEZ`.`Licenciranje`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `ELEZ`.`Licenciranje` ;



CREATE  TABLE IF NOT EXISTS `ELEZ`.`Licenciranje` (

  `idLicenciranje` INT NOT NULL AUTO_INCREMENT ,

  `datumAktivacije` VARCHAR(45) NOT NULL ,

  `Softver_idSoftver` INT NOT NULL ,

  `Licenca_idLicenca` INT NOT NULL ,

  PRIMARY KEY (`idLicenciranje`) ,

  INDEX `fk_Licenciranje_Softver1_idx` (`Softver_idSoftver` ASC) ,

  INDEX `fk_Licenciranje_Licenca1_idx` (`Licenca_idLicenca` ASC) ,

  CONSTRAINT `fk_Licenciranje_Softver1`

    FOREIGN KEY (`Softver_idSoftver` )

    REFERENCES `ELEZ`.`Softver` (`idSoftver` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

  CONSTRAINT `fk_Licenciranje_Licenca1`

    FOREIGN KEY (`Licenca_idLicenca` )

    REFERENCES `ELEZ`.`Licenca` (`idLicenca` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;



USE `ELEZ` ;





SET SQL_MODE=@OLD_SQL_MODE;

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

