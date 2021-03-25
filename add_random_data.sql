drop table if exists Movies_has_Languages;
drop table if exists Movies_has_Genre;
drop table if exists Movies_has_Characters;
drop table if exists Movies_has_Directors;
drop table if exists Characters_has_Persondata;
drop table if exists Trailers;
drop table if exists Images;
drop table if exists Genre;
drop table if exists Languages;
drop table if exists Characters;
drop table if exists PersonData;
drop table if exists Movies;
drop table if exists productioncompanies;
drop table if exists ContactInfo;

-- -----------------------------------------------------
-- Table `YMDB`.`ContactInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`ContactInfo` (
    `ContactInfo_id` INT NOT NULL AUTO_INCREMENT,
    `ContactInfo_Country` VARCHAR(45) NULL,
    `ContactInfo_Zip` VARCHAR(45) NULL,
    `ContactInfo_Street` VARCHAR(45) NULL,
    `ContactInfo_StreetNumber` INT NULL,
    `ContactInfo_Phone` VARCHAR(45) NULL,
    `ContactInfo_Email` VARCHAR(45) NULL,
    PRIMARY KEY (`ContactInfo_id`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `YMDB`.`ProductionCompanies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`ProductionCompanies` (
  `ProductionCompany_id` INT NOT NULL AUTO_INCREMENT,
  `ProductionCompany_Name` VARCHAR(45) NOT NULL,
  `ProductionCompany_ContactInfo_id` INT NOT NULL,
  PRIMARY KEY (`ProductionCompany_id`),
  INDEX `fk_ProductionCompanies_ContactInfo1_idx` (`ProductionCompany_ContactInfo_id` ASC) VISIBLE,
  CONSTRAINT `fk_ProductionCompanies_ContactInfo1`
    FOREIGN KEY (`ProductionCompany_ContactInfo_id`)
    REFERENCES `YMDB`.`ContactInfo` (`ContactInfo_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMDB`.`Movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Movies` (
  `Movie_id` INT NOT NULL AUTO_INCREMENT,
  `Movie_Title` TEXT NOT NULL,
  `Movie_Length` TIME NULL,
  `Movie_Year` YEAR NULL,
  `Movie_Description` TEXT NULL,
  `Movie_ProductionCompany_id` INT NOT NULL,
  PRIMARY KEY (`Movie_id`, `Movie_ProductionCompany_id`),
  INDEX `fk_Movies_ProductionCompanies1_idx` (`Movie_ProductionCompany_id` ASC) VISIBLE,
  CONSTRAINT `fk_Movies_ProductionCompanies1`
    FOREIGN KEY (`Movie_ProductionCompany_id`)
    REFERENCES `YMDB`.`ProductionCompanies` (`ProductionCompany_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMDB`.`Languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Languages` (
    `Language_id` INT NOT NULL AUTO_INCREMENT,
    `Language_Name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`Language_id`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `YMDB`.`Characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Characters` (
    `Character_id` INT NOT NULL AUTO_INCREMENT,
    `Character_Name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`Character_id`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `YMDB`.`Trailers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Trailers` (
  `Trailer_id` INT NOT NULL AUTO_INCREMENT,
  `Trailer_Url` VARCHAR(45) NOT NULL,
  `Trailer_Movie_id` INT NOT NULL,
  PRIMARY KEY (`Trailer_id`),
  INDEX `fk_Trailers_Movies1_idx` (`Trailer_Movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_Trailers_Movies1`
    FOREIGN KEY (`Trailer_Movie_id`)
    REFERENCES `YMDB`.`Movies` (`Movie_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMDB`.`Images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Images` (
  `Image_id` INT NOT NULL AUTO_INCREMENT,
  `Image_Url` TEXT NOT NULL,
  `Image_Movie_id` INT NOT NULL,
  PRIMARY KEY (`Image_id`),
  INDEX `fk_Posters_Movies1_idx` (`Image_Movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_Posters_Movies1`
    FOREIGN KEY (`Image_Movie_id`)
    REFERENCES `YMDB`.`Movies` (`Movie_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMDB`.`PersonData`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`PersonData` (
  `PersonData_id` INT NOT NULL AUTO_INCREMENT,
  `PersonData_FirstName` VARCHAR(45) NOT NULL,
  `PersonData_LastName` VARCHAR(45) NOT NULL,
  `PersonData_Gender` VARCHAR(45) NULL,
  `PersonData_BirthDate` VARCHAR(45) NULL,
  `PersonData_Married` TINYINT NULL,
  `PersonData_ContactInfo_id` INT NULL,
  PRIMARY KEY (`PersonData_id`),
  INDEX `fk_PersonData_ContactInfo1_idx` (`PersonData_ContactInfo_id` ASC) VISIBLE,
  CONSTRAINT `fk_PersonData_ContactInfo1`
    FOREIGN KEY (`PersonData_ContactInfo_id`)
    REFERENCES `YMDB`.`ContactInfo` (`ContactInfo_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMDB`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Genre` (
    `Genre_id` INT NOT NULL,
    `Genre_Name` VARCHAR(45) NULL,
    PRIMARY KEY (`Genre_id`)
)  ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `YMDB`.`Movies_has_Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Movies_has_Genre` (
  `Movies_has_Genre_Movie_id` INT NOT NULL,
  `Movies_has_Genre_Genre_id` INT NOT NULL,
  PRIMARY KEY (`Movies_has_Genre_Movie_id`, `Movies_has_Genre_Genre_id`),
  INDEX `fk_Movies_has_Genre_Genre1_idx` (`Movies_has_Genre_Genre_id` ASC) VISIBLE,
  INDEX `fk_Movies_has_Genre_Movies1_idx` (`Movies_has_Genre_Movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_Movies_has_Genre_Movies1`
    FOREIGN KEY (`Movies_has_Genre_Movie_id`)
    REFERENCES `YMDB`.`Movies` (`Movie_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Movies_has_Genre_Genre1`
    FOREIGN KEY (`Movies_has_Genre_Genre_id`)
    REFERENCES `YMDB`.`Genre` (`Genre_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMDB`.`Movies_has_Characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Movies_has_Characters` (
  `Movies_has_Characters_Movie_id` INT NOT NULL,
  `Movies_has_Characters_Character_id` INT NOT NULL,
  PRIMARY KEY (`Movies_has_Characters_Movie_id`, `Movies_has_Characters_Character_id`),
  INDEX `fk_Movies_has_Characters_Characters1_idx` (`Movies_has_Characters_Character_id` ASC) VISIBLE,
  INDEX `fk_Movies_has_Characters_Movies1_idx` (`Movies_has_Characters_Movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_Movies_has_Characters_Movies1`
    FOREIGN KEY (`Movies_has_Characters_Movie_id`)
    REFERENCES `YMDB`.`Movies` (`Movie_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Movies_has_Characters_Characters1`
    FOREIGN KEY (`Movies_has_Characters_Character_id`)
    REFERENCES `YMDB`.`Characters` (`Character_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMDB`.`Movies_has_Directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Movies_has_Directors` (
  `Movies_has_Directors_Movie_id` INT NOT NULL,
  `Movies_has_Directors_PersonData_id` INT NOT NULL,
  PRIMARY KEY (`Movies_has_Directors_Movie_id`, `Movies_has_Directors_PersonData_id`),
  INDEX `fk_Movies_has_Directors_Movies1_idx` (`Movies_has_Directors_Movie_id` ASC) VISIBLE,
  INDEX `fk_Movies_has_Directors_PersonData1_idx` (`Movies_has_Directors_PersonData_id` ASC) VISIBLE,
  CONSTRAINT `fk_Movies_has_Directors_Movies1`
    FOREIGN KEY (`Movies_has_Directors_Movie_id`)
    REFERENCES `YMDB`.`Movies` (`Movie_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Movies_has_Directors_PersonData1`
    FOREIGN KEY (`Movies_has_Directors_PersonData_id`)
    REFERENCES `YMDB`.`PersonData` (`PersonData_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMDB`.`Characters_has_PersonData`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Characters_has_PersonData` (
  `Characters_has_PersonData_Character_id` INT NOT NULL,
  `Characters_has_PersonData_PersonData_id` INT NOT NULL,
  PRIMARY KEY (`Characters_has_PersonData_Character_id`, `Characters_has_PersonData_PersonData_id`),
  INDEX `fk_Characters_has_PersonData_PersonData1_idx` (`Characters_has_PersonData_PersonData_id` ASC) VISIBLE,
  INDEX `fk_Characters_has_PersonData_Characters1_idx` (`Characters_has_PersonData_Character_id` ASC) VISIBLE,
  CONSTRAINT `fk_Characters_has_PersonData_Characters1`
    FOREIGN KEY (`Characters_has_PersonData_Character_id`)
    REFERENCES `YMDB`.`Characters` (`Character_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Characters_has_PersonData_PersonData1`
    FOREIGN KEY (`Characters_has_PersonData_PersonData_id`)
    REFERENCES `YMDB`.`PersonData` (`PersonData_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YMDB`.`Movies_has_Languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YMDB`.`Movies_has_Languages` (
  `Movies_has_Languages_Movie_id` INT NOT NULL,
  `Movies_has_Languages_Language_id` INT NOT NULL,
  PRIMARY KEY (`Movies_has_Languages_Movie_id`, `Movies_has_Languages_Language_id`),
  INDEX `fk_Movies_has_Languages_Languages1_idx` (`Movies_has_Languages_Language_id` ASC) VISIBLE,
  INDEX `fk_Movies_has_Languages_Movies1_idx` (`Movies_has_Languages_Movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_Movies_has_Languages_Movies1`
    FOREIGN KEY (`Movies_has_Languages_Movie_id`)
    REFERENCES `YMDB`.`Movies` (`Movie_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Movies_has_Languages_Languages1`
    FOREIGN KEY (`Movies_has_Languages_Language_id`)
    REFERENCES `YMDB`.`Languages` (`Language_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

-- ContactInfo
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (1, 'Philippines', '7505', 'Ludington', '7667', '404-487-2304', 'shehl0@wikimedia.org');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (2, 'Philippines', '6406', 'Old Gate', '314', '757-434-0408', 'jboich1@hp.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (3, 'China', null, 'Mallory', '4217', '952-858-2227', 'ipetracci2@tiny.cc');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (4, 'Thailand', '13170', 'Hanson', '49', '493-288-8568', 'tconquest3@last.fm');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (5, 'Poland', '39-323', 'Pearson', '445', '529-225-5939', 'trubie4@fc2.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (6, 'Somalia', null, 'Linden', '1', '578-107-7970', 'ejeavon5@archive.org');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (7, 'France', '38009 CEDEX 1', 'Northland', '066', '409-989-5665', 'adislee6@marketwatch.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (8, 'Indonesia', null, 'Fair Oaks', '22380', '423-234-8683', 'jspeers7@behance.net');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (9, 'China', null, 'Hollow Ridge', '8754', '782-532-0866', 'gcheevers8@mozilla.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (10, 'Czech Republic', '666 02', 'Basil', '45408', '302-132-5754', 'nderges9@drupal.org');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (11, 'China', null, 'Crescent Oaks', '840', '460-223-0166', 'mheadeya@marriott.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (12, 'China', null, 'Kenwood', '22', '728-675-3536', 'kklavesb@virginia.edu');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (13, 'Tanzania', null, 'Sycamore', '46', '557-808-3701', 'mpietruschkac@cargocollective.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (14, 'Czech Republic', '669 02', 'Kingsford', '7565', '328-493-1295', 'silchenkod@alibaba.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (15, 'Serbia', null, 'Graceland', '3087', '513-136-4979', 'jturmalle@engadget.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (16, 'Poland', '71-899', 'Shoshone', '46', '886-116-5783', 'erudgef@pagesperso-orange.fr');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (17, 'Peru', null, 'Dorton', '29957', '768-694-1880', 'tdelafoyg@redcross.org');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (18, 'China', null, 'Namekagon', '2', '251-926-7661', 'vwoodberryh@nba.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (19, 'Poland', '87-302', 'Express', '46902', '622-288-4671', 'lratteri@yahoo.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (20, 'Palestinian Territory', null, 'Stone Corner', '3936', '453-394-2108', 'gcubberleyj@ehow.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (21, 'China', null, 'Summit', '015', '866-244-4194', 'zcrowcumk@bigcartel.com');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (22, 'Gambia', null, 'Luster', '75', '875-471-0465', 'plurcockl@prlog.org');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (23, 'China', null, 'Anderson', '543', '740-633-7779', 'imcmullenm@g.co');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (24, 'Indonesia', null, 'Tennyson', '1686', '111-472-6059', 'jfraryn@cpanel.net');
insert into ContactInfo (ContactInfo_id, ContactInfo_Country, ContactInfo_Zip, ContactInfo_Street, ContactInfo_StreetNumber, ContactInfo_Phone, ContactInfo_Email) values (25, 'China', null, 'Chinook', '60355', '663-946-4482', 'abalsdono@comsenz.com');

-- PersonData
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (1, 'Jemima', 'Ferrige', 'Female', '1964-09-18', 1, 1);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (2, 'Abbie', 'Peterkin', 'Female', '1989-10-10', 1, 2);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (3, 'Llywellyn', 'Fallowes', 'Female', '1994-08-12', 1, 3);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (4, 'Vyky', 'Lavin', 'Male', '1990-11-07', 1, 4);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (5, 'Jaquith', 'McGeneay', 'Female', '1990-10-13', 1, 5);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (6, 'George', 'Pickwell', 'Male', '1980-02-22', 1, 6);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (7, 'Jarrad', 'Merigon', 'Male', '1986-01-01', 0, 7);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (8, 'Glyn', 'Ellerman', 'Male', '1974-06-14', 1, 8);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (9, 'Brendin', 'Furbank', 'Female', '1965-09-29', 0, 9);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (10, 'Leyla', 'Dudbridge', 'Female', '1981-07-27', 1, 10);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (11, 'Arnaldo', 'Cawdell', 'Male', '1988-04-26', 1, 11);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (12, 'Lonny', 'Cino', 'Male', '1987-12-01', 0, 12);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (13, 'Jade', 'Deem', 'Female', '1997-10-28', 1, 13);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (14, 'Verne', 'Blaisdale', 'Male', '1957-10-03', 1, 14);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (15, 'Alice', 'Matschuk', 'Female', '1986-02-02', 0, 15);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (16, 'Reeba', 'Wardhough', 'Female', '1992-01-30', 0, 16);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (17, 'Lefty', 'Debney', 'Male', '1971-03-15', 1, 17);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (18, 'Noach', 'Laba', 'Male', '1985-12-04', 0, 18);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (19, 'Harwilll', 'Duetsche', 'Male', '1964-02-18', 1, 19);
insert into PersonData (PersonData_id, PersonData_FirstName, PersonData_LastName, PersonData_Gender, PersonData_BirthDate, PersonData_Married, PersonData_ContactInfo_id) values (20, 'Garrik', 'Shelton', 'Male', '1977-07-06', 0, 20);

-- ProductionCompanies
insert into ProductionCompanies (ProductionCompany_id, ProductionCompany_Name, ProductionCompany_ContactInfo_id) values (1, 'Bednar, Harber and Kuphal', 21);
insert into ProductionCompanies (ProductionCompany_id, ProductionCompany_Name, ProductionCompany_ContactInfo_id) values (2, 'Fadel, Connelly and Hilll', 22);
insert into ProductionCompanies (ProductionCompany_id, ProductionCompany_Name, ProductionCompany_ContactInfo_id) values (3, 'Bednar Group', 23);
insert into ProductionCompanies (ProductionCompany_id, ProductionCompany_Name, ProductionCompany_ContactInfo_id) values (4, 'Feeney, Grimes and Streich', 24);
insert into ProductionCompanies (ProductionCompany_id, ProductionCompany_Name, ProductionCompany_ContactInfo_id) values (5, 'Franecki and Sons', 25);

-- Movies
insert into Movies (Movie_id, Movie_Title, Movie_Length, Movie_Year, Movie_Description, Movie_ProductionCompany_id) values (1, 'Romantics Anonymous (Les émotifs anonymes)', '1:28', 2003, 'sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 2);
insert into Movies (Movie_id, Movie_Title, Movie_Length, Movie_Year, Movie_Description, Movie_ProductionCompany_id) values (2, 'Al-risâlah', '1:26', 2000, 'amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis', 3);
insert into Movies (Movie_id, Movie_Title, Movie_Length, Movie_Year, Movie_Description, Movie_ProductionCompany_id) values (3, 'Swimfan', '2:43', 1995, 'eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', 5);
insert into Movies (Movie_id, Movie_Title, Movie_Length, Movie_Year, Movie_Description, Movie_ProductionCompany_id) values (4, 'Toy Story Toons: Partysaurus Rex', '1:06', 1992, 'quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec', 2);
insert into Movies (Movie_id, Movie_Title, Movie_Length, Movie_Year, Movie_Description, Movie_ProductionCompany_id) values (5, 'Ringu (Ring)', '2:30', 2008, 'quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse', 4);
insert into Movies (Movie_id, Movie_Title, Movie_Length, Movie_Year, Movie_Description, Movie_ProductionCompany_id) values (6, 'Some Days Are Better Than Others', '2:26', 2003, 'luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et', 1);
insert into Movies (Movie_id, Movie_Title, Movie_Length, Movie_Year, Movie_Description, Movie_ProductionCompany_id) values (7, 'Tell It to the Marines', '2:59', 1967, 'molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique', 5);
insert into Movies (Movie_id, Movie_Title, Movie_Length, Movie_Year, Movie_Description, Movie_ProductionCompany_id) values (8, 'Tetsuo, the Ironman (Tetsuo)', '2:28', 2006, 'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 4);
insert into Movies (Movie_id, Movie_Title, Movie_Length, Movie_Year, Movie_Description, Movie_ProductionCompany_id) values (9, 'On the Line', '1:26', 2002, 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec', 1);
insert into Movies (Movie_id, Movie_Title, Movie_Length, Movie_Year, Movie_Description, Movie_ProductionCompany_id) values (10, 'Rink, The', '1:32', 2002, 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet', 2);

-- Characters
insert into Characters (Character_id, Character_Name) values (1, 'Eydie');
insert into Characters (Character_id, Character_Name) values (2, 'Alisha');
insert into Characters (Character_id, Character_Name) values (3, 'Klemens');
insert into Characters (Character_id, Character_Name) values (4, 'Carlee');
insert into Characters (Character_id, Character_Name) values (5, 'Jehanna');
insert into Characters (Character_id, Character_Name) values (6, 'Orren');
insert into Characters (Character_id, Character_Name) values (7, 'Guntar');
insert into Characters (Character_id, Character_Name) values (8, 'Dagmar');
insert into Characters (Character_id, Character_Name) values (9, 'Emyle');
insert into Characters (Character_id, Character_Name) values (10, 'Moreen');
insert into Characters (Character_id, Character_Name) values (11, 'Gabbie');
insert into Characters (Character_id, Character_Name) values (12, 'Owen');
insert into Characters (Character_id, Character_Name) values (13, 'Shirley');

-- Characters_has_PersonData
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (1, 1);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (2, 2);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (3, 3);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (4, 4);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (5, 5);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (6, 6);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (7, 7);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (8, 8);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (9, 9);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (10, 10);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (11, 11);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (12, 12);
insert into Characters_has_PersonData (Characters_has_PersonData_Character_id, Characters_has_PersonData_PersonData_id) values (13, 13);

-- Movies_has_Characters
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (2, 12);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (3, 4);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (10, 10);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (8, 9);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (5, 5);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (10, 13);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (2, 13);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (9, 12);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (2, 10);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (1, 9);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (4, 11);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (10, 1);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (3, 6);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (1, 3);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (9, 10);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (1, 2);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (4, 5);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (3, 8);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (6, 4);
insert into Movies_has_Characters (Movies_has_Characters_Movie_id, Movies_has_Characters_Character_id) values (10, 2);

-- Movies_has_Directors
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (8, 5);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (5, 4);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (7, 7);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (1, 6);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (10, 5);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (6, 1);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (8, 3);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (2, 7);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (9, 2);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (9, 4);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (2, 6);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (9, 7);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (4, 7);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (9, 5);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (1, 5);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (7, 5);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (3, 3);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (9, 3);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (10, 7);
insert into Movies_has_Directors (Movies_has_Directors_Movie_id, Movies_has_Directors_PersonData_id) values (1, 1);

-- Languages
insert into Languages (Language_id, Language_Name) values (1, 'English');
insert into Languages (Language_id, Language_Name) values (2, 'Persian');
insert into Languages (Language_id, Language_Name) values (3, 'Thai');
insert into Languages (Language_id, Language_Name) values (4, 'Filipino');
insert into Languages (Language_id, Language_Name) values (5, 'Quechua');
insert into Languages (Language_id, Language_Name) values (6, 'Hebrew');
insert into Languages (Language_id, Language_Name) values (7, 'Afrikaans');
insert into Languages (Language_id, Language_Name) values (8, 'Swedish');
insert into Languages (Language_id, Language_Name) values (9, 'Quechua');
insert into Languages (Language_id, Language_Name) values (10, 'Maltese');
insert into Languages (Language_id, Language_Name) values (11, 'Guaraní');
insert into Languages (Language_id, Language_Name) values (12, 'Armenian');
insert into Languages (Language_id, Language_Name) values (13, 'Hiri Motu');
insert into Languages (Language_id, Language_Name) values (14, 'Estonian');
insert into Languages (Language_id, Language_Name) values (15, 'Luxembourgish');
insert into Languages (Language_id, Language_Name) values (16, 'Belarusian');
insert into Languages (Language_id, Language_Name) values (17, 'German');
insert into Languages (Language_id, Language_Name) values (18, 'Latvian');
insert into Languages (Language_id, Language_Name) values (19, 'New Zealand Sign Language');
insert into Languages (Language_id, Language_Name) values (20, 'Tajik');

-- Movies_has_Languages
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (8, 13);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (1, 12);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (10, 7);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (5, 7);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (6, 6);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (5, 5);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (6, 13);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (3, 17);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (10, 8);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (1, 14);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (7, 13);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (7, 19);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (9, 7);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (1, 11);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (3, 14);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (2, 7);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (2, 13);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (5, 15);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (6, 9);
insert into Movies_has_Languages (Movies_has_Languages_Movie_id, Movies_has_Languages_Language_id) values (4, 16);

-- Trailers
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (1, 'tellus.avi', 10);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (2, 'sem.avi', 10);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (3, 'at_velit_eu.avi', 4);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (4, 'libero.mp3', 6);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (5, 'quisque_erat_eros.mp3', 6);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (6, 'in_quam.avi', 2);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (7, 'nunc_viverra_dapibus.mp3', 6);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (8, 'donec_diam_neque.mp3', 4);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (9, 'turpis.mp3', 7);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (10, 'velit.avi', 9);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (11, 'ut.mov', 8);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (12, 'quis_turpis.mp3', 10);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (13, 'libero.mp3', 8);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (14, 'vel_nulla.mpeg', 10);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (15, 'vestibulum.mov', 4);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (16, 'libero_ut_massa.mp3', 4);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (17, 'ante.avi', 2);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (18, 'nullam_molestie_nibh.mpeg', 9);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (19, 'consequat_in.avi', 4);
insert into Trailers (Trailer_id, Trailer_Url, Trailer_Movie_id) values (20, 'pellentesque_at.mov', 2);

-- Images
insert into Images (Image_id, Image_Url, Image_Movie_id) values (1, 'http://dummyimage.com/217x102.bmp/ff4444/ffffff', 2);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (2, 'http://dummyimage.com/241x132.jpg/ff4444/ffffff', 1);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (3, 'http://dummyimage.com/218x170.png/5fa2dd/ffffff', 8);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (4, 'http://dummyimage.com/105x181.jpg/dddddd/000000', 3);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (5, 'http://dummyimage.com/227x123.bmp/ff4444/ffffff', 6);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (6, 'http://dummyimage.com/185x186.jpg/dddddd/000000', 9);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (7, 'http://dummyimage.com/195x246.png/5fa2dd/ffffff', 10);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (8, 'http://dummyimage.com/145x176.bmp/dddddd/000000', 4);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (9, 'http://dummyimage.com/150x196.jpg/5fa2dd/ffffff', 5);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (10, 'http://dummyimage.com/202x173.png/ff4444/ffffff', 10);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (11, 'http://dummyimage.com/184x148.jpg/cc0000/ffffff', 3);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (12, 'http://dummyimage.com/166x222.bmp/ff4444/ffffff', 5);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (13, 'http://dummyimage.com/124x191.jpg/cc0000/ffffff', 9);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (14, 'http://dummyimage.com/115x108.png/ff4444/ffffff', 6);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (15, 'http://dummyimage.com/189x198.bmp/ff4444/ffffff', 3);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (16, 'http://dummyimage.com/240x209.png/ff4444/ffffff', 8);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (17, 'http://dummyimage.com/247x120.jpg/5fa2dd/ffffff', 6);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (18, 'http://dummyimage.com/191x125.png/ff4444/ffffff', 4);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (19, 'http://dummyimage.com/112x190.bmp/cc0000/ffffff', 9);
insert into Images (Image_id, Image_Url, Image_Movie_id) values (20, 'http://dummyimage.com/239x196.jpg/ff4444/ffffff', 2);

-- Genre
insert into Genre (Genre_id, Genre_Name) values (1, 'Thriller');
insert into Genre (Genre_id, Genre_Name) values (2, 'Adventure|Animation|Drama|Fantasy|Sci-Fi');
insert into Genre (Genre_id, Genre_Name) values (3, 'Drama');
insert into Genre (Genre_id, Genre_Name) values (4, 'Drama');
insert into Genre (Genre_id, Genre_Name) values (5, 'Documentary');
insert into Genre (Genre_id, Genre_Name) values (6, 'Horror|Thriller');
insert into Genre (Genre_id, Genre_Name) values (7, 'Documentary');
insert into Genre (Genre_id, Genre_Name) values (8, 'Action|Crime|Mystery');
insert into Genre (Genre_id, Genre_Name) values (9, 'Drama');
insert into Genre (Genre_id, Genre_Name) values (10, 'Drama');
insert into Genre (Genre_id, Genre_Name) values (11, 'Comedy|Crime');
insert into Genre (Genre_id, Genre_Name) values (12, 'Adventure|Drama|Romance');
insert into Genre (Genre_id, Genre_Name) values (13, 'Drama');
insert into Genre (Genre_id, Genre_Name) values (14, 'Drama');
insert into Genre (Genre_id, Genre_Name) values (15, 'Documentary');
insert into Genre (Genre_id, Genre_Name) values (16, 'Drama');
insert into Genre (Genre_id, Genre_Name) values (17, 'Comedy|Romance');
insert into Genre (Genre_id, Genre_Name) values (18, 'Drama|War');
insert into Genre (Genre_id, Genre_Name) values (19, 'Fantasy');
insert into Genre (Genre_id, Genre_Name) values (20, 'Animation|Children');

-- Movies_has_Genre
insert into Movies_has_Genre (Movies_has_Genre_Movie_id, Movies_has_Genre_Genre_id) values (1, 20);
insert into Movies_has_Genre (Movies_has_Genre_Movie_id, Movies_has_Genre_Genre_id) values (2, 17);
insert into Movies_has_Genre (Movies_has_Genre_Movie_id, Movies_has_Genre_Genre_id) values (3, 1);
insert into Movies_has_Genre (Movies_has_Genre_Movie_id, Movies_has_Genre_Genre_id) values (4, 11);
insert into Movies_has_Genre (Movies_has_Genre_Movie_id, Movies_has_Genre_Genre_id) values (5, 2);
insert into Movies_has_Genre (Movies_has_Genre_Movie_id, Movies_has_Genre_Genre_id) values (6, 1);
insert into Movies_has_Genre (Movies_has_Genre_Movie_id, Movies_has_Genre_Genre_id) values (7, 3);
insert into Movies_has_Genre (Movies_has_Genre_Movie_id, Movies_has_Genre_Genre_id) values (8, 9);
insert into Movies_has_Genre (Movies_has_Genre_Movie_id, Movies_has_Genre_Genre_id) values (9, 5);
insert into Movies_has_Genre (Movies_has_Genre_Movie_id, Movies_has_Genre_Genre_id) values (10, 16);