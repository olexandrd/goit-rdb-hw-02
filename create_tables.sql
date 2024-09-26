-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 ;
USE `store` ;

-- -----------------------------------------------------
-- Table `store`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`Client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ClientName` VARCHAR(45) NULL,
  `ClientAddress` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`Order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ClientId` INT NOT NULL,
  `OrderDate` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_Order_Client_idx` (`ClientId` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `FK_Order_Client`
    FOREIGN KEY (`ClientId`)
    REFERENCES `store`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`Product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Ordered_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store`.`Ordered_product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderId` INT NOT NULL,
  `ProductId` INT NULL,
  `ProductCount` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_Product_OrderID_idx` (`OrderId` ASC) VISIBLE,
  INDEX `FK_OrderedProduct_product_idx` (`ProductId` ASC) VISIBLE,
  CONSTRAINT `FK_Product_OrderID`
    FOREIGN KEY (`OrderId`)
    REFERENCES `store`.`Order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderedProduct_product`
    FOREIGN KEY (`ProductId`)
    REFERENCES `store`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
