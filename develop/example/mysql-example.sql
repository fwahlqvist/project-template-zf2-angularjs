-- MySQL Script generated by MySQL Workbench
-- Thu 11 Sep 2014 18:58:16 CEST
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema myapp
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `myapp` ;
CREATE SCHEMA IF NOT EXISTS `myapp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `myapp` ;

-- -----------------------------------------------------
-- Table `example`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `example` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` TEXT NULL DEFAULT NULL,
  `email` TEXT NULL DEFAULT NULL,
  `note` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `oauth_access_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `access_token` VARCHAR(40) NOT NULL,
  `client_id` VARCHAR(80) NOT NULL,
  `user_id` VARCHAR(255) NULL DEFAULT NULL,
  `expires` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`access_token`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `oauth_authorization_codes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oauth_authorization_codes` (
  `authorization_code` VARCHAR(40) NOT NULL,
  `client_id` VARCHAR(80) NOT NULL,
  `user_id` VARCHAR(255) NULL DEFAULT NULL,
  `redirect_uri` VARCHAR(2000) NULL DEFAULT NULL,
  `expires` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` VARCHAR(2000) NULL DEFAULT NULL,
  `id_token` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`authorization_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `oauth_clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `client_id` VARCHAR(80) NOT NULL,
  `client_secret` VARCHAR(80) NOT NULL,
  `redirect_uri` VARCHAR(2000) NOT NULL,
  `grant_types` VARCHAR(80) NULL DEFAULT NULL,
  `scope` VARCHAR(2000) NULL DEFAULT NULL,
  `user_id` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `oauth_jwt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oauth_jwt` (
  `client_id` VARCHAR(80) NOT NULL,
  `subject` VARCHAR(80) NULL DEFAULT NULL,
  `public_key` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `oauth_refresh_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `refresh_token` VARCHAR(40) NOT NULL,
  `client_id` VARCHAR(80) NOT NULL,
  `user_id` VARCHAR(255) NULL DEFAULT NULL,
  `expires` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`refresh_token`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `oauth_scopes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oauth_scopes` (
  `type` VARCHAR(255) NOT NULL DEFAULT 'supported',
  `scope` VARCHAR(2000) NULL DEFAULT NULL,
  `client_id` VARCHAR(80) NULL DEFAULT NULL,
  `is_default` SMALLINT(6) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `oauth_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oauth_users` (
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(2000) NULL DEFAULT NULL,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `example`
-- -----------------------------------------------------
START TRANSACTION;
USE `myapp`;
INSERT INTO `example` (`id`, `name`, `email`, `note`) VALUES (1, 'Fredrik Wahlqvist', 'fwahlqvist@gmail.com', 'This seems easy!');

COMMIT;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------


CREATE TABLE `user`
(
    `user_id`       INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username`      VARCHAR(255) DEFAULT NULL UNIQUE,
    `email`         VARCHAR(255) DEFAULT NULL UNIQUE,
    `display_name`  VARCHAR(50) DEFAULT NULL,
    `password`      VARCHAR(128) NOT NULL,
    `state`         SMALLINT UNSIGNED
) ENGINE=InnoDB CHARSET="utf8";


-- -----------------------------------------------------
-- Data for table `oauth_clients`
-- -----------------------------------------------------
START TRANSACTION;
USE `myapp`;
INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES ('testclient', '$2y$10$5ICo6mbnWLsptjCZVfMu1e7p04FYpgiZydEG1KD4MI8Q2fcwuCu8e', '/oauth/receivecode', NULL, NULL, NULL);
INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES ('testclient2', '', '/oauth/receivecode', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `oauth_users`
-- -----------------------------------------------------
START TRANSACTION;
USE `myapp`;
INSERT INTO `oauth_users` (`username`, `password`, `first_name`, `last_name`) VALUES ('testuser', '$2y$10$5ICo6mbnWLsptjCZVfMu1e7p04FYpgiZydEG1KD4MI8Q2fcwuCu8e', 'test', 'user');

COMMIT;

-- -----------------------------------------------------
-- Data for table `users`
-- -----------------------------------------------------
START TRANSACTION;
USE `myapp`;
INSERT INTO `user` (`user_id`, `username`, `email`, `display_name`, `password`, `state`) VALUES
(1,	NULL,	'fwahlqvist@gmail.com',	'Fred',	'$2y$14$qaPmykQCuEGo74Us0rY5beohJYCUt6Exv1GoPrnYLAFa0W2/Wv1qW',	NULL);

COMMIT;