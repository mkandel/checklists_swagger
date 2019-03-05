--
-- Copyright (c) 2018. Marc Kandel
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  --`id` VARCHAR(36) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(25) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `fname` VARCHAR(25) NOT NULL,
  `lname` VARCHAR(25) NOT NULL,
  `email` VARCHAR(55) NOT NULL,
  `type` INT NOT NULL DEFAULT 3,
  `active` TINYINT(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC)
 )
ENGINE = InnoDB

-- Forget this, let SQL figure out user IDs
DROP TRIGGER IF EXISTS `Users_BEFORE_INSERT`;
--DELIMITER |
--CREATE
--TRIGGER `Users_BEFORE_INSERT`
--BEFORE INSERT ON `Users`
--FOR EACH ROW
--BEGIN
--  IF new.id IS NULL THEN
--    SET new.id = UUID();
--  END IF;
--END;
--|
--
--DELIMITER ;
INSERT INTO users (id, username, password, fName, lName, email, type)
VALUES ('', 'admin', 'admin', 'Administrative', 'User', 'no.email@here.com', 0);

DROP TABLE IF EXISTS `ChecklistTemplates`;
CREATE TABLE `ChecklistTemplates` (
  --`id` VARCHAR(36) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(55) NOT NULL,
  `createdBy` VARCHAR(36) NOT NULL,
  `updatedBy` VARCHAR(36) NOT NULL,
  `ownedBy` VARCHAR(36) NOT NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `title_UNIQUE` (`title` ASC)
--   CONSTRAINT FK_ChecklistTemplatesCreateUser_Users FOREIGN KEY (createdBy) REFERENCES Users (id),
--   CONSTRAINT FK_ChecklistsTemplatesUpdateUser_Users FOREIGN KEY (updatedBy) REFERENCES Users (id),
--   CONSTRAINT FK_ChecklistsTemplatesOwnedBy_Users FOREIGN KEY (ownedBy) REFERENCES Users (id)
 )
ENGINE = InnoDB

DROP TABLE IF EXISTS `ChecklistItems`;
CREATE TABLE `ChecklistItems` (
  --`id` VARCHAR(36) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `parentChecklistId` VARCHAR(36) NOT NULL,
  `itemText` VARCHAR(55) NOT NULL,
  `completed` TINYINT(4) NOT NULL DEFAULT '0',
  `createdBy` VARCHAR(36) NOT NULL,
  `updatedBy` VARCHAR(36) NOT NULL,
  `ownedBy` VARCHAR(36) NOT NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
--   CONSTRAINT FK_ChecklistItems_Checklists FOREIGN KEY (parentChecklistId) REFERENCES Checklists (id)
 )
ENGINE = InnoDB

DROP TABLE IF EXISTS `Checklists`;
CREATE TABLE `Checklists` (
  --`id` VARCHAR(36) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  -- Checklist title will come from the template
  `templateId` VARCHAR(36) NOT NULL,
  `active` TINYINT(4) NOT NULL DEFAULT '1',
  `createdBy` VARCHAR(36) NOT NULL,
  `updatedBy` VARCHAR(36) NOT NULL,
  `ownedBy` VARCHAR(36) NOT NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
--   CONSTRAINT FK_ChecklistCreateUser_Users FOREIGN KEY (createdBy) REFERENCES Users (id),
--   CONSTRAINT FK_ChecklistsUpdateUser_Users FOREIGN KEY (updatedBy) REFERENCES Users (id),
--   CONSTRAINT FK_ChecklistsOwnedBy_Users FOREIGN KEY (ownedBy) REFERENCES Users (id),
--   CONSTRAINT FK_ChecklistsTemplateId_Templates FOREIGN KEY (templateId) REFERENCES ChecklistTemplates (id)
 )
ENGINE = InnoDB
