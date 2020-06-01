-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema image_share
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `image_share` ;

-- -----------------------------------------------------
-- Schema image_share
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `image_share` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `image_share` ;

-- -----------------------------------------------------
-- Table `image_share`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image_share`.`users` ;

CREATE TABLE IF NOT EXISTS `image_share`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `age` INT NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `image_share`.`photos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image_share`.`photos` ;

CREATE TABLE IF NOT EXISTS `image_share`.`photos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(255) NOT NULL,
  `user_id` INT NOT NULL,
  `caption` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `photos_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `image_share`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 258
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `image_share`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image_share`.`comments` ;

CREATE TABLE IF NOT EXISTS `image_share`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_text` VARCHAR(255) NOT NULL,
  `photo_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `photo_id` (`photo_id` ASC) VISIBLE,
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `comments_ibfk_1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `image_share`.`photos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `image_share`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7489
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `image_share`.`follows`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image_share`.`follows` ;

CREATE TABLE IF NOT EXISTS `image_share`.`follows` (
  `follower_id` INT NOT NULL,
  `followee_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`follower_id`, `followee_id`),
  INDEX `followee_id` (`followee_id` ASC) VISIBLE,
  CONSTRAINT `follows_ibfk_1`
    FOREIGN KEY (`follower_id`)
    REFERENCES `image_share`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `follows_ibfk_2`
    FOREIGN KEY (`followee_id`)
    REFERENCES `image_share`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `image_share`.`likes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image_share`.`likes` ;

CREATE TABLE IF NOT EXISTS `image_share`.`likes` (
  `user_id` INT NOT NULL,
  `photo_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `photo_id`),
  INDEX `photo_id` (`photo_id` ASC) VISIBLE,
  CONSTRAINT `likes_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `image_share`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_2`
    FOREIGN KEY (`photo_id`)
    REFERENCES `image_share`.`photos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `image_share`.`locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image_share`.`locations` ;

CREATE TABLE IF NOT EXISTS `image_share`.`locations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `location_name` (`location_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `image_share`.`photo_locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image_share`.`photo_locations` ;

CREATE TABLE IF NOT EXISTS `image_share`.`photo_locations` (
  `photo_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`photo_id`),
  INDEX `location_id` (`location_id` ASC) VISIBLE,
  CONSTRAINT `photo_locations_ibfk_1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `image_share`.`photos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `photo_locations_ibfk_2`
    FOREIGN KEY (`location_id`)
    REFERENCES `image_share`.`locations` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `image_share`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image_share`.`tags` ;

CREATE TABLE IF NOT EXISTS `image_share`.`tags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `tag_name` (`tag_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `image_share`.`photo_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image_share`.`photo_tags` ;

CREATE TABLE IF NOT EXISTS `image_share`.`photo_tags` (
  `photo_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`photo_id`, `tag_id`),
  INDEX `tag_id` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `photo_tags_ibfk_1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `image_share`.`photos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `photo_tags_ibfk_2`
    FOREIGN KEY (`tag_id`)
    REFERENCES `image_share`.`tags` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `image_share`.`unfollows`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image_share`.`unfollows` ;

CREATE TABLE IF NOT EXISTS `image_share`.`unfollows` (
  `unfollower_id` INT NOT NULL,
  `unfollowee_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`unfollower_id`, `unfollowee_id`),
  INDEX `unfollowee_id` (`unfollowee_id` ASC) VISIBLE,
  CONSTRAINT `unfollows_ibfk_1`
    FOREIGN KEY (`unfollower_id`)
    REFERENCES `image_share`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `unfollows_ibfk_2`
    FOREIGN KEY (`unfollowee_id`)
    REFERENCES `image_share`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
USE `image_share`;

DELIMITER $$

USE `image_share`$$
DROP TRIGGER IF EXISTS `image_share`.`capture_unfollow` $$
USE `image_share`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `image_share`.`capture_unfollow`
AFTER DELETE ON `image_share`.`follows`
FOR EACH ROW
BEGIN
			INSERT INTO unfollows(unfollower_id, unfollowee_id)
            VALUES (OLD.follower_id,OLD.followee_id);
    END$$


USE `image_share`$$
DROP TRIGGER IF EXISTS `image_share`.`prevent_self_follows` $$
USE `image_share`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `image_share`.`prevent_self_follows`
BEFORE INSERT ON `image_share`.`follows`
FOR EACH ROW
BEGIN
			IF NEW.follower_id = NEW.followee_id
            THEN
				SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'You cannot follow yourself.';
			END IF;
    END$$


DELIMITER ;
