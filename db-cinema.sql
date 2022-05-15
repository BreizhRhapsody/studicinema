mysql -uroot -p

CREATE DATABASE studicinemapp;

USE studicinemapp;

CREATE TABLE cinema (
    -> cinemaID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    -> name VARCHAR(255) NOT NULL,
    -> location VARCHAR(255) NOT NULL
    -> );

 CREATE TABLE room (
    -> roomID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    -> wording VARCHAR(255) NOT NULL,
    -> seat INTEGER NOT NULL,
    -> cinemaID INT,
    -> FOREIGN KEY (cinemaID) REFERENCES cinema(cinemaID)
    -> );

CREATE TABLE admin (
    -> adminID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    -> username VARCHAR(255) NOT NULL,
    -> password VARCHAR(255) NOT NULL,
    -> cinemaID INT,
    -> FOREIGN KEY (cinemaID) REFERENCES cinema(cinemaID)
    -> );

CREATE TABLE movie (
    -> movieID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    -> title VARCHAR(255) NOT NULL,
    -> duration TIME NOT NULL,
    -> synopsis TEXT NOT NULL,
    -> adminID INT,
    -> FOREIGN KEY (adminID) REFERENCES admin(adminID)
    -> );

CREATE TABLE price (
    -> priceID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    -> class VARCHAR(255) NOT NULL,
    -> cost INTEGER NOT NULL,
    -> cinemaID INT,
    -> FOREIGN KEY (cinemaID) REFERENCES cinema(cinemaID)
    -> );

CREATE TABLE customer (
    -> customerID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    -> payment_method VARCHAR(255) NOT NULL,
    -> priceID INT,
    -> FOREIGN KEY (priceID) REFERENCES price(priceID)
    -> );

CREATE TABLE ticket (
    -> ticketID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    -> quantity INTEGER NOT NULL,
    -> movieID INT,
    -> FOREIGN KEY (movieID) REFERENCES movie(movieID)
    -> );

CREATE TABLE shows (
    -> showID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    -> schedule DATETIME,
    -> movieID INT,
    -> FOREIGN KEY (movieID) REFERENCES movie(movieID),
    -> roomID INT,
    -> FOREIGN KEY (roomID) REFERENCES room(roomID),
    -> ticketID INT,
    -> FOREIGN KEY (ticketID) REFERENCES ticket(ticketID)
    -> );

ALTER TABLE ticket ADD customerID INT;

ALTER TABLE ticket ADD FOREIGN KEY (customerID) REFERENCES customer(customerID);

INSERT INTO cinema (name, location) VALUES   
    ->   ("Sem Molestie Incorporated","796-7647 Consectetuer, St."),
    ->   ("Lorem Auctor Quis Foundation","Ap #314-8789 Nibh Road"),
    ->   ("Imperdiet Non Vestibulum Institute","225-1465 Vel Rd."),
    ->   ("Mattis Velit Consulting","Ap #913-1010 Nullam St."),
    ->   ("Tempus LLC","Ap #275-4015 Consectetuer St.");

INSERT INTO admin (username, password, cinemaID) VALUES   
    ->   ("Ina","EVU90VNH1MY",1),
    ->   ("Portia","OWV10UGK1SC",2),
    ->   ("Kato","YPE37GRE5TY",3),
    ->   ("Anjolie","PKL68TEP4XP",4),
    ->   ("Erasmus","KKJ77FTP8DY",5);

INSERT INTO movie (title, duration, synopsis, adminID) VALUES   
    ->   ("magnis dis","02:44:53 ","ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est",1),
    ->   ("libero at","02:00:12 ","faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum",2),
    ->   ("purus ac","01:40:59 ","non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis",3),
    ->   ("velit dui,","02:25:49 ","est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec",4),
    ->   ("Aliquam ultrices","01:52:25 ","Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et",5);

ALTER TABLE price MODIFY COLUMN cost DECIMAL;

ALTER TABLE price DROP COLUMN cinemaID;

INSERT INTO price (class, cost) VALUES ("basic", 9.20), ("student", 7.60), ("child", 5.90);

INSERT INTO customer (payment_method, priceID) VALUES
    -> ("card", 1),
    -> ("cash", 3),
    -> ("cash", 2),
    -> ("card", 2);

INSERT INTO ticket (quantity, movieID, customerID) VALUES   (8,3,5),
    ->   (7,2,5),
    ->   (9,3,8),
    ->   (2,3,5),
    ->   (2,1,6);

INSERT INTO room (wording, seat, cinemaID) VALUES
    ->   ("Chandrapur",84,5),
    ->   ("Hathras",67,2),
    ->   ("Santarém",48,4),
    ->   ("Patos",34,3),
    ->   ("Guwahati",10,1);

INSERT INTO shows (schedule, movieID, roomID, ticketID) VALUES
    ->   ("Dec 3, 2021, 02,29",5,4,2),
    ->   ("Sep 14, 2021, 03,19",4,5,5),
    ->   ("Oct 22, 2021, 11,09",4,5,2),
    ->   ("May 31, 2021, 04,54",3,3,1),
    ->   ("Jun 1, 2021, 02,26",4,5,4);

mysqldump -uroot -p studicinemapp > dumpstudicinemapp.sql

