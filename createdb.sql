# create db
CREATE DATABASE IF NOT EXISTS RiftArea;
USE RiftArea;

# card entity: create cards table
CREATE TABLE CARD (
	card_serial VARCHAR(12) PRIMARY KEY,
    card_name VARCHAR(30) NOT NULL, 
    card_subname VARCHAR(30), 
    domain SET('fury', 'body', 'order', 'calm', 'mind', 'chaos') NOT NULL, 
    rarity ENUM('common', 'uncommon', 'rare', 'epic', 'showcase') NOT NULL, 
    card_type SET('unit', 'spell', 'gear', 'champion', 'signature', 'legend', 'battlefield', 'rune', 'token') NOT NULL, 
    
    energy_cost INT(2) CHECK(0 <= energy <= 12), 
    power_cost INT(2) CHECK(0 <= power <= 12),
    might INT(2) CHECK(0 <= might <= 12)
);

# tag functional entity: create tags table for cards
CREATE TABLE TAG (
	tag_id INT PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(30) UNIQUE NOT NULL
);

# card tags relational entity: relational table for tags of cards
CREATE TABLE CardTag (
	card_serial VARCHAR(12), 
    tag_id INT, 
    
    FOREIGN KEY (card_serial) REFERENCES CARD(card_serial),
    FOREIGN KEY (tag_id) REFERENCES TAG(tag_id)
);