START TRANSACTION;

DROP TABLE IF EXISTS club, player, manager, stat, club_player, club_manager, stat_player, stat_club, stat_manager CASCADE;

CREATE TABLE club (
	club_id serial,
	club_name varchar(100) NOT NULL,
	founded date NULL,
	location varchar(50) NOT NULL,  
	stadium varchar(100) NOT NULL,
	squad_size int NOT NULL,
	mv_euros money NOT NULL,
	euro_comp boolean NOT NULL,
	website varchar(50) NOT NULL,
	CONSTRAINT PK_club PRIMARY KEY(club_id)
);

CREATE TABLE player (
	player_id serial,
	player_name varchar(100) NOT NULL,
	shirt_number varchar(2) NULL,
	position varchar(50) NOT NULL,
	date_of_birth date NOT NULL,
	mv_euros money NULL,
	height numeric NULL,
	nationality varchar(50) NOT NULL,
	capped boolean NOT NULL,
	CONSTRAINT PK_player PRIMARY KEY(player_id)
);

CREATE TABLE manager (
	manager_id serial,
	manager_name varchar(100) NOT NULL,
	date_of_birth date NOT NULL,
	nationality varchar(50) NOT NULL,
	CONSTRAINT PK_manager PRIMARY KEY(manager_id)
);

CREATE TABLE stat (
	stat_id serial,
	appearances int NULL,
	goals int NOT NULL,
	goals_conceded int NULL,
	assists int NULL,
	clean_sheets int NULL,
	yellow_cards int NULL,
	red_cards int NULL,
	wins int NOT NULL,
	draws int NOT NULL,
	losses int NOT NULL,
	trophies int NOT NULL,
	CONSTRAINT PK_stat PRIMARY KEY(stat_id)
);

CREATE TABLE club_player (
	club_id int NOT NULL,
	player_id int NOT NULL,
	CONSTRAINT PK_club_player PRIMARY KEY(club_id, player_id),
	CONSTRAINT FK_club_player_club FOREIGN KEY(club_id) REFERENCES club(club_id),
	CONSTRAINT FK_club_player_player FOREIGN KEY(player_id) REFERENCES player(player_id)
);

CREATE TABLE club_manager (
	club_id int NOT NULL,
	manager_id int NOT NULL,
	CONSTRAINT PK_club_manager PRIMARY KEY(club_id, manager_id),
	CONSTRAINT FK_club_manager_club FOREIGN KEY(club_id) REFERENCES club(club_id),
	CONSTRAINT FK_club_manager_manager FOREIGN KEY(manager_id) REFERENCES manager(manager_id)
);

CREATE TABLE stat_player (
	stat_id int NOT NULL,
	player_id int NOT NULL,
	CONSTRAINT PK_stat_player PRIMARY KEY(stat_id, player_id),
	CONSTRAINT FK_stat_player_stat FOREIGN KEY(stat_id) REFERENCES stat(stat_id),
	CONSTRAINT FK_stat_player_player FOREIGN KEY(player_id) REFERENCES player(player_id)
);

CREATE TABLE stat_club (
	stat_id int NOT NULL,
	club_id int NOT NULL,
	CONSTRAINT PK_stat_club PRIMARY KEY(stat_id, club_id),
	CONSTRAINT FK_stat_club_stat FOREIGN KEY(stat_id) REFERENCES stat(stat_id),
	CONSTRAINT FK_stat_club_club FOREIGN KEY(club_id) REFERENCES club(club_id)
);

CREATE TABLE stat_manager (
	stat_id int NOT NULL,
	manager_id int NOT NULL,
	CONSTRAINT PK_stat_manager PRIMARY KEY(stat_id, manager_id),
	CONSTRAINT FK_stat_manager_stat FOREIGN KEY(stat_id) REFERENCES stat(stat_id),
	CONSTRAINT FK_stat_manager_manager FOREIGN KEY(manager_id) REFERENCES manager(manager_id)
);

INSERT INTO club(club_name, founded, location, stadium, squad_size, mv_euros, euro_comp, website)
VALUES('Arsenal FC', NULL, 'London', 'Emirates Stadium', 42, 1000000000, true, 'https://www.arsenal.com'),
('Aston Villa FC', NULL, 'Birmingham', 'Villa Park', 43, 541600000, false, 'https://www.avfc.co.uk'),
('AFC Bournemouth', NULL, 'Bournemouth', 'Dean Court', 47, 287200000, false, 'https://www.afcb.co.uk'),
('Brentford FC', NULL, 'London', 'Brentford Community Stadium', 36, 371200000, false, 'https://www.brentfordfc.com'),
('Brighton & Hove Albion FC', NULL, 'Falmer', 'AMEX Stadium', 42, 529830000, false, 'https://www.brightonandhovealbion.com'),
('Chelsea FC', '1905-03-10', 'London', 'Stamford Bridge', 43, 994950000, true, 'https://www.chelseafc.com'),
('Crystal Palace FC', NULL, 'London', 'Selhurst Park', 39, 323050000, false, 'https://www.cpfc.co.uk'),
('Everton FC', NULL, 'Liverpool', 'Goodison Park', 40, 413150000, false, 'https://www.evertonfc.com'),
('Fulham FC', NULL, 'London', 'Craven Cottage', 47, 295250000, false, 'https://www.fulhamfc.com'),
('Leeds United FC', NULL, 'Leeds', 'Elland Road', 47, 345150000, false, 'https://www.leedsunited.com'),
('Leicester City FC', NULL, 'Leicester', 'King Power Stadium', 38, 490800000, false, 'https://www.lcfc.com'),
('Liverpool FC', '1892-06-03', 'Liverpool', 'Anfield', 39, 811850000, true, 'https://www.liverpoolfc.com'),
('Manchester City FC', NULL, 'Manchester', 'Etihad Stadium', 34, 1150000000, true, 'https://www.mancity.com'),
('Manchester United FC', NULL, 'Manchester', 'Old Trafford', 48, 848000000, true, 'https://www.manutd.com'),
('Newcastle United FC', '1892-12-09', 'Newcastle', 'St James" Park', 38, 541600000, false, 'https://www.nufc.co.uk'),
('Nottingham Forest FC', NULL, 'West Bridgford', 'City Ground', 50, 376250000, false, 'https://www.nottinghamforest.co.uk'),
('Southampton FC', '1885-11-21', 'Southampton', 'St Mary"s Stadium', 46, 419950000, false, 'https://www.southamptonfc.com'),
('Tottenham Hotspur FC', '1882-09-05', 'London', 'Tottenham Hotspur Stadium', 34, 649100000, true, 'https://www.tottenhamhotspur.com'),
('West Ham United FC', '1895-06-29', 'London', 'London Stadium', 44, 465750000, true, 'https://www.whufc.com'),
('Wolverhampton Wanderers FC', NULL, 'Wolverhampton', 'Molineux Stadium', 43, 497650000, false, 'https://www.wolves.co.uk');

INSERT INTO player(player_name, shirt_number, position, date_of_birth, mv_euros, height, nationality, capped)
VALUES('Aaron Ramsdale', '1', 'Goalkeeper', '1998-05-14', 40000000, 1.90, 'England', true),
('Matt Turner', '30', 'Goalkeeper', '1994-06-24', 8000000, 1.91, 'United States', true),
('Karl Hein', NULL, 'Goalkeeper', '2002-04-13', 1500000, 1.93, 'Estonia', true),
('James Hilson', NULL, 'Goalkeeper', '2001-01-14', NULL, NULL, 'England', false),
('William Saliba', '12', 'Center Back', '2001-03-24', 65000000, 1.92, 'France', true),
('Gabriel Magalhaes', '6', 'Center Back', '1997-12-19', 55000000, 1.90, 'Brazil', true),
('Jakub Kiwior', '15', 'Center Back', '2000-02-15', 25000000, 1.89, 'Poland', true),
('Auston Trusty', NULL, 'Center Back', '1998-08-12', 10000000, 1.90, 'United States', true),
('Rob Holding', '16', 'Center Back', '1995-09-20', 8000000, 1.89, 'England', false),
('Reuell Walters', NULL, 'Center Back', '2004-12-16', NULL, 1.83, 'England', false),
('Oleksandr Zinchenko', '35', 'Left Back', '1996-12-15', 42000000, 1.75, 'Ukraine', true),
('Kieran Tierney', '3', 'Left Back', '1997-06-05', 25000000, 1.80, 'Scotland', true),
('Lino Sousa', NULL, 'Left Back', '2005-01-19', 500000, 1.85, 'England', false),
('Ben White', '4', 'Right Back', '1997-10-08', 55000000, 1.86, 'England', true),
('Takehiro Tomiyasu', '18', 'Right Back', '1998-11-05', 25000000, 1.88, 'Japan', true),
(N'Cédric Soares', '17', 'Right Back', '1991-08-31', 3000000, 1.71, 'Portugal', true),
('Thomas Partey', '5', 'Defensive Midfield', '1993-06-13', 35000000, 1.85m, 'Ghana', true),
('Jorginho', '20', 'Defensive Midfield', '1991-12-20', 25000000, 1.78, 'Italy', true),
('Granit Xhaka', '34', 'Defensive Midfield', '1992-09-27', 20000000, 1.86, 'Switzerland', true),
('Mohamed Elneny', '25', 'Defensive Midfield', '1992-07-11', 6000000, 1.79, 'Egypt', true),
('Bradley Ibrahim', NULL, 'Defensive Midfield', '2004-10-21', 400000, NULL, 'England', false),
('Albert Sambi Lokonga', '23', 'Central Midfield', '1999-10-22', 15000000, 1.83, 'Belgium', true),
('Ainsley Maitland-Niles', '3', 'Central Midfield', '1997-08-29', 8000000, 1.80, 'England', true),
('Matt Smith', NULL, 'Central Midfield', '2000-10-05', 350000, 1.76, 'England', false),
('Catalin Cirjan', NULL, 'Central Midfield', '2002-12-01', 250000, NULL, 'Romania', false),
('Mauro Bandeira', NULL, 'Central Midfield', '2003-11-18', NULL, 1.78, 'Portugal', false),
(N'Martin Ødegaard', '8', 'Attacking Midfield', '1998-12-17', 90000000, 1.78, 'Norway', true),
('Emile Smith Rowe', '10', 'Attacking Midfield', '2000-07-28', 35000000, 1.82, 'England', true),
(N'Fábio Vieira', '21', 'Attacking Midfield', '2000-05-30', 25000000, 1.70, 'Portugal', false),
('Ethan Nwaneri', NULL, 'Attacking Midfield', '2007-03-21', NULL, 1.65, 'England', false),
('Gabriel Martinelli', '11', 'Left Winger', '2001-06-18', 80000000, 1.78, 'Brazil', true),
('Leandro Trossard', '19', 'Left Winger', '1994-12-04', 35000000, 1.72, 'Belgium', true),
('Charles Sagoe Jr', NULL, 'Left Winger', '2004-07-24', NULL, NULL, 'England', false),
('Bukayo Saka', '7', 'Right Winger', '2001-09-05', 120000000, 1.78, 'England', true),
('Marquinhos', '27', 'Right Winger', '2003-04-07', 12000000, 1.75, 'Brazil', false),
('Reiss Nelson', '24', 'Right Winger', '1999-12-10', 12000000, 1.75, 'England', false),
('Amario Cozier-Duberry', NULL, 'Right Winger', '2005-05-29', 300000, NULL, 'England', false)
('Gabriel Jesus', '9', 'Center Forward', '1997-04-03', 75000000, 1.75, 'Brazil', true)
('Eddie Nketiah', '14', 'Center Forward', '1999-05-30', 25000000, 1.75, 'England', false)
('Khayon Edwards', NULL, 'Center Forward', '2003-09-12', 300000, 1.80, 'England', false)
('Nathan Butler-Oyedeji', NULL, 'Center Forward', '2003-01-04', 100000, 1.77, 'England', false);

INSERT INTO manager(manager_name, date_of_birth, nationality)
VALUES();


INSERT INTO stat(appearances, goals, goals_conceded, assists, clean_sheets, yellow_cards, red_cards, wins, draws, losses, trophies)
VALUES(38, 88, 43, NULL, 14, 52, 0, )
(38, 0, 0, 0, 14, 1, 0, 26, 6, 6, 0)
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);



INSERT INTO stat_player(stat_id, player_id)
VALUES();



INSERT INTO stat_club(stat_id, club_id)
VALUES();


INSERT INTO stat_manager(stat_id, manager_id)
VALUES();

COMMIT;