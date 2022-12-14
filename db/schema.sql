DROP DATABASE IF EXISTS `employees_db`;
CREATE SCHEMA `employees_db`;

USE `employees_db`;

CREATE TABLE `departments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `roles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(30) NOT NULL,
  `salary` DECIMAL NOT NULL,
  `department_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_roles_1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_roles_1`
    FOREIGN KEY (`department_id`)
    REFERENCES `departments` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

CREATE TABLE `employees` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  `manager_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `employees` 
ADD INDEX `fk_role_id_idx` (`role_id` ASC) VISIBLE,
ADD INDEX `fk_employees_2_idx` (`manager_id` ASC) VISIBLE;
;
ALTER TABLE `employees` 
ADD CONSTRAINT `fk_employees_1`
  FOREIGN KEY (`role_id`)
  REFERENCES `roles` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_employees_2`
  FOREIGN KEY (`manager_id`)
  REFERENCES `employees` (`id`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION;