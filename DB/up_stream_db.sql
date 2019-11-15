-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Up_Stream
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Up_Stream` ;

-- -----------------------------------------------------
-- Schema Up_Stream
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Up_Stream` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema sdvid
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sdvid` ;

-- -----------------------------------------------------
-- Schema sdvid
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sdvid` DEFAULT CHARACTER SET latin1 ;
USE `Up_Stream` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL DEFAULT 1,
  `last_name` VARCHAR(45) NOT NULL,
  `admin` TINYINT NULL DEFAULT 0,
  `active` TINYINT NULL DEFAULT 1,
  `image_id` INT NULL,
  `content_id` INT NULL,
  `serv_total` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `service` ;

CREATE TABLE IF NOT EXISTS `service` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `monthly_price` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media` ;

CREATE TABLE IF NOT EXISTS `media` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content` ;

CREATE TABLE IF NOT EXISTS `content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  `service_id` INT NOT NULL,
  `image_id` INT NULL,
  `video_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `service_id_idx` (`service_id` ASC),
  INDEX `pk_image_idx` (`image_id` ASC),
  INDEX `kc_content_video_idx` (`video_id` ASC),
  CONSTRAINT `fk_content_service`
    FOREIGN KEY (`service_id`)
    REFERENCES `service` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_content_image`
    FOREIGN KEY (`image_id`)
    REFERENCES `media` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `kc_content_video`
    FOREIGN KEY (`video_id`)
    REFERENCES `media` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating_review` ;

CREATE TABLE IF NOT EXISTS `rating_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `content_id` INT NOT NULL,
  `comment` TEXT NULL,
  `rating` INT(5) NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `content_id_idx` (`content_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `content_id`
    FOREIGN KEY (`content_id`)
    REFERENCES `content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_service` ;

CREATE TABLE IF NOT EXISTS `user_service` (
  `service_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `subscribe_date` DATE NULL,
  `current_subscrib` TINYINT NULL DEFAULT 1,
  INDEX `service_id_idx` (`service_id` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  PRIMARY KEY (`service_id`, `user_id`),
  CONSTRAINT `fk_user_service_service`
    FOREIGN KEY (`service_id`)
    REFERENCES `service` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_service_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_content` ;

CREATE TABLE IF NOT EXISTS `user_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content_id` INT NULL,
  `user_id` INT NULL,
  `favorites` TINYINT NULL DEFAULT 0,
  INDEX `fk_user_content_content_idx` (`content_id` ASC),
  INDEX `fk_user_content_user_idx` (`user_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_content_content`
    FOREIGN KEY (`content_id`)
    REFERENCES `content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_content_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content_genre` ;

CREATE TABLE IF NOT EXISTS `content_genre` (
  `content_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`content_id`, `genre_id`),
  INDEX `fk_content_genre_genre_idx` (`genre_id` ASC),
  CONSTRAINT `fk_content_genre_content`
    FOREIGN KEY (`content_id`)
    REFERENCES `content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_content_genre_genre`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `sdvid` ;

-- -----------------------------------------------------
-- Table `actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `actor` ;

CREATE TABLE IF NOT EXISTS `actor` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_actor_last_name` (`last_name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 202
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `country` ;

CREATE TABLE IF NOT EXISTS `country` (
  `country_code` CHAR(2) NOT NULL,
  `country` VARCHAR(50) NOT NULL,
  `formal_name` VARCHAR(60) NULL DEFAULT NULL,
  `sovereignty` VARCHAR(30) NULL DEFAULT NULL,
  `capital` VARCHAR(80) NULL DEFAULT NULL,
  `iso3_code` CHAR(3) NULL DEFAULT NULL,
  `tld` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`country_code`),
  UNIQUE INDEX `country_code` (`country_code` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL,
  `address2` VARCHAR(50) NULL DEFAULT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state_province` VARCHAR(20) NOT NULL,
  `postal_code` VARCHAR(10) NULL DEFAULT NULL,
  `country_code` CHAR(2) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_country` (`country_code` ASC),
  CONSTRAINT `fk_address_country`
    FOREIGN KEY (`country_code`)
    REFERENCES `country` (`country_code`))
ENGINE = InnoDB
AUTO_INCREMENT = 732
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `staff` ;

CREATE TABLE IF NOT EXISTS `staff` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address_id` INT(10) UNSIGNED NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `store_id` SMALLINT(5) UNSIGNED NOT NULL,
  `supervisor_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `username` VARCHAR(16) NULL DEFAULT NULL,
  `password` VARCHAR(41) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC),
  INDEX `idx_fk_store_id` (`store_id` ASC),
  INDEX `idx_fk_address_id` (`address_id` ASC),
  INDEX `fk_staff_supervisor` (`supervisor_id` ASC),
  CONSTRAINT `fk_staff_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_store`
    FOREIGN KEY (`store_id`)
    REFERENCES `store` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_supervisor`
    FOREIGN KEY (`supervisor_id`)
    REFERENCES `staff` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 123
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store` ;

CREATE TABLE IF NOT EXISTS `store` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `manager_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `address_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `address_id` (`address_id` ASC),
  UNIQUE INDEX `idx_unique_manager` (`manager_id` ASC),
  INDEX `idx_fk_address_id` (`address_id` ASC),
  CONSTRAINT `fk_store_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_store_staff`
    FOREIGN KEY (`manager_id`)
    REFERENCES `staff` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_id` SMALLINT(5) UNSIGNED NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `address_id` INT(10) UNSIGNED NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `create_date` DATETIME NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `idx_fk_store_id` (`store_id` ASC),
  INDEX `idx_fk_address_id` (`address_id` ASC),
  INDEX `idx_last_name` (`last_name` ASC),
  CONSTRAINT `fk_customer_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_store`
    FOREIGN KEY (`store_id`)
    REFERENCES `store` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 601
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `language` ;

CREATE TABLE IF NOT EXISTS `language` (
  `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` CHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film` ;

CREATE TABLE IF NOT EXISTS `film` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` YEAR(4) NULL DEFAULT NULL,
  `language_id` SMALLINT(5) UNSIGNED NOT NULL,
  `rental_duration` TINYINT(3) UNSIGNED NOT NULL DEFAULT '3',
  `rental_rate` DECIMAL(4,2) NOT NULL DEFAULT '4.99',
  `length` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `replacement_cost` DECIMAL(5,2) NOT NULL DEFAULT '19.99',
  `rating` ENUM('G', 'PG', 'PG13', 'R', 'NC17') NULL DEFAULT 'G',
  `special_features` SET('Trailers', 'Commentaries', 'Deleted Scenes', 'Behind the Scenes') NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_title` (`title` ASC),
  INDEX `idx_fk_language_id` (`language_id` ASC),
  CONSTRAINT `fk_film_language`
    FOREIGN KEY (`language_id`)
    REFERENCES `language` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `film_actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film_actor` ;

CREATE TABLE IF NOT EXISTS `film_actor` (
  `actor_id` INT(10) UNSIGNED NOT NULL,
  `film_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`actor_id`, `film_id`),
  INDEX `idx_fk_film_id` (`film_id` ASC),
  CONSTRAINT `fk_film_actor_actor`
    FOREIGN KEY (`actor_id`)
    REFERENCES `actor` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_film_actor_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `film` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `film_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film_category` ;

CREATE TABLE IF NOT EXISTS `film_category` (
  `film_id` INT(10) UNSIGNED NOT NULL,
  `category_id` SMALLINT(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`film_id`, `category_id`),
  INDEX `fk_film_category_category` (`category_id` ASC),
  CONSTRAINT `fk_film_category_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_film_category_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `film` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventory_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory_item` ;

CREATE TABLE IF NOT EXISTS `inventory_item` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `film_id` INT(10) UNSIGNED NOT NULL,
  `store_id` SMALLINT(5) UNSIGNED NOT NULL,
  `media_condition` ENUM('New', 'Used', 'Damaged', 'Lost', 'NA') NULL DEFAULT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `idx_fk_film_id` (`film_id` ASC),
  INDEX `idx_store_id_film_id` (`store_id` ASC, `film_id` ASC),
  CONSTRAINT `fk_inventory_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `film` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_inventory_store`
    FOREIGN KEY (`store_id`)
    REFERENCES `store` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 20710
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rental` ;

CREATE TABLE IF NOT EXISTS `rental` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `rental_date` DATETIME NOT NULL,
  `inventory_id` INT(10) UNSIGNED NOT NULL,
  `customer_id` INT(10) UNSIGNED NOT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  `staff_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rental_date` (`rental_date` ASC, `inventory_id` ASC, `customer_id` ASC),
  INDEX `idx_fk_inventory_id` (`inventory_id` ASC),
  INDEX `idx_fk_customer_id` (`customer_id` ASC),
  INDEX `idx_fk_staff_id` (`staff_id` ASC),
  CONSTRAINT `fk_rental_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_inventory`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory_item` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_staff`
    FOREIGN KEY (`staff_id`)
    REFERENCES `staff` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 56278
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payment` ;

CREATE TABLE IF NOT EXISTS `payment` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rental_id` INT(11) NULL DEFAULT NULL,
  `amount` DECIMAL(5,2) NOT NULL,
  `payment_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payment_rental` (`rental_id` ASC),
  CONSTRAINT `fk_payment_rental`
    FOREIGN KEY (`rental_id`)
    REFERENCES `rental` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 56277
DEFAULT CHARACTER SET = utf8;

USE `sdvid` ;

-- -----------------------------------------------------
-- Placeholder table for view `actor_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `actor_info` (`actor_id` INT, `first_name` INT, `last_name` INT, `film_info` INT);

-- -----------------------------------------------------
-- Placeholder table for view `customer_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer_list` (`ID` INT, `name` INT, `address` INT, `zip code` INT, `phone` INT, `city` INT, `country` INT, `notes` INT, `SID` INT);

-- -----------------------------------------------------
-- Placeholder table for view `film_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `film_list` (`FID` INT, `title` INT, `description` INT, `category` INT, `price` INT, `length` INT, `rating` INT, `actors` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sales_by_film_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sales_by_film_category` (`category` INT, `total_sales` INT);

-- -----------------------------------------------------
-- Placeholder table for view `sales_by_store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sales_by_store` (`store` INT, `manager` INT, `total_sales` INT);

-- -----------------------------------------------------
-- Placeholder table for view `staff_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `staff_list` (`ID` INT, `name` INT, `address` INT, `zip code` INT, `phone` INT, `city` INT, `country` INT, `SID` INT);

-- -----------------------------------------------------
-- Placeholder table for view `store_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `store_list` (`store_id` INT, `manager_id` INT, `address` INT, `city` INT, `state` INT, `postal_code` INT);

-- -----------------------------------------------------
-- procedure film_in_stock
-- -----------------------------------------------------

USE `sdvid`;
DROP procedure IF EXISTS `film_in_stock`;

DELIMITER $$
USE `sdvid`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `film_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
    READS SQL DATA
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND inventory_in_stock(inventory_id);

     SELECT FOUND_ROWS() INTO p_film_count;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure film_not_in_stock
-- -----------------------------------------------------

USE `sdvid`;
DROP procedure IF EXISTS `film_not_in_stock`;

DELIMITER $$
USE `sdvid`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `film_not_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
    READS SQL DATA
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND NOT inventory_in_stock(inventory_id);

     SELECT FOUND_ROWS() INTO p_film_count;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function get_customer_balance
-- -----------------------------------------------------

USE `sdvid`;
DROP function IF EXISTS `get_customer_balance`;

DELIMITER $$
USE `sdvid`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_customer_balance`(p_customer_id INT, p_effective_date DATETIME) RETURNS decimal(5,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN

       
       
       
       
       
       

  DECLARE v_rentfees DECIMAL(5,2); 
  DECLARE v_overfees INTEGER;      
  DECLARE v_payments DECIMAL(5,2); 

  SELECT IFNULL(SUM(film.rental_rate),0) INTO v_rentfees
    FROM film, inventory, rental
    WHERE film.film_id = inventory.film_id
      AND inventory.inventory_id = rental.inventory_id
      AND rental.rental_date <= p_effective_date
      AND rental.customer_id = p_customer_id;

  SELECT IFNULL(SUM(IF((TO_DAYS(rental.return_date) - TO_DAYS(rental.rental_date)) > film.rental_duration,
        ((TO_DAYS(rental.return_date) - TO_DAYS(rental.rental_date)) - film.rental_duration),0)),0) INTO v_overfees
    FROM rental, inventory, film
    WHERE film.film_id = inventory.film_id
      AND inventory.inventory_id = rental.inventory_id
      AND rental.rental_date <= p_effective_date
      AND rental.customer_id = p_customer_id;


  SELECT IFNULL(SUM(payment.amount),0) INTO v_payments
    FROM payment

    WHERE payment.payment_date <= p_effective_date
    AND payment.customer_id = p_customer_id;

  RETURN v_rentfees + v_overfees - v_payments;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function inventory_held_by_customer
-- -----------------------------------------------------

USE `sdvid`;
DROP function IF EXISTS `inventory_held_by_customer`;

DELIMITER $$
USE `sdvid`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `inventory_held_by_customer`(p_inventory_id INT) RETURNS int(11)
    READS SQL DATA
BEGIN
  DECLARE v_customer_id INT;
  DECLARE EXIT HANDLER FOR NOT FOUND RETURN NULL;

  SELECT customer_id INTO v_customer_id
  FROM rental
  WHERE return_date IS NULL
  AND inventory_id = p_inventory_id;

  RETURN v_customer_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function inventory_in_stock
-- -----------------------------------------------------

USE `sdvid`;
DROP function IF EXISTS `inventory_in_stock`;

DELIMITER $$
USE `sdvid`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `inventory_in_stock`(p_inventory_id INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
    DECLARE v_rentals INT;
    DECLARE v_out     INT;

    
    

    SELECT COUNT(*) INTO v_rentals
    FROM rental
    WHERE inventory_id = p_inventory_id;

    IF v_rentals = 0 THEN
      RETURN TRUE;
    END IF;

    SELECT COUNT(rental_id) INTO v_out
    FROM inventory LEFT JOIN rental USING(inventory_id)
    WHERE inventory.inventory_id = p_inventory_id
    AND rental.return_date IS NULL;

    IF v_out > 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure rewards_report
-- -----------------------------------------------------

USE `sdvid`;
DROP procedure IF EXISTS `rewards_report`;

DELIMITER $$
USE `sdvid`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `rewards_report`(
    IN min_monthly_purchases TINYINT UNSIGNED
    , IN min_dollar_amount_purchased DECIMAL(10,2) UNSIGNED
    , OUT count_rewardees INT
)
    READS SQL DATA
    COMMENT 'Provides a customizable report on best customers'
proc: BEGIN

    DECLARE last_month_start DATE;
    DECLARE last_month_end DATE;

    
    IF min_monthly_purchases = 0 THEN
        SELECT 'Minimum monthly purchases parameter must be > 0';
        LEAVE proc;
    END IF;
    IF min_dollar_amount_purchased = 0.00 THEN
        SELECT 'Minimum monthly dollar amount purchased parameter must be > $0.00';
        LEAVE proc;
    END IF;

    
    SET last_month_start = DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);
    SET last_month_start = STR_TO_DATE(CONCAT(YEAR(last_month_start),'-',MONTH(last_month_start),'-01'),'%Y-%m-%d');
    SET last_month_end = LAST_DAY(last_month_start);

    
    CREATE TEMPORARY TABLE tmpCustomer (customer_id SMALLINT UNSIGNED NOT NULL PRIMARY KEY);

    
    INSERT INTO tmpCustomer (customer_id)
    SELECT p.customer_id
    FROM payment AS p
    WHERE DATE(p.payment_date) BETWEEN last_month_start AND last_month_end
    GROUP BY customer_id
    HAVING SUM(p.amount) > min_dollar_amount_purchased
    AND COUNT(customer_id) > min_monthly_purchases;

    
    SELECT COUNT(*) FROM tmpCustomer INTO count_rewardees;

    
    SELECT c.*
    FROM tmpCustomer AS t
    INNER JOIN customer AS c ON t.customer_id = c.customer_id;

    
    DROP TABLE tmpCustomer;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `actor_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `actor_info`;
DROP VIEW IF EXISTS `actor_info` ;
USE `sdvid`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `actor_info` AS select `a`.`id` AS `actor_id`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,group_concat(distinct concat(`c`.`name`,': ',(select group_concat(`f`.`title` order by `f`.`title` ASC separator ', ') from ((`film` `f` join `film_category` `fc` on((`f`.`id` = `fc`.`film_id`))) join `film_actor` `fa` on((`f`.`id` = `fa`.`film_id`))) where ((`fc`.`category_id` = `c`.`id`) and (`fa`.`actor_id` = `a`.`id`)))) order by `c`.`name` ASC separator '; ') AS `film_info` from (((`actor` `a` left join `film_actor` `fa` on((`a`.`id` = `fa`.`actor_id`))) left join `film_category` `fc` on((`fa`.`film_id` = `fc`.`film_id`))) left join `category` `c` on((`fc`.`category_id` = `c`.`id`))) group by `a`.`id`,`a`.`first_name`,`a`.`last_name`;

-- -----------------------------------------------------
-- View `customer_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer_list`;
DROP VIEW IF EXISTS `customer_list` ;
USE `sdvid`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_list` AS select `cu`.`id` AS `ID`,concat(`cu`.`first_name`,_utf8' ',`cu`.`last_name`) AS `name`,`a`.`address` AS `address`,`a`.`postal_code` AS `zip code`,`a`.`phone` AS `phone`,`a`.`city` AS `city`,`a`.`country_code` AS `country`,if(`cu`.`active`,_utf8'active',_utf8'') AS `notes`,`cu`.`store_id` AS `SID` from (`customer` `cu` join `address` `a` on((`cu`.`address_id` = `a`.`id`)));

-- -----------------------------------------------------
-- View `film_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film_list`;
DROP VIEW IF EXISTS `film_list` ;
USE `sdvid`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `film_list` AS select `film`.`id` AS `FID`,`film`.`title` AS `title`,`film`.`description` AS `description`,`category`.`name` AS `category`,`film`.`rental_rate` AS `price`,`film`.`length` AS `length`,`film`.`rating` AS `rating`,group_concat(concat(`actor`.`first_name`,_utf8' ',`actor`.`last_name`) separator ', ') AS `actors` from ((((`category` left join `film_category` on((`category`.`id` = `film_category`.`category_id`))) left join `film` on((`film_category`.`film_id` = `film`.`id`))) join `film_actor` on((`film`.`id` = `film_actor`.`film_id`))) join `actor` on((`film_actor`.`actor_id` = `actor`.`id`))) group by `film`.`id`,`category`.`name`;

-- -----------------------------------------------------
-- View `sales_by_film_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sales_by_film_category`;
DROP VIEW IF EXISTS `sales_by_film_category` ;
USE `sdvid`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_by_film_category` AS select `c`.`name` AS `category`,sum(`p`.`amount`) AS `total_sales` from (((((`payment` `p` join `rental` `r` on((`p`.`rental_id` = `r`.`id`))) join `inventory_item` `i` on((`r`.`inventory_id` = `i`.`id`))) join `film` `f` on((`i`.`film_id` = `f`.`id`))) join `film_category` `fc` on((`f`.`id` = `fc`.`film_id`))) join `category` `c` on((`fc`.`category_id` = `c`.`id`))) group by `c`.`name` order by sum(`p`.`amount`) desc;

-- -----------------------------------------------------
-- View `sales_by_store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sales_by_store`;
DROP VIEW IF EXISTS `sales_by_store` ;
USE `sdvid`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_by_store` AS select concat(`a`.`city`,_utf8',',`a`.`country_code`) AS `store`,concat(`m`.`first_name`,_utf8' ',`m`.`last_name`) AS `manager`,sum(`p`.`amount`) AS `total_sales` from (((((`payment` `p` join `rental` `r` on((`p`.`rental_id` = `r`.`id`))) join `inventory_item` `i` on((`r`.`inventory_id` = `i`.`id`))) join `store` `s` on((`i`.`store_id` = `s`.`id`))) join `address` `a` on((`s`.`address_id` = `a`.`id`))) join `staff` `m` on((`s`.`manager_id` = `m`.`id`))) group by `s`.`id` order by `a`.`country_code`,`a`.`city`;

-- -----------------------------------------------------
-- View `staff_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `staff_list`;
DROP VIEW IF EXISTS `staff_list` ;
USE `sdvid`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `staff_list` AS select `s`.`id` AS `ID`,concat(`s`.`first_name`,_utf8' ',`s`.`last_name`) AS `name`,`a`.`address` AS `address`,`a`.`postal_code` AS `zip code`,`a`.`phone` AS `phone`,`a`.`city` AS `city`,`a`.`country_code` AS `country`,`s`.`store_id` AS `SID` from (`staff` `s` join `address` `a` on((`s`.`address_id` = `a`.`id`)));

-- -----------------------------------------------------
-- View `store_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store_list`;
DROP VIEW IF EXISTS `store_list` ;
USE `sdvid`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `store_list` AS select `store`.`id` AS `store_id`,`store`.`manager_id` AS `manager_id`,`address`.`address` AS `address`,`address`.`city` AS `city`,`address`.`state_province` AS `state`,`address`.`postal_code` AS `postal_code` from (`store` join `address` on((`store`.`address_id` = `address`.`id`)));
SET SQL_MODE = '';
DROP USER IF EXISTS streamer@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'streamer'@'localhost' IDENTIFIED BY 'Streamer13';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'streamer'@'localhost';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'streamer'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `admin`, `active`, `image_id`, `content_id`, `serv_total`) VALUES (1, 'adminSam', 'Streaming', 'Samantha', 'Haviland', 1, 1, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `admin`, `active`, `image_id`, `content_id`, `serv_total`) VALUES (2, 'ThaLobster', 'boring', 'Andrew', 'Wong', 0, 1, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `admin`, `active`, `image_id`, `content_id`, `serv_total`) VALUES (3, 'CMoreno', 'boringtoo', 'Cesar', 'Moreno', 0, 1, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `admin`, `active`, `image_id`, `content_id`, `serv_total`) VALUES (4, 'bobbobert', 'notboring', 'Zak', 'Saylors', 0, 1, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `service`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `service` (`id`, `name`, `monthly_price`) VALUES (1, 'Netflix', 8.99);
INSERT INTO `service` (`id`, `name`, `monthly_price`) VALUES (2, 'HBO', 14.99);
INSERT INTO `service` (`id`, `name`, `monthly_price`) VALUES (3, 'Disney Plus', 6.99);

COMMIT;


-- -----------------------------------------------------
-- Data for table `media`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `media` (`id`, `url`) VALUES (1, 'https://upload.wikimedia.org/wikipedia/commons/3/38/Stranger_Things_logo.png');
INSERT INTO `media` (`id`, `url`) VALUES (2, 'https://youtu.be/Bb4uR9gTVXI');

COMMIT;


-- -----------------------------------------------------
-- Data for table `content`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (1, 'Stranger Things', 'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.', 1, 1, 2);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (2, 'Breaking Bad', 'Walter White, a meek high school science teacher who transforms into a ruthless player in the local methamphetamine drug trade, driven by a desire to provide for his family after being diagnosed with terminal lung cancer.', 1, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (3, 'The Thrilling Adventures of Sabrina', 'Sabrina Spellman must reconcile her dual nature as a half-witch, half-mortal while fighting the evil forces that threaten her, her family and the daylight world humans inhabit.', 1, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (4, 'To Wong Foo, Thanks for everything! Julie Newmar', 'Noxeema Jackson, Vida Boheme, and Chi Chi Rodriguez are gonna show America a thing or two about being fabulous. Dressed to kill, with their Dynel tresses tossing in the breeze behind them, these three stars of New York\'s drag-queen beauty pageant circuit have hit the open road in a 1967 Cadillac convertible. Destination: Hollywood. But the trio is in for a detour when the car breaks down in the tiny midwestern town of Snydersville, where drag queens are about as common as August snowstorms. Up to now Snydersville has been a lot more like a graveyard than a town. That\'s all about to change. The local citizenry is going to get an infusion of flash and glamour the likes of which it\'s never seen. During the course of one incredible weekend, eyes will be opened, broken hearts healed, and hair teased within an inch of its life.', 1, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (5, 'Bright', 'In an alternate present day, humans, orcs, elves and fairies have been coexisting since the beginning of time. Two police officers, one a human, the other an orc, embark on a routine night patrol that will alter the future of their world as they know it. Battling both their own personal differences as well as an onslaught of enemies, they must work together to protect a young female elf and a thought-to-be-forgotten relic, which, in the wrong hands, could destroy everything.', 1, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (6, 'In the Tall Gradd', 'A brother and sister enter a field of tall grass to rescue a boy, but they soon realize they cannot escape and something evil lurks in the grass.', 1, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (7, 'Game of Thrones', 'The series chronicles the violent dynastic struggles among the realm\'s noble families for the Iron Throne, while other families fight for independence from it.', 2, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (8, 'Silicon Valley', 'This comedy series follows the misadventures of introverted computer programmer Richard and his brainy friends as they attempt to strike it rich in a high-tech gold rush. ', 2, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (9, 'Watchmen', 'The series focuses on events surrounding racial tensions in Tulsa, Oklahoma, in 2019. The white supremacist group the Seventh Kavalry has turned on the police over racial justice. The police conceal their identities with masks and allow masked vigilantes to join their ranks.', 2, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (10, 'Happy Death Day', 'A pulse-pounding slasher film meets \"Groundhog Day\" in this hit frightfest about a young woman who finds herself reliving the day of her murder--for better and for bloody worse. As each day repeats, all of the mundane details play out to the point of her death while she tries to figure out the identity of her killer and put an end to the nightmare.', 2, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (11, 'Glass', 'Heroes and villains collide in this explosive third installment in M. Night Shyamalan’s superhero trilogy (following “Unbreakable” and “Split”). When fate brings “unbreakable” David Dunn (Bruce Willis) and Kevin Wendell Crumb a.k.a. “The Horde” (James McAvoy) into the same mental hospital as the devious Mr. Glass (Samuel L. Jackson), it’s a confrontation 20 years in the making.', 2, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (12, 'Crazy Rich Asians', 'This smash-hit romantic comedy, based on the international best-seller, is \"simply great fun\" (TIME). Constance Wu stars as a New Yorker who accompanies her boyfriend to Singapore to meet his family for the first time, only to discover that he\'s the scion of one of the country\'s wealthiest families, with a disapproving mother and a slew of socialites trying to steal him away.', 2, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (13, 'The Mandalorian', 'After the fall of the Empire, a long gunman makes his way through the lawless galaxy', 3, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (14, 'Ducktales', 'The comedy-adventure series chronicles the high-flying adventures of trillionaire Scrooge McDuck, his grandnephews - Huey, Dewey, and Louie - and temperamental nephew Donald Duck, Launchpad McQuack, Mrs. Beakley, and her granddaughter Webby.', 3, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (15, 'The World According to Jeff Goldblum', 'The series follows Jeff, in which he explores the world, for example tattoos, ice-creams and sneakers and how they are developed.', 3, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (16, 'Halloween Town', 'Marnie and her kids get a big shock when they follow grandma home to Halloweentown - and find out they come from a family of witches. The town is the only place where supernatural beings can lead a `normal\' life, but trouble is looming, and on her 13th birthday Marnie not only finds she is a witch, but that she and her family are involved in a fight against the evil that is threatening to take over the world.', 3, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (17, 'Tron', 'When talented computer engineer Kevin Flynn (Jeff Bridges) finds out that Ed Dillinger (David Warner), an executive at his company, has been stealing his work, he tries to hack into the system. However, Flynn is transported into the digital world, where he has to face off against Dillinger\'s computerized likeness, Sark, and the imposing Master Control Program. Aided by Tron (Bruce Boxleitner) and Yori (Cindy Morgan), Flynn becomes a freedom fighter for the oppressed programs of the grid.', 3, NULL, NULL);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (18, 'Captain Marvel', 'Captain Marvel is an extraterrestrial Kree warrior who finds herself caught in the middle of an intergalactic battle between her people and the Skrulls. Living on Earth in 1995, she keeps having recurring memories of another life as U.S. Air Force pilot Carol Danvers. With help from Nick Fury, Captain Marvel tries to uncover the secrets of her past while harnessing her special superpowers to end the war with the evil Skrulls.', 3, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `genre` (`id`, `name`) VALUES (1, 'Comedy');
INSERT INTO `genre` (`id`, `name`) VALUES (2, 'Horror');
INSERT INTO `genre` (`id`, `name`) VALUES (3, 'Thriller');
INSERT INTO `genre` (`id`, `name`) VALUES (4, 'Romance');
INSERT INTO `genre` (`id`, `name`) VALUES (5, 'Science Fiction');
INSERT INTO `genre` (`id`, `name`) VALUES (6, 'Fantasy');
INSERT INTO `genre` (`id`, `name`) VALUES (7, 'Drama');
INSERT INTO `genre` (`id`, `name`) VALUES (8, 'Crime');
INSERT INTO `genre` (`id`, `name`) VALUES (9, 'Documentary');
INSERT INTO `genre` (`id`, `name`) VALUES (10, 'Mocumentary');
INSERT INTO `genre` (`id`, `name`) VALUES (11, 'Period');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rating_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (1, 4, 13, 'Totally sucked. I would give it 0 stars if I could', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_service`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `user_service` (`service_id`, `user_id`, `subscribe_date`, `current_subscrib`) VALUES (1, 4, '101015', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_content`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`) VALUES (1, 1, 4, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (1, 2);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (1, 11);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (1, 3);

COMMIT;

