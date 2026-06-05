# create db
CREATE DATABASE IF NOT EXISTS RiftArea;
USE RiftArea;

# card entity: create cards table
CREATE TABLE CARD (
	id VARCHAR(12) PRIMARY KEY, 
    collectorNumber LONG NOT NULL, 
    `set` VARCHAR(3) NOT NULL, 
    `name` VARCHAR(30) NOT NULL, 
    `description` VARCHAR(50), 
    `type` SET('unit', 'spell', 'gear', 'champion', 'signature', 'legend', 'battlefield', 'rune', 'token') NOT NULL, 
    rarity ENUM('common', 'uncommon', 'rare', 'epic', 'showcase') NOT NULL, 
    faction SET('fury', 'body', 'order', 'calm', 'mind', 'chaos', 'null') NOT NULL, 
    # keywords
    flavorText VARCHAR(120),
    # tags
    
    # card stats
    energy INT(2) CHECK(0 <= energy <= 12), 
    might INT(2), 
    `power` INT(2) CHECK(0 <= `power` <= 12)
);

# card art relation
CREATE TABLE CARDART (
	card_id VARCHAR(12) NOT NULL UNIQUE, 
	fullURL LONG NOT NULL, 
    
    FOREIGN KEY (card_id) REFERENCES CARD(id)
);

# card tags entity
CREATE TABLE TAG (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL
);

# card tag relation
CREATE TABLE CARDTAG (
	card_id VARCHAR(12), 
    tag_id INT, 
    
    FOREIGN KEY (card_id) REFERENCES CARD(id), 
    FOREIGN KEY (tag_id) REFERENCES TAG(id)
);
