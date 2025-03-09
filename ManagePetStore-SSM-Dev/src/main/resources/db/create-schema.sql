create table if not exists `admin` (
    id int auto_increment primary key,
    username varchar(255) not null,
    password varchar(255) not null
);

CREATE TABLE IF NOT EXISTS `sells` (
                                       id INT AUTO_INCREMENT PRIMARY KEY,
                                       item_id VARCHAR(10) NOT NULL,
                                       user_id VARCHAR(80) NOT NULL,
                                       amount INT NOT NULL,
                                       time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                       FOREIGN KEY (user_id) REFERENCES `account` (userid),
                                       FOREIGN KEY (item_id) REFERENCES `item` (itemid)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;
