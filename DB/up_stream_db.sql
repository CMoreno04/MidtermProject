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
USE `Up_Stream` ;

-- -----------------------------------------------------
-- Table `user_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_image` ;

CREATE TABLE IF NOT EXISTS `user_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(3000) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


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
  PRIMARY KEY (`id`),
  INDEX `fk_user_image_image_idx` (`image_id` ASC),
  CONSTRAINT `fk_user_image_image`
    FOREIGN KEY (`image_id`)
    REFERENCES `user_image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `service` ;

CREATE TABLE IF NOT EXISTS `service` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `monthly_price` DOUBLE NOT NULL,
  `logo` VARCHAR(2000) NULL,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `service_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `subscribe_date` DATE NULL,
  `current_subscrib` TINYINT NULL DEFAULT 1,
  INDEX `service_id_idx` (`service_id` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  PRIMARY KEY (`id`),
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
  `wish_list` TINYINT NULL DEFAULT 0,
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

SET SQL_MODE = '';
DROP USER IF EXISTS streamer@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'streamer'@'localhost' IDENTIFIED BY 'Stream';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'streamer'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `user_image` (`id`, `url`) VALUES (1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75N1KaewRuJNlWzW3nVAbSBMxpRq5A6X1S9vchO_zHie-vhwh&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1d1-jFlsr1s118lLKZXEzVPocHDrMdtVacIk5Z2FpM2fiPZtciQ&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (3, 'https://image.pushauction.com/0/0/0695585d-5c39-4661-9ef6-373cf7b2f46a/71ee8e61-9b17-4296-898d-01faca7c7d25.jpg');
INSERT INTO `user_image` (`id`, `url`) VALUES (4, 'https://clipart.info/images/ccovers/1516943361Superman-Png-Famous-Cartoon-Characters-of-All-Time.png');
INSERT INTO `user_image` (`id`, `url`) VALUES (5, 'https://images-na.ssl-images-amazon.com/images/I/41QMIXYGVqL._SX355_.jpg');
INSERT INTO `user_image` (`id`, `url`) VALUES (6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQChg2AaArnSsYsFVLJKih0dNckJifs0FBVcFV0QgZfea3gZL-W1A&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPD3EnG2lHmtiAOjdZN7qZJgFzs4tBEewTGBq3a-CQjHloET3j2Q&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz-_0NoLjqTB9X7kyKI8ngZ64m2dabnt36l9hTZkuiJ1i_REQOmg&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZwvREueDG30PXXXLWOMW4_fTbKOmxwG-taJG4hm2labiCN-lA&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT2xXNwXEEhv8tTeae6bJ3SZVhiKCZgSrrWcyE6_YunJ9N_zC_8A&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (11, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH8YA3dpElksxljHGDhpuOWOzK7NIiFV_YfOCMw9p-apcaznt24w&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (12, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOjQYFs0EOYRzo-1Ay9yE7qZN57VzrvWR5I8KD7LfahArY69y5&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (13, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcWCgnHnpplWItuAwCZ8Bvn95ULLhr9asKl__9GOgmRdGA_1AdQA&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (14, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRngwq7VTsOk54yS28WXuEfB9sDRaJeu3r7L3Bw_KbddFb6pNjw&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (15, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPnYZWc0AxK_rlgJx2MzVi7v8tbNW6KpAH0Pu8xgOUjaSd8wRs&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (16, 'https://thebottomline.as.ucsb.edu/wp-content/uploads/2018/05/Icaro-Deadpool-696x696.jpg');
INSERT INTO `user_image` (`id`, `url`) VALUES (17, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjQPlbE8_19y5lDyo3o-_C9VUT4elcB_dg02h4lS71TevrC5XQ&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (18, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQemNeGQ6T2JdcXMMagyawpz33kcMt5YtyJ6QgrMs1ckwP1KXLK&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (19, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDBFrGbUNqyy5OG9hdFMxMk4RgpPCutzpsurCm1mgBKhisYZnIwg&s');
INSERT INTO `user_image` (`id`, `url`) VALUES (20, 'https://i.pinimg.com/originals/39/bc/a5/39bca58920484e37664e9268d76bec08.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `admin`, `active`, `image_id`) VALUES (1, 'adminSam', 'Streaming', 'Samantha', 'Haviland', 1, 1, 7);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `admin`, `active`, `image_id`) VALUES (2, 'ThaLobster', 'boring', 'Andrew', 'Wong', 0, 1, 3);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `admin`, `active`, `image_id`) VALUES (3, 'CMoreno', 'boringtoo', 'Cesar', 'Moreno', 0, 1, 15);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `admin`, `active`, `image_id`) VALUES (4, 'bobbobert', 'notboring', 'Zak', 'Saylors', 0, 1, 13);
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `admin`, `active`, `image_id`) VALUES (5, 'x', 'x', 'x', 'x', 0, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `service`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `service` (`id`, `name`, `monthly_price`, `logo`) VALUES (1, 'Netflix', 8.99, 'https://logos-download.com/wp-content/uploads/2016/03/Netflix_logo.png');
INSERT INTO `service` (`id`, `name`, `monthly_price`, `logo`) VALUES (2, 'HBO', 14.99, 'https://f-scope.net/images/hbo-logo-png-10.png');
INSERT INTO `service` (`id`, `name`, `monthly_price`, `logo`) VALUES (3, 'Disney Plus', 6.99, 'https://www.reviews.org/au/app/uploads/2019/11/disney-plus-logo-300x174.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `media`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `media` (`id`, `url`) VALUES (1, 'https://upload.wikimedia.org/wikipedia/commons/3/38/Stranger_Things_logo.png');
INSERT INTO `media` (`id`, `url`) VALUES (2, 'https://www.youtube.com/embed/Bb4uR9gTVXI');
INSERT INTO `media` (`id`, `url`) VALUES (3, 'https://m.media-amazon.com/images/M/MV5BMjhiMzgxZTctNDc1Ni00OTIxLTlhMTYtZTA3ZWFkODRkNmE2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (4, 'https://www.youtube.com/embed/HhesaQXLuRY');
INSERT INTO `media` (`id`, `url`) VALUES (5, 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/chilling-sabrina-1571413127.jpg?resize=480:*');
INSERT INTO `media` (`id`, `url`) VALUES (6, 'https://www.youtube.com/embed/TUVOZ-nk0E0');
INSERT INTO `media` (`id`, `url`) VALUES (7, 'https://images-na.ssl-images-amazon.com/images/I/51MAfrtiv-L._SY355_.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (8, 'https://www.youtube.com/embed/P2yNnEhsFno');
INSERT INTO `media` (`id`, `url`) VALUES (9, 'https://thelancerlink.com/wp-content/uploads/2018/02/DRCtIglXcAErrFZ-900x506.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (10, 'https://www.youtube.com/embed/6EZCBSsBxko');
INSERT INTO `media` (`id`, `url`) VALUES (11, 'https://www.dreadcentral.com/wp-content/uploads/2018/05/In-the-Tall-Grass-poster.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (12, 'https://www.youtube.com/embed/I5tEsyUyz-U');
INSERT INTO `media` (`id`, `url`) VALUES (13, 'https://fsa.zobj.net/crop.php?r=SaJY9JZomvr9HapdbWIV1wa5AkJ54aaKYsoAc86o-HxqSRP1UtobhAJIyAUlTvN2Z2iuIb5uuzHIJA-2G-f3Z3VrugX_n9lM9jEt9npMu1pqu18Im4_lAnz4EmreTKUS_xR92KPsDnz9GdzWWFvPoFeZ_69sKQX7yrTm_DIaoHZvO0jpLBW9uUV4ZxwsJWvtoMxw0sZKQhu3RVx-');
INSERT INTO `media` (`id`, `url`) VALUES (14, 'https://www.youtube.com/embed/gcTkNV5Vg1E');
INSERT INTO `media` (`id`, `url`) VALUES (15, 'https://images-na.ssl-images-amazon.com/images/I/51IjKCRRIiL._SY679_.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (16, 'https://www.youtube.com/embed/nKgZB-UyN2U');
INSERT INTO `media` (`id`, `url`) VALUES (17, 'https://www.syfy.com/sites/syfy/files/styles/1200x680/public/2019/10/watchmen-hbo-racism-police.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (18, 'https://www.youtube.com/embed/huN34U2rmvs');
INSERT INTO `media` (`id`, `url`) VALUES (19, 'https://i.pinimg.com/originals/2e/4f/67/2e4f67ffb3072a570ee7badca5cc1a38.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (20, 'https://www.youtube.com/embed/1NTaDm3atkc');
INSERT INTO `media` (`id`, `url`) VALUES (21, 'https://cdn3.movieweb.com/i/article/HTdeMspxJqRzi0wkUZl9xrHtwLSGX3/798:50/Glass-Movie-Review-2019.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (22, 'https://www.youtube.com/embed/aBL6COBGjCA');
INSERT INTO `media` (`id`, `url`) VALUES (23, 'https://images-na.ssl-images-amazon.com/images/I/81i0EjrzjhL.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (24, 'https://www.youtube.com/embed/ZQ-YX-5bAs0');
INSERT INTO `media` (`id`, `url`) VALUES (25, 'https://specials-images.forbesimg.com/imageserve/5dc6d26f2c886a0007ebc6e0/960x0.jpg?fit=scale');
INSERT INTO `media` (`id`, `url`) VALUES (26, 'https://www.youtube.com/embed/XmI7WKrAtqs');
INSERT INTO `media` (`id`, `url`) VALUES (27, 'https://upload.wikimedia.org/wikipedia/en/4/48/DuckTales_%28Main_title%29.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (28, 'https://www.youtube.com/embed/H9cmPE88a_0');
INSERT INTO `media` (`id`, `url`) VALUES (29, 'https://www.pajiba.com/assets_c/2019/11/the-world-according-to-jeff-goldblum-thumb-700xauto-218663.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (30, 'https://www.youtube.com/embed/rV2UYw1ixRA');
INSERT INTO `media` (`id`, `url`) VALUES (31, 'https://m.media-amazon.com/images/M/MV5BOTAyYjQ3NjctNGMzNi00YThkLThmYzUtZDViYWZkMDA2YTMyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjAwMjc0NjQ@._V1_.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (32, 'https://www.youtube.com/embed/F4GV_xnN2rU');
INSERT INTO `media` (`id`, `url`) VALUES (33, 'https://ichef.bbci.co.uk/images/ic/640x360/p01nbyhr.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (34, 'https://www.youtube.com/embed/3efV2wqEjEY');
INSERT INTO `media` (`id`, `url`) VALUES (35, 'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fscottmendelson%2Ffiles%2F2018%2F12%2FCaptain-Marvel-Poster-B-1200x675.jpg');
INSERT INTO `media` (`id`, `url`) VALUES (36, 'https://www.youtube.com/embed/0LHxvxdRnYc');

COMMIT;


-- -----------------------------------------------------
-- Data for table `content`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (1, 'Stranger Things', 'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.', 1, 1, 2);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (2, 'Breaking Bad', 'Walter White, a meek high school science teacher who transforms into a ruthless player in the local methamphetamine drug trade, driven by a desire to provide for his family after being diagnosed with terminal lung cancer.', 1, 3, 4);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (3, 'The Thrilling Adventures of Sabrina', 'Sabrina Spellman must reconcile her dual nature as a half-witch, half-mortal while fighting the evil forces that threaten her, her family and the daylight world humans inhabit.', 1, 5, 6);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (4, 'To Wong Foo, Thanks for everything! Julie Newmar', 'Noxeema Jackson, Vida Boheme, and Chi Chi Rodriguez are gonna show America a thing or two about being fabulous. Dressed to kill, with their Dynel tresses tossing in the breeze behind them, these three stars of New York\'s drag-queen beauty pageant circuit have hit the open road in a 1967 Cadillac convertible. Destination: Hollywood. But the trio is in for a detour when the car breaks down in the tiny midwestern town of Snydersville, where drag queens are about as common as August snowstorms. Up to now Snydersville has been a lot more like a graveyard than a town. That\'s all about to change. The local citizenry is going to get an infusion of flash and glamour the likes of which it\'s never seen. During the course of one incredible weekend, eyes will be opened, broken hearts healed, and hair teased within an inch of its life.', 1, 7, 8);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (5, 'Bright', 'In an alternate present day, humans, orcs, elves and fairies have been coexisting since the beginning of time. Two police officers, one a human, the other an orc, embark on a routine night patrol that will alter the future of their world as they know it. Battling both their own personal differences as well as an onslaught of enemies, they must work together to protect a young female elf and a thought-to-be-forgotten relic, which, in the wrong hands, could destroy everything.', 1, 9, 10);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (6, 'In the Tall Grass', 'A brother and sister enter a field of tall grass to rescue a boy, but they soon realize they cannot escape and something evil lurks in the grass.', 1, 11, 12);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (7, 'Game of Thrones', 'The series chronicles the violent dynastic struggles among the realm\'s noble families for the Iron Throne, while other families fight for independence from it.', 2, 13, 14);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (8, 'Silicon Valley', 'This comedy series follows the misadventures of introverted computer programmer Richard and his brainy friends as they attempt to strike it rich in a high-tech gold rush. ', 2, 15, 16);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (9, 'Watchmen', 'The series focuses on events surrounding racial tensions in Tulsa, Oklahoma, in 2019. The white supremacist group the Seventh Kavalry has turned on the police over racial justice. The police conceal their identities with masks and allow masked vigilantes to join their ranks.', 2, 17, 18);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (10, 'Happy Death Day', 'A pulse-pounding slasher film meets \"Groundhog Day\" in this hit frightfest about a young woman who finds herself reliving the day of her murder--for better and for bloody worse. As each day repeats, all of the mundane details play out to the point of her death while she tries to figure out the identity of her killer and put an end to the nightmare.', 2, 19, 20);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (11, 'Glass', 'Heroes and villains collide in this explosive third installment in M. Night Shyamalan’s superhero trilogy (following “Unbreakable” and “Split”). When fate brings “unbreakable” David Dunn (Bruce Willis) and Kevin Wendell Crumb a.k.a. “The Horde” (James McAvoy) into the same mental hospital as the devious Mr. Glass (Samuel L. Jackson), it’s a confrontation 20 years in the making.', 2, 21, 22);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (12, 'Crazy Rich Asians', 'This smash-hit romantic comedy, based on the international best-seller, is \"simply great fun\" (TIME). Constance Wu stars as a New Yorker who accompanies her boyfriend to Singapore to meet his family for the first time, only to discover that he\'s the scion of one of the country\'s wealthiest families, with a disapproving mother and a slew of socialites trying to steal him away.', 2, 23, 24);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (13, 'The Mandalorian', 'After the fall of the Empire, a long gunman makes his way through the lawless galaxy', 3, 25, 26);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (14, 'Ducktales', 'The comedy-adventure series chronicles the high-flying adventures of trillionaire Scrooge McDuck, his grandnephews - Huey, Dewey, and Louie - and temperamental nephew Donald Duck, Launchpad McQuack, Mrs. Beakley, and her granddaughter Webby.', 3, 27, 28);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (15, 'The World According to Jeff Goldblum', 'The series follows Jeff, in which he explores the world, for example tattoos, ice-creams and sneakers and how they are developed.', 3, 29, 30);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (16, 'Halloween Town', 'Marnie and her kids get a big shock when they follow grandma home to Halloweentown - and find out they come from a family of witches. The town is the only place where supernatural beings can lead a `normal\' life, but trouble is looming, and on her 13th birthday Marnie not only finds she is a witch, but that she and her family are involved in a fight against the evil that is threatening to take over the world.', 3, 31, 32);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (17, 'Tron', 'When talented computer engineer Kevin Flynn (Jeff Bridges) finds out that Ed Dillinger (David Warner), an executive at his company, has been stealing his work, he tries to hack into the system. However, Flynn is transported into the digital world, where he has to face off against Dillinger\'s computerized likeness, Sark, and the imposing Master Control Program. Aided by Tron (Bruce Boxleitner) and Yori (Cindy Morgan), Flynn becomes a freedom fighter for the oppressed programs of the grid.', 3, 33, 34);
INSERT INTO `content` (`id`, `title`, `description`, `service_id`, `image_id`, `video_id`) VALUES (18, 'Captain Marvel', 'Captain Marvel is an extraterrestrial Kree warrior who finds herself caught in the middle of an intergalactic battle between her people and the Skrulls. Living on Earth in 1995, she keeps having recurring memories of another life as U.S. Air Force pilot Carol Danvers. With help from Nick Fury, Captain Marvel tries to uncover the secrets of her past while harnessing her special superpowers to end the war with the evil Skrulls.', 3, 35, 36);

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
INSERT INTO `genre` (`id`, `name`) VALUES (12, 'Action');
INSERT INTO `genre` (`id`, `name`) VALUES (13, 'Superhero');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rating_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (1, 4, 13, 'Totally sucked. I would give it 0 stars if I could', 1);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (2, 1, 14, 'Childhood classic still makes me dance when I hear the theme song.', 4);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (3, 1, 5, 'I don\'t get all the hate. I thought it was very imaginative. A lot of fun.', 4);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (4, 1, 4, 'I\'ll sum up how awesome this movie is in 4 words: Wesley Snipes in drag.', 5);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (5, 3, 6, 'Not my cup of tea. The time jumps were weird and repeatitive. ', 3);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (6, 2, 12, 'I got bored half way through.', 2);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (7, 3, 7, 'meh.', 1);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (8, 2, 18, 'Action packed fun. Captain Marvel is BA', 5);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (9, 4, 12, 'A one point I cried', 4);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (10, 4, 1, 'Creepy and imaginative', 4);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (11, 2, 2, 'This show program promotes drug use!', 1);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (12, 3, 2, 'Breaking Bad is sooooo good. I\'ve been kept on the edge of my seat!', 5);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (13, 4, 2, 'It\'s good', 4);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (14, 4, 4, 'Hilarious', 5);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (15, 2, 4, 'Loved it!', 4);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (16, 4, 18, 'Marvel has really done it this time!', 5);
INSERT INTO `rating_review` (`id`, `user_id`, `content_id`, `comment`, `rating`) VALUES (17, 3, 18, 'Captain Marvel rocks my socks ', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_service`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `user_service` (`id`, `service_id`, `user_id`, `subscribe_date`, `current_subscrib`) VALUES (DEFAULT, 1, 4, '101015', 1);
INSERT INTO `user_service` (`id`, `service_id`, `user_id`, `subscribe_date`, `current_subscrib`) VALUES (DEFAULT, 1, 3, '071214', 1);
INSERT INTO `user_service` (`id`, `service_id`, `user_id`, `subscribe_date`, `current_subscrib`) VALUES (DEFAULT, 2, 3, '131016', 1);
INSERT INTO `user_service` (`id`, `service_id`, `user_id`, `subscribe_date`, `current_subscrib`) VALUES (DEFAULT, 3, 3, '121119', 1);
INSERT INTO `user_service` (`id`, `service_id`, `user_id`, `subscribe_date`, `current_subscrib`) VALUES (DEFAULT, 1, 2, '020216', 1);
INSERT INTO `user_service` (`id`, `service_id`, `user_id`, `subscribe_date`, `current_subscrib`) VALUES (DEFAULT, 2, 2, '010117', 1);
INSERT INTO `user_service` (`id`, `service_id`, `user_id`, `subscribe_date`, `current_subscrib`) VALUES (DEFAULT, 1, 1, '030411', 1);
INSERT INTO `user_service` (`id`, `service_id`, `user_id`, `subscribe_date`, `current_subscrib`) VALUES (DEFAULT, 2, 1, '050515', 1);
INSERT INTO `user_service` (`id`, `service_id`, `user_id`, `subscribe_date`, `current_subscrib`) VALUES (DEFAULT, 3, 1, '121119', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_content`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (1, 1, 4, 0, 0);
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (2, 4, 4, 0, 0);
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (3, 12, 2, 0, 0);
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (4, 10, 2, 0, 0);
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (5, 7, 2, 0, 0);
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (6, 8, 3, 0, 0);
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (7, 2, 3, 0, 0);
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (8, 17, 3, 0, 0);
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (9, 13, 1, 0, 0);
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (10, 3, 1, 0, 0);
INSERT INTO `user_content` (`id`, `content_id`, `user_id`, `favorites`, `wish_list`) VALUES (11, 18, 1, 0, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `Up_Stream`;
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (1, 2);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (1, 11);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (1, 3);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (2, 3);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (2, 7);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (2, 8);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (3, 2);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (3, 7);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (3, 3);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (4, 1);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (4, 7);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (5, 12);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (5, 7);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (5, 6);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (6, 2);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (6, 3);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (7, 6);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (8, 1);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (9, 12);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (9, 7);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (10, 1);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (10, 2);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (10, 3);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (9, 13);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (11, 13);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (11, 3);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (11, 5);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (11, 7);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (12, 1);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (12, 4);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (12, 7);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (13, 12);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (13, 5);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (14, 1);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (14, 12);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (14, 6);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (15, 9);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (15, 1);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (16, 1);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (16, 7);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (16, 6);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (17, 5);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (17, 12);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (18, 12);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (18, 13);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (18, 6);
INSERT INTO `content_genre` (`content_id`, `genre_id`) VALUES (18, 5);

COMMIT;

