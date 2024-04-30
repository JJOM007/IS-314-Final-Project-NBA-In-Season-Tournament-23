---Database Schema with SQL
---This section shows the SQL used to create the database and tables. You may include part of DML that was used to populate the tables with data. You can make the data up for your database. 
CREATE TABLE Game
(GID CHAR NOT NULL,
  Game_Date DATE NOT NULL,
  HomeTeam VARCHAR (25) NOT NULL,
  AwayTeam VARCHAR (25) NOT NULL,
  NoOfTicketsSold INT NOT NULL,
  HomeTeamScore INT NOT NULL,
  AwayTeamScore INT NOT NULL,
  PRIMARY KEY (GID));

CREATE TABLE Advertiser
(
  AdvertID CHAR NOT NULL,
  AdvertName VARCHAR (25) NOT NULL,
  PRIMARY KEY (AdvertID)
);

CREATE TABLE Team
(
  TeamID CHAR NOT NULL,
  TeamName  VARCHAR (25) NOT NULL,
  MatchesWon INT NOT NULL,
  MatchesLost INT NOT NULL,
  PRIMARY KEY (TeamID)
);

CREATE TABLE Player
(
  PID CHAR NOT NULL,
  PlayerTeam VARCHAR (25) NOT NULL,
  PostionPlayed VARCHAR (25) NOT NULL,
  Players_FirstName VARCHAR (25) NOT NULL,
  Players_LastName VARCHAR (25) NOT NULL,
  ReboundsGained INT,
  PointsScored INT,
  AssistsGiven INT,
  BlocksMade INT,
  StealsMade INT,
  TurnoversMade INT,
  ThreepointersMade INT,
  FreethrowsMade INT,
  Age INT NOT NULL,
  Height VARCHAR (25) NOT NULL,
  Weight VARCHAR (25) NOT NULL,
  Country VARCHAR (25) NOT NULL,
  MinutesPlayed INT NOT NULL,
  TeamID CHAR NOT NULL,
  PRIMARY KEY (PID),
  FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Coach
(
  CID CHAR NOT NULL,
  CoachTeam VARCHAR (25) NOT NULL,
  Coach_FirstName VARCHAR (25) NOT NULL,
  Coach_LastName VARCHAR (25) NOT NULL,
  PRIMARY KEY (CID)
);

CREATE TABLE Referee
(
  RID CHAR NOT NULL,
  Referee_FirstName VARCHAR (25) NOT NULL,
  Referee_LastName VARCHAR (25) NOT NULL,
  PRIMARY KEY (RID)
);

CREATE TABLE Agent
(
  AID CHAR NOT NULL,
  Agent_FirstName VARCHAR (25) NOT NULL,
  Agent_LastName VARCHAR (25) NOT NULL,
  PRIMARY KEY (AID)
);

CREATE TABLE Arena
(
  ArenaID CHAR NOT NULL,
  ArenaName VARCHAR (25) NOT NULL,
  ArenaLocation VARCHAR (25) NOT NULL,
  PRIMARY KEY (ArenaID)
);

CREATE TABLE Groupz
(
  GroupID CHAR NOT NULL,
  GroupName VARCHAR (25) NOT NULL,
  TeamName VARCHAR (25) NOT NULL,
  PRIMARY KEY (GroupID)
);

CREATE TABLE Is_Promoted
(
  GID CHAR NOT NULL,
  AdvertID CHAR NOT NULL,
  PRIMARY KEY (GID, AdvertID),
  FOREIGN KEY (GID) REFERENCES Game_(GID),
  FOREIGN KEY (AdvertID) REFERENCES Advertiser(AdvertID)
);

CREATE TABLE Is_Managed_By
(
  styear INT NOT NULL,
  endyear INT NOT NULL,
  CID CHAR NOT NULL,
  TeamID CHAR NOT NULL,
  PRIMARY KEY (CID, TeamID),
  FOREIGN KEY (CID) REFERENCES Coach(CID),
  FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Is_Officiated_By
(
  GID CHAR NOT NULL,
  RID CHAR NOT NULL,
  PRIMARY KEY (GID, RID),
  FOREIGN KEY (GID) REFERENCES Game_(GID),
  FOREIGN KEY (RID) REFERENCES Referee(RID)
);

CREATE TABLE Is_Played_In
(
  ArenaID CHAR NOT NULL,
  GID CHAR NOT NULL,
  PRIMARY KEY (ArenaID, GID),
  FOREIGN KEY (ArenaID) REFERENCES Arena(ArenaID),
  FOREIGN KEY (GID) REFERENCES Game_(GID)
);

CREATE TABLE Is_Apart_Of
(
  Year INT NOT NULL,
  TeamID CHAR NOT NULL,
  GroupID CHAR NOT NULL,
  PRIMARY KEY (TeamID, GroupID),
  FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
  FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
);

CREATE TABLE Competes_In
(
  GID CHAR NOT NULL,
  TeamID CHAR NOT NULL,
  PRIMARY KEY (GID, TeamID),
  FOREIGN KEY (GID) REFERENCES Game_(GID),
  FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Scores
(
  Points INT NOT NULL,
  PID CHAR NOT NULL,
  GID CHAR NOT NULL,
  PRIMARY KEY (PID, GID),
  FOREIGN KEY (PID) REFERENCES Player(PID),
  FOREIGN KEY (GID) REFERENCES Game_(GID)
);

CREATE TABLE Ticket
(
  TID CHAR NOT NULL,
  TicketPrice INT NOT NULL,
  SeatType VARCHAR (25) NOT NULL,
  MethodOfPayment VARCHAR (25) NOT NULL,
  GID CHAR NOT NULL,
  AID CHAR,
  PRIMARY KEY (TID),
  FOREIGN KEY (GID) REFERENCES Game(GID),
  FOREIGN KEY (AID) REFERENCES Agent(AID));
Some Sample Data
INSERT INTO Arena VALUES ("A1",	"FedExForum",	"191 Beale St, Memphis, TN");
INSERT INTO Arena VALUES ("A2",	"Footprint Center",	 "201 E Jefferson St, Phoenix, AZ");			
INSERT INTO Arena VALUES ("A3",	"Crypto.com Arena",	"1111 S Figueroa St, Los Angeles, CA");		
INSERT INTO Arena VALUES ("A4",	"Delta Center",	"301 S Temple, Salt Lake City, UT");	
INSERT INTO Arena VALUES ("A5"	,"Moda Center",	"1 N Center Ct St, Portland, OR");		
INSERT INTO Arena VALUES ("A6",	"Ball Arena",	 "1000 Chopper Cir, Denver, CO");		
INSERT INTO Arena VALUES ("A7"	,"Crypto.com Arena",	"1111 S Figueroa St, Los Angeles, CA");			
INSERT INTO Arena VALUES ("A8",	"Smoothie King Center",	"1501 Dave Dixon Dr, New Orleans, LA");			
INSERT INTO Arena VALUES ("A9",	"American Airlines Center",	"2500 Victory Ave, Dallas, TX");			
INSERT INTO Arena VALUES ("A10",	"Toyota Center",	"1510 Polk St, Houston, TX");
INSERT INTO Arena VALUES ("A11",	"Wells Fargo Center",	 "3601 S Broad St, Philadelphia, PA");			
INSERT INTO Arena VALUES ("A12"	,"Rocket Mortgage FieldHouse",	 "1 Center Court, Cleveland, OH");			
INSERT INTO Arena VALUES ("A13"	,"State Farm Arena",	"1 State Farm Dr, Atlanta, GA");			
INSERT INTO Arena VALUES ("A14"	,"Gainbridge Fieldhouse",	"125 S Pennsylvania St, Indianapolis, IN");			
INSERT INTO Arena VALUES ("A15"	,"Little Caesars Arena"	,"2645 Woodward Ave, Detroit, MI");	
INSERT INTO Arena VALUES ("A16"	,"Fiserv Forum",	"1111 Vel R. Phillips Ave, Milwaukee, WI");			
INSERT INTO Arena VALUES ("A17"	,"Madison Square Garden",	 "4 Pennsylvania Plaza, New York, NY");		
INSERT INTO Arena VALUES ("A18"	,"Capital One Arena",	"601 F St NW, Washington, DC");		
INSERT INTO Arena VALUES ("A19"	,"Kaseya Center",	 "601 Biscayne Blvd, Miami, FL");	
INSERT INTO Arena VALUES ("A20",	"Spectrum Center",	" 333 E Trade St, Charlotte, NC"); 			
INSERT INTO Arena VALUES ("A21"	,"Golden 1 Center",	"500 David J Stern Walk, Sacramento, CA");			
INSERT INTO Arena VALUES ("A22"	,"Chase Center",	"1 Warriors Way, San Francisco, CA");		
INSERT INTO Arena VALUES ("A23"	,"Target Center",	"600 N 1st Ave, Minneapolis, MN");		
INSERT INTO Arena VALUES ("A24",	"Paycom Center",	"100 W Reno Ave, Oklahoma City, OK");			
INSERT INTO Arena VALUES ("A25",	"Frost Bank Center",	"1 AT&T Center Parkway, San Antonio, TX");			
INSERT INTO Arena VALUES ("A26",	"TD Garden", "100 Legends Way, Boston, MA");
INSERT INTO Arena VALUES ("A27",	"Barclays Center"	,"620 Atlantic Ave, Brooklyn, NY");			
INSERT INTO Arena VALUES ("A28",	"Scotiabank Arena",	"40 Bay St., Toronto, ON M5J 2X2, Canada");			
INSERT INTO Arena VALUES ("A29",	"United Center",	"1901 W Madison St, Chicago, IL");			
INSERT INTO Arena VALUES ("A30",	"Amway Center",	"400 W Church St, Orlando, FL");
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Advertiser  VALUES ("AD1","State Farm");		
INSERT INTO Advertiser  VALUES ("AD2","Pepsico");	
INSERT INTO Advertiser  VALUES ("AD3","Kia Motors");		
INSERT INTO Advertiser  VALUES ("AD4","Adidas");		
INSERT INTO Advertiser  VALUES ("AD5","Sony");			
INSERT INTO Advertiser  VALUES ("AD6","Apple");			
INSERT INTO Advertiser  VALUES ("AD7","DraftKings");			
INSERT INTO Advertiser  VALUES ("AD8","Papa Johns");
INSERT INTO Advertiser  VALUES ("AD9","Chase Bank");			
INSERT INTO Advertiser  VALUES ("AD10","Nike");	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Referee  VALUES ("R1","Ray", "Acosta");		
INSERT INTO Referee  VALUES ("R2","Brandon", "Adair");	
INSERT INTO Referee  VALUES ("R3","Bennie", "Adams");		
INSERT INTO Referee  VALUES ("R4","Brent", "Barnaky");		
INSERT INTO Referee  VALUES ("R5","Curtis", "Blair");				
INSERT INTO Referee  VALUES ("R6","Matt", "Blond");				
INSERT INTO Referee  VALUES ("R7","Tony", "Brothers");			
INSERT INTO Referee  VALUES ("R8","Nick", "Buch");	
INSERT INTO Referee  VALUES ("R9","John", "Batts");			
INSERT INTO Referee  VALUES ("R10","RJ", "Capes");	
INSERT INTO Referee  VALUES ("R11","Derrick", "Collins");	
INSERT INTO Referee  VALUES ("R12","Kevin", "Cut");	
INSERT INTO Referee  VALUES ("R13","Mousa", "Dagher");	
INSERT INTO Referee  VALUES ("R14","Eric", "Dales");	
INSERT INTO Referee  VALUES ("R15","Marc", "Davis");	
INSERT INTO Referee  VALUES ("R16","JB", "Derosen");	
INSERT INTO Referee  VALUES ("R17","Mitchell", "Ervin");	
INSERT INTO Referee  VALUES ("R18","Che", "Flores");	
INSERT INTO Referee  VALUES ("R19","Scott", "Foster");	
INSERT INTO Referee  VALUES ("R20","Ashely", "Moyer-Gleich");	
		

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#GID	Game_Date	HomeTeam	AwayTeam	NoOfTicketsSold	HomeTeamScore	AwayTeamScore	
INSERT INTO Game_ VALUES ("GA1","2023-11-03",	"Indiana Pacers",	"Cleveland Cavaliers", "10000","121","116");
INSERT INTO Game_ VALUES ("GA2","2023-11-03",	"Milwaukee Bucks",	"New York Knicks", "12000","110","105");
INSERT INTO Game_ VALUES ("GA3","2023-11-03",	"Oklahoma City Thunders",	"Golden State Warriors", "20000","139","141");
INSERT INTO Game_ VALUES ("GA4","2023-11-03",	"Chicago Bulls","Brooklyn Nets", "15000","107","109");
INSERT INTO Game_ VALUES ("GA5","2023-11-03",	"Portland Trail Blazers","Memphis Grizzlies", "15000","115","113");
INSERT INTO Game_ VALUES ("GA6","2023-11-03",	"Denver Nuggets","Dallas Mavericks", "12000","125","114");
INSERT INTO Game_ VALUES ("GA7","2023-11-03",	"Detroit Pistons","Philadelphia 76ers", "14000","106","114");
INSERT INTO Game_ VALUES ("GB1","2023-11-10",	"Detroit Pistons","Philadelphia 76ers", "12000","106","114");
INSERT INTO Game_ VALUES ("GB2","2023-11-10",	"Washington Wizards","Charlotte Hornets", "12000","117","124");
INSERT INTO Game_ VALUES ("GB3","2023-11-10",	"Boston Celtics","Brooklyn Nets", "12000","121","107");
INSERT INTO Game_ VALUES ("GB4","2023-11-10",	"Houston Rockets","New Orleans Pelicans", "12000","104","101");
INSERT INTO Game_ VALUES ("GB5","2023-11-10",	"San Antonio Spurs", "Minnesota Timberwolves", "13000","110","117");
INSERT INTO Game_ VALUES ("GB6","2023-11-10",	"Memphis Grizzlies","Utah Jazz", "12000","121","127");
INSERT INTO Game_ VALUES ("GB7","2023-11-10",	"Dallas Mavericks","Los Angeles Clippers", "12000","144","126");
INSERT INTO Game_ VALUES ("GB8","2023-11-10",	"Sacramento Kings","Oklahoma City Thunders", "12000","105","98");
INSERT INTO Game_ VALUES ("GB9","2023-11-10",	"Phoenix Suns","Los Angeles Lakers", "14000","119","122");
INSERT INTO Game_ VALUES ("GC1","2023-11-14",	"Detroit Pistons",	"Atlanta Hawks", "13000","120","126");
INSERT INTO Game_ VALUES ("GC2","2023-11-14",	"Charlotte Hornets","Miami Heat", "12000","105","111");
INSERT INTO Game_ VALUES ("GC3","2023-11-14",	"Philadelphia 76ers","Indiana Pacers", "13000","126","132");
INSERT INTO Game_ VALUES ("GC4","2023-11-14",	"Oklahoma City Thunders","San Antonio Spurs", "13000","123","87");
INSERT INTO Game_ VALUES ("GC5","2023-11-14",	"Brooklyn Nets","Orlando Magic", "13000","124","104");
INSERT INTO Game_ VALUES ("GC6","2023-11-14",	"New Orleans Pelicans","Dallas Mavericks", "15000","131","110");
INSERT INTO Game_ VALUES ("GC7","2023-11-14",	"Utah Jazz","Portland Trail Blazers", "10000","115","99");
INSERT INTO Game_ VALUES ("GC8","2023-11-14",	"Minnesota Timberwolves", "Golden State Warriors", "13000","104","101");
INSERT INTO Game_ VALUES ("GC9","2023-11-14",	"Denver Nuggets", "Los Angeles Clippers", "12000","111","108");
INSERT INTO Game_ VALUES ("GC10","2023-11-14",	"Los Angeles Lakers", "Memphis Grizzlies", "14000","134","107");
INSERT INTO Game_ VALUES ("GD1","2023-11-17",	"Charlotte Hornets","Milwaukee Bucks", "14000","99","130");
INSERT INTO Game_ VALUES ("GD2","2023-11-17",	"Washington Wizards","New York Knicks", "12000","99","120");
INSERT INTO Game_ VALUES ("GD3","2023-11-17",	"San Antonio Spurs","Sacramento Kings", "14000","120","129");
INSERT INTO Game_ VALUES ("GD4","2023-11-17",	"Atlanta Hawks", "Philadelphia 76ers", "13000","116","126");
INSERT INTO Game_ VALUES ("GD5","2023-11-17",	"Boston Celtics","Toronto Raptors", "12000","105","108");
INSERT INTO Game_ VALUES ("GD6","2023-11-17",	"Cleveland Cavaliers", "Detroit Pistons", "12000","108","100");
INSERT INTO Game_ VALUES ("GD7","2023-11-17",	"New Orleans Pelicans","Denver Nuggets", "11000","115","100");
INSERT INTO Game_ VALUES ("GD8","2023-11-17",	"Chicago Bulls","Orlando Magic", "12000","99","120");
INSERT INTO Game_ VALUES ("GD9","2023-11-17",	"Portland Trail Blazers","Los Angeles Lakers", "12000","99","120");
INSERT INTO Game_ VALUES ("GD10","2023-11-17",	"Utah Jazz", "Phoenix Suns", "14000","95","122");
INSERT INTO Game_ VALUES ("GD11","2023-11-17",	"Los Angeles Clippers","Houston Rockets", "15000","106","100");
INSERT INTO Game_ VALUES ("GE1","2023-11-17",	"Orlando Magic","Toronto Raptors", "14000","126","107");
INSERT INTO Game_ VALUES ("GE2","2023-11-17",	"Philadelphia 76ers","Cleveland Cavaliers", "14000","120","122");
INSERT INTO Game_ VALUES ("GE3","2023-11-17",	"Atlanta Hawks","Indiana Pacers", "14000","152","157");
INSERT INTO Game_ VALUES ("GE4","2023-11-17",	"Phoenix Suns","Portland Trail Blazers", "14000","120","157");
INSERT INTO Game_ VALUES ("GE5","2023-11-17",	"Los Angeles Lakers","Utah Jazz", "14000","141","99");
INSERT INTO Game_ VALUES ("GF1","2023-11-24",	"Orlando Magic","Boston Celtics", "14000","113","96");
INSERT INTO Game_ VALUES ("GF2","2023-11-24",	"Memphis Grizzlies","Phoenix Suns", "14000","89","110");
INSERT INTO Game_ VALUES ("GF3","2023-11-24",	"New York Knicks", "Miami Heat", "14000","100","96");
INSERT INTO Game_ VALUES ("GF4","2023-11-24",	"Toronto Raptors","Chicago Bulls", "14000","121","108");
INSERT INTO Game_ VALUES ("GF5","2023-11-24",	"Minnesota Timberwolves","Sacramento Kings", "14000","111","124");
INSERT INTO Game_ VALUES ("GF6","2023-11-24",	"Houston Rockets","Denver Nuggets", "14000","105","96");
INSERT INTO Game_ VALUES ("GF7","2023-11-24",	"Milwaukee Bucks","Washington Wizards", "14000","131","128");
INSERT INTO Game_ VALUES ("GF8","2023-11-24",	"Indiana Pacers","Detroit Pistons", "14000","136","113");
INSERT INTO Game_ VALUES ("GF9","2023-11-24",	"Golden State Warriors","San Antonio Spurs", "14000","118","112");
INSERT INTO Game_ VALUES ("GF10","2023-11-24",	"Los Angeles Clippers", "New Orleans Pelicans", "14000","106","116");
INSERT INTO Game_ VALUES ("GG1","2023-11-28",	"Miami Heat","Milwaukee Bucks", "16000","124","141");
INSERT INTO Game_ VALUES ("GG2","2023-11-28",	"Cleveland Cavaliers","Atlanta Hawks", "13000","128","105");
INSERT INTO Game_ VALUES ("GG3","2023-11-28",	"Brooklyn Nets", "Toronto Raptors", "14000","115","103");
INSERT INTO Game_ VALUES ("GG4","2023-11-28",	"Boston Celtics","Chicago Bulls", "14000","97","124");
INSERT INTO Game_ VALUES ("GG5","2023-11-28",	"New York Knicks", "Charlotte Hornets", "15000","115","91");
INSERT INTO Game_ VALUES ("GG6","2023-11-28",	"Minnesota Timberwolves", "Oklahoma City Thunders", "14000","106","103");
INSERT INTO Game_ VALUES ("GG7","2023-11-28",	"Dallas Mavericks", "Houston Rockets", "17000","121","115");
INSERT INTO Game_ VALUES ("GG8","2023-11-28",	"Sacramento Kings","Golden State Warriors", "17000","124","123");
---------------------------------------------------------------------------------------------------------------------------------------------------------------
#	TeamID	TeamName	MatchesWon	MatchesLost	
INSERT INTO Team VALUES ("T1","Memphis Grizzlies","0","4");
INSERT INTO Team VALUES ("T2","Phoenix Suns
","3","1");
INSERT INTO Team VALUES ("T3","Los Angeles Lakers","4","0");
INSERT INTO Team VALUES ("T4","Utah Jazz
","2","2");
INSERT INTO Team VALUES ("T5","Portland Trail Blazers
","1","3");
INSERT INTO Team VALUES ("T6","Denver Nuggets
","2","2");
INSERT INTO Team VALUES ("T7","Los Angeles Clippers
","1","3");
INSERT INTO Team VALUES ("T8","New Orleans Pelicans
","3","1");
INSERT INTO Team VALUES ("T9","Dallas Mavericks
","2","2");
INSERT INTO Team VALUES ("T10","Houston Rockets
","2","2");
INSERT INTO Team VALUES ("T11","Philadelphia 76ers
","2","2");
INSERT INTO Team VALUES ("T12","Cleveland Cavaliers
","3","1");
INSERT INTO Team VALUES ("T13","Atlanta Hawks
s","1","3");
INSERT INTO Team VALUES ("T14","Indiana Pacers
","4","0");
INSERT INTO Team VALUES ("T15","Detroit Pistons
","0","4");
INSERT INTO Team VALUES ("T16","Milwaukee Bucks
","4","0");
INSERT INTO Team VALUES ("T17","New York Knicks
","3","1");
INSERT INTO Team VALUES ("T18","Washington Wizards
","0","4");
INSERT INTO Team VALUES ("T19","Miami Heat
","2","2");
INSERT INTO Team VALUES ("T20","Charlotte Hornets
","1","3");
INSERT INTO Team VALUES ("T21","Sacramento Kings
","4","0");
INSERT INTO Team VALUES ("T22","Golden State Warriors
","2","2");
INSERT INTO Team VALUES ("T23","Minnesota Timberwolves 
","3","1");
INSERT INTO Team VALUES ("T24","Oklahoma City Thunders
","2","2");
INSERT INTO Team VALUES ("T25","San Antonio Spurs
","0","4");
INSERT INTO Team VALUES ("T26","Boston Celtics
","3","1");
INSERT INTO Team VALUES ("T27","Brooklyn Nets
","3","1");
INSERT INTO Team VALUES ("T28","Toronto Raptors
","1","3");
INSERT INTO Team VALUES ("T29","Chicago Bulls
","0","4");
INSERT INTO Team VALUES ("T30","Orlando Magic
","3","1");

--------------------------------------------------------------------------------------------
INSERT INTO Agent VALUES ("AID1","Don","Richardson");
INSERT INTO Agent VALUES ("AID2","Don","callis");
INSERT INTO Agent VALUES ("AID3","Bob","Squarepantson");
INSERT INTO Agent VALUES ("AID4","Dave","Meltzer");
INSERT INTO Agent VALUES ("AID5","Eric","Daneils");
INSERT INTO Agent VALUES ("AID6","Gorge","Harper");
INSERT INTO Agent VALUES ("AID7","Victor","Von");
INSERT INTO Agent VALUES ("AID8","Viktor","Doom");
INSERT INTO Agent VALUES ("AID9","Cassius","Oneal");
INSERT INTO Agent VALUES ("AID10","Frank","West");
INSERT INTO Agent VALUES ("AD",	"Don","Richardson");
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Groupz VALUES ("GW1","West 1");
INSERT INTO Groupz VALUES ("GW2","West 2");
INSERT INTO Groupz VALUES ("GW3","West 3");
INSERT INTO Groupz VALUES ("GW4","West 4");
INSERT INTO Groupz VALUES ("GE1","East 1");
INSERT INTO Groupz VALUES ("GE2","East 2");
INSERT INTO Groupz VALUES ("GE3","East 3");
INSERT INTO Groupz VALUES ("GE4","East 4");
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Coach VALUES ("C1","Memphis Grizzlies","Taylor","Jenkins");
INSERT INTO Coach VALUES ("C2","Phoenix Suns
","Frank","Vogel");
INSERT INTO Coach VALUES ("C3", "Los Angeles Lakers",	"Darvin",	"Ham");
INSERT INTO Coach VALUES ("C4",	"Utah Jazz",	"Will" ,	"Hardy");
INSERT INTO Coach VALUES ("C5","Portland Trail Blazers",	"Chauncey",	"Billups");
INSERT INTO Coach VALUES ("C6",	"Denver Nuggets","Michael",	"Malone");
INSERT INTO Coach VALUES ("C7",	"Los Angeles Clippers",	"Tyronn", 	"Lou");
INSERT INTO Coach VALUES ("C8",	"New Orleans Pelicans",	"Willie",	"Green");
INSERT INTO Coach VALUES ("C9",	"Dallas Mavericks",	"Jason",	"Kidd");
INSERT INTO Coach VALUES ("C10",	"Houston Rockets",	"Ime",	"Udoka");
INSERT INTO Coach VALUES ("C11",	"Philadelphia 76ers","Nick","Nurse");
INSERT INTO Coach VALUES ("C12",	"Cleveland Cavaliers",	"J.B"	,"Bickerstaff");
INSERT INTO Coach VALUES ("C13",	"Atlanta Hawks",	"Quin",	"Snyder");
INSERT INTO Coach VALUES ("C14",	"Indiana Pacers",	"Rick",	"Carlisle");
INSERT INTO Coach VALUES ("C15",	"Detroit Pistons",	"Monty",	"Williams");
INSERT INTO Coach VALUES ("C16",	"Milwaukee Bucks",	"Adrian",	"Griffin");
INSERT INTO Coach VALUES ("C17",	"New York Knicks",	"Tom",	"Thibodeau");
INSERT INTO Coach VALUES ("C18",	"Washington Wizards",	"Wes",	"Unseld Jr");
INSERT INTO Coach VALUES ("C19",	"Miami Heat",	"Erik",	"Spoelstra");
INSERT INTO Coach VALUES ("C20",	"Charlotte Hornets",	"Steve",	"Clifford");
INSERT INTO Coach VALUES ("C21",	"Sacramento Kings",	"Mike",	"Brown");
INSERT INTO Coach VALUES ("C22",	"Golden State Warriors",	"Steve",	"Kerr");
INSERT INTO Coach VALUES ("C23",	"Minnesota Timberwolves", 	"Chris",	"Finch");
INSERT INTO Coach VALUES ("C24",	"Oklahoma City Thunders",	"Mark",	"Daigneault");
INSERT INTO Coach VALUES ("C25",	"San Antonio Spurs",	"Gregg",	"Popovich");
INSERT INTO Coach VALUES ("C26",	"Boston Celtics",	"Joe",	"Mazzulla");
INSERT INTO Coach VALUES ("C27",	"Brooklyn Nets",	"Jacque",	"Vaughn");
INSERT INTO Coach VALUES ("C28"	,"Toronto Raptors","Darko",	"Rajaković");
INSERT INTO Coach VALUES ("C29",	"Chicago Bulls",	"Billy",	"Donovan");
INSERT INTO Coach VALUES ("C30",	"Orlando Magic",	"Jamahl",	"Mosley");
---------------------------------------------------------------------------------------------------------------------
    
  INSERT INTO Player VALUES ("PA1", "Memphis Grizzlies", "F","Kenny", "Lofton Jr.", "20", "60", "24", "50", "23", "70", "12", "2", "21", "6'6","175lb","USA","20","T1");
INSERT INTO Player VALUES ("PA2", "Memphis Grizzlies", "G","Marcus", "Smart", "30", "40", "54", "78", "29", "40", "47", "8", "32", "6'2","205lb","USA","40","T1");
INSERT INTO Player VALUES ("PA3", "Memphis Grizzlies", "FG","Derick", "Rose", "40", "80", "44", "78", "90", "80", "40", "10", "34", "6'2","125lb","USA","40","T1");
INSERT INTO Player VALUES ("PA4", "Memphis Grizzlies", "F","Desmond", "Bane", "28", "60", "24", "50", "3", "40", "24", "20", "30", "6'3","200lb","USA","50","T1");
INSERT INTO Player VALUES ("PA5", "Memphis Grizzlies", "PG","GG", "Jackson", "25", "60", "44", "70", "21", "80", "32", "24", "15", "6'8","300lb","Barbados","25","T1");
INSERT INTO Player VALUES ("PA6", "Memphis Grizzlies", "GF","Luke", "Kennard", "50", "20", "40", "20", "50", "80", "90", "70", "27", "6'4","205lb","Spain","30","T1");
INSERT INTO Player VALUES ("PA7", "Memphis Grizzlies", "C","Santi", "Aldama", "40", "50", "47", "80", "11", "70", "12", "2", "25", "6'1","225lb","Mali","35","T1");
INSERT INTO Player VALUES ("PB1", "Phoenix Suns", "F","Bradely", "Beal", "40", "50", "64", "70", "63", "70", "94", "45", "35", "6'4","185lb","USA","40","T2");
INSERT INTO Player VALUES ("PB2", "Phoenix Suns", "PG","Devin", "Booker", "60", "100", "74", "80", "73", "80", "94", "45", "28", "6'4","185lb","USA","125","T2");
INSERT INTO Player VALUES ("PB3", "Phoenix Suns", "G","Kevin", "Durant", "40", "150", "64", "70", "63", "80", "94", "45", "36", "6'9","175lb","USA","120","T2");
INSERT INTO Player VALUES ("PB4", "Phoenix Suns", "C","Jusuf", "Nurkic", "20", "50", "24", "40", "63", "30", "24", "25", "26", "7'2","175lb","Serbia","120","T2");
INSERT INTO Player VALUES ("PB5", "Phoenix Suns", "GF","Nassir", "Little", "10", "10", "14", "10", "13", "70", "14", "15", "26", "6'4","185lb","USA","60","T2");
INSERT INTO Player VALUES ("PB6", "Phoenix Suns", "FG","Eric", "Gordon", "5", "25", "14", "10", "13", "10", "14", "15", "23", "6'4","175lb","USA","60","T2");
INSERT INTO Player VALUES ("PB7", "Phoenix Suns", "C","Josh", "Okogie", "20", "10", "14", "30", "23", "80", "14", "25", "27", "6'4","175lb","Nigeria","50","T2");
INSERT INTO Player VALUES ("PC1", "Los Angeles Lakers", "F","Lebron", "James", "150", "60", "64", "70", "63", "70", "94", "45", "37", "6'7","225lb","USA","140","T3");
INSERT INTO Player VALUES ("PC2", "Los Angeles Lakers", "G","Rui", "Hachimura", "150", "60", "64", "70", "63", "70", "94", "45", "28", "6'4","235lb","Japan","140","T3");
INSERT INTO Player VALUES ("PC3", "Los Angeles Lakers", "FG","Jarred", "Vanderbilt", "40", "60", "64", "70", "63", "70", "94", "45", "27", "6'4","185lb","USA","140","T3");
INSERT INTO Player VALUES ("PC4", "Los Angeles Lakers", "GF","Austin", "Reeves", "150", "60", "64", "70", "63", "70", "94", "45", "27", "6'4","185lb","USA","140","T3");
INSERT INTO Player VALUES ("PC5", "Los Angeles Lakers", "F","Anthony", "Davis", "110", "60", "64", "70", "63", "70", "94", "45", "30", "6'8","200lb","USA","140","T3");
INSERT INTO Player VALUES ("PC6", "Los Angeles Lakers", "FG","Cam", "Reddish", "50", "60", "61", "40", "33", "20", "24", "48", "32", "6'4","185lb","USA","140","T3");
INSERT INTO Player VALUES ("PC7", "Los Angeles Lakers", "PG","D'angelo", "Russel", "60", "60", "64", "70", "33", "20", "24", "25", "27", "6'0","185lb","USA","100","T3");
INSERT INTO Player VALUES ("PD1", "Utah Jazz", "F","Collin", "Sexton", "40", "20", "10", "20", "10", "10", "10", "10", "24", "5'7","225lb","USA","100","T4");
INSERT INTO Player VALUES ("PD2", "Utah Jazz", "F","Kris", "Dunn", "40", "20", "10", "20", "10", "10", "10", "10", "20", "5'7","225lb","USA","100","T4");
INSERT INTO Player VALUES ("PD3", "Utah Jazz", "F","Kelly", "Ojenki", "40", "20", "10", "20", "10", "10", "10", "10", "20", "5'7","225lb","Canada","100","T4");
INSERT INTO Player VALUES ("PD4", "Utah Jazz", "F","Keyonte", "George", "40", "20", "10", "20", "10", "10", "10", "10", "20", "5'7","225lb","USA","100","T4");
INSERT INTO Player VALUES ("PD5", "Utah Jazz", "F","Dan", "Boy", "40", "20", "10", "20", "10", "10", "10", "10", "20", "5'7","225lb","USA","100","T4");
INSERT INTO Player VALUES ("PD6", "Utah Jazz", "F","Joe", "Bush", "40", "20", "10", "20", "10", "10", "10", "10", "20", "5'7","225lb","Mexico","100","T4");
INSERT INTO Player VALUES ("PD7", "Utah Jazz", "F","Jordan", "Clarkson", "40", "20", "10", "20", "10", "10", "10", "10", "20", "5'7","225lb","USA","100","T4");
INSERT INTO Player VALUES ("PE1", "Portland Trail Blazers", "G","Joe", "Smith", "40", "20", "10", "20", "10", "10", "10", "10", "24", "5'7","225lb","USA","100","T5");
INSERT INTO Player VALUES ("PE2", "Portland Trail Blazers", "G","Devonte", "Aldis", "40", "20", "10", "20", "10", "10", "10", "10", "24", "5'7","225lb","USA","100","T5");
INSERT INTO Player VALUES ("PE3", "Portland Trail Blazers", "G","Deontrey", "Miller", "40", "20", "10", "20", "10", "10", "10", "10", "24", "5'7","225lb","USA","100","T5");
INSERT INTO Player VALUES ("PE4", "Portland Trail Blazers", "G","Kirk", "Brothers", "40", "20", "10", "20", "10", "10", "10", "10", "24", "5'7","225lb","USA","100","T5");
INSERT INTO Player VALUES ("PE5", "Portland Trail Blazers", "G","Guy", "Mavins", "40", "20", "10", "20", "10", "10", "10", "10", "24", "5'7","225lb","USA","100","T5");
INSERT INTO Player VALUES ("PE6", "Portland Trail Blazers", "G","Jon", "Glass", "40", "20", "10", "20", "10", "10", "10", "10", "24", "5'7","225lb","USA","100","T5");
INSERT INTO Player VALUES ("PE7", "Portland Trail Blazers", "G","Tony", "Smith", "40", "20", "10", "20", "10", "10", "10", "10", "24", "5'7","225lb","USA","100","T5");
INSERT INTO Player VALUES ("PF1", "Denver Nuggets", "SF","Nikola", "Jokic", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T6");
INSERT INTO Player VALUES ("PF2", "Denver Nuggets", "SF","Micheal", "Porter", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T6");
INSERT INTO Player VALUES ("PF3", "Denver Nuggets", "SF","Jamal", "Murray", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T6");
INSERT INTO Player VALUES ("PF4", "Denver Nuggets", "SF","Santa", "A", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T6");
INSERT INTO Player VALUES ("PF5", "Denver Nuggets", "SF","Santa", "B", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T6");
INSERT INTO Player VALUES ("PF6", "Denver Nuggets", "SF","Santa", "G", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T6");
INSERT INTO Player VALUES ("PF7", "Denver Nuggets", "SF","Santa", "C", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T6");
INSERT INTO Player VALUES ("PG1", "Los Angeles Clippers", "SF","Santa", "D", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T7");
INSERT INTO Player VALUES ("PG2", "Los Angeles Clippers", "SF","Santa", "E", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T7");
INSERT INTO Player VALUES ("PG3", "Los Angeles Clippers", "SF","Santa", "F", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T7");
INSERT INTO Player VALUES ("PG4", "Los Angeles Clippers", "SF","Santa", "G", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T7");
INSERT INTO Player VALUES ("PG5", "Los Angeles Clippers", "SF","Santa", "H", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T7");
INSERT INTO Player VALUES ("PH1", "New Orleans Pelicans", "SF","Santa", "I", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T8");
INSERT INTO Player VALUES ("PH2", "New Orleans Pelicans", "SF","Santa", "J", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T8");
INSERT INTO Player VALUES ("PH3", "New Orleans Pelicans", "SF","Santa", "K", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T8");
INSERT INTO Player VALUES ("PH4", "New Orleans Pelicans", "SF","Santa", "L", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T8");
INSERT INTO Player VALUES ("PH5", "New Orleans Pelicans", "SF","Santa", "M", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T8");
INSERT INTO Player VALUES ("PI1", "Dallas Mavericks", "SF","Santa", "N", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T9");
INSERT INTO Player VALUES ("PI2", "Dallas Mavericks", "SF","Santa", "O", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T9");
INSERT INTO Player VALUES ("PI3", "Dallas Mavericks", "SF","Santa", "P", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T9");
INSERT INTO Player VALUES ("PI4", "Dallas Mavericks", "SF","Santa", "Q", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T9");
INSERT INTO Player VALUES ("PI5", "Dallas Mavericks", "SF","Santa", "R", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T9");
INSERT INTO Player VALUES ("PJ1", "Houston Rockets", "SF","Santa", "V", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T10");
INSERT INTO Player VALUES ("PJ2", "Houston Rockets", "SF","Santa", "W", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T10");
INSERT INTO Player VALUES ("PJ3", "Houston Rockets", "SF","Santa", "X", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T10");
INSERT INTO Player VALUES ("PJ4", "Houston Rockets", "SF","Santa", "Y", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T10");
INSERT INTO Player VALUES ("PJ5", "Houston Rockets", "SF","Santa", "Z", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T10");
INSERT INTO Player VALUES ("PK1", "Philadelphia 76ers", "SF","John", "A", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T11");
INSERT INTO Player VALUES ("PK2", "Philadelphia 76ers", "SF","John", "B", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T11");
INSERT INTO Player VALUES ("PK3", "Philadelphia 76ers", "SF","John", "C", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T11");
INSERT INTO Player VALUES ("PK4", "Philadelphia 76ers", "SF","John", "D", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T11");
INSERT INTO Player VALUES ("PK5", "Philadelphia 76ers", "SF","John", "E", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T11");
INSERT INTO Player VALUES ("PL1", "Cleveland Cavaliers", "SF","John", "F", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T12");
INSERT INTO Player VALUES ("PL2", "Cleveland Cavaliers", "SF","John", "G", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T12");
INSERT INTO Player VALUES ("PL3", "Cleveland Cavaliers", "SF","John", "H", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T12");
INSERT INTO Player VALUES ("PL4", "Cleveland Cavaliers", "SF","John", "I", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T12");
INSERT INTO Player VALUES ("PL5", "Cleveland Cavaliers", "SF","John", "J", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T12");
INSERT INTO Player VALUES ("PM1", "Atlanta Hawks", "SF","John", "K", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T13");
INSERT INTO Player VALUES ("PM2", "Atlanta Hawks", "SF","John", "L", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T13");
INSERT INTO Player VALUES ("PM3", "Atlanta Hawks", "SF","John", "M", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T13");
INSERT INTO Player VALUES ("PM4", "Atlanta Hawks", "SF","John", "N", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T13");
INSERT INTO Player VALUES ("PM5", "Atlanta Hawks", "SF","John", "O", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T13");
INSERT INTO Player VALUES ("PN1", "Indiana Pacers", "SF","John", "P", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T14");
INSERT INTO Player VALUES ("PN2", "Indiana Pacers", "SF","John", "Q", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T14");
INSERT INTO Player VALUES ("PN3", "Indiana Pacers", "SF","John", "R", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T14");
INSERT INTO Player VALUES ("PN4", "Indiana Pacers", "SF","John", "S", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T14");
INSERT INTO Player VALUES ("PN5", "Indiana Pacers", "SF","John", "T", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T14");
INSERT INTO Player VALUES ("PO1", "Detroit Pistons", "SF","John", "U", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T15");
INSERT INTO Player VALUES ("PO2", "Detroit Pistons", "SF","John", "V", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T15");
INSERT INTO Player VALUES ("PO3", "Detroit Pistons", "SF","John", "W", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T15");
INSERT INTO Player VALUES ("PO4", "Detroit Pistons", "SF","John", "X", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T15");
INSERT INTO Player VALUES ("PO5", "Detroit Pistons", "SF","John", "Y", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T15");
INSERT INTO Player VALUES ("PP1", "Milawaukee Bucks", "SF","Dave", "A", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T16");
INSERT INTO Player VALUES ("PP2", "Milawaukee Bucks", "SF","Dave", "B", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T16");
INSERT INTO Player VALUES ("PP3", "Milawaukee Bucks", "SF","Dave", "C", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T16");
INSERT INTO Player VALUES ("PP4", "Milawaukee Bucks", "SF","Dave", "D", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T16");
INSERT INTO Player VALUES ("PP5", "Milawaukee Bucks", "SF","Dave", "E", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T16");
INSERT INTO Player VALUES ("PQ1", "NYK", "SF","Dave", "F", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T17");
INSERT INTO Player VALUES ("PQ2", "NYK", "SF","Dave", "G", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T17");
INSERT INTO Player VALUES ("PQ3", "NYK", "SF","Dave", "H", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T17");
INSERT INTO Player VALUES ("PQ4", "NYK", "SF","Dave", "I", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T17");
INSERT INTO Player VALUES ("PQ5", "NYK", "SF","Dave", "J", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T17");
INSERT INTO Player VALUES ("PR1", "WW", "SF","Dave", "K", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T18");
INSERT INTO Player VALUES ("PR2", "WW", "SF","Dave", "L", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T18");
INSERT INTO Player VALUES ("PR3", "WW", "SF","Dave", "M", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T18");
INSERT INTO Player VALUES ("PR4", "WW", "SF","Dave", "N", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T18");
INSERT INTO Player VALUES ("PR5", "WW", "SF","Dave", "O", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T18");
INSERT INTO Player VALUES ("PS1", "MH", "SF","Dave", "P", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T19");
INSERT INTO Player VALUES ("PS2", "MH", "SF","Dave", "Q", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T19");
INSERT INTO Player VALUES ("PS3", "MH", "SF","Dave", "R", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T19");
INSERT INTO Player VALUES ("PS4", "MH", "SF","Dave", "S", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T19");
INSERT INTO Player VALUES ("PS5", "MH", "SF","Dave", "T", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T19");
INSERT INTO Player VALUES ("PT1", "CH", "SF","Dave", "U", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T20");
INSERT INTO Player VALUES ("PT2", "CH", "SF","Dave", "V", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T20");
INSERT INTO Player VALUES ("PT3", "CH", "SF","Dave", "W", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T20");
INSERT INTO Player VALUES ("PT4", "CH", "SF","Dave", "X", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T20");
INSERT INTO Player VALUES ("PT5", "CH", "SF","Dave", "Y", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T20");
INSERT INTO Player VALUES ("PU1", "SK", "SF","Alex", "A", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T21");
INSERT INTO Player VALUES ("PU2", "SK", "SF","Alex", "B", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T21");
INSERT INTO Player VALUES ("PU3", "SK", "SF","Alex", "C", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T21");
INSERT INTO Player VALUES ("PU4", "SK", "SF","Alex", "D", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T21");
INSERT INTO Player VALUES ("PU5", "SK", "SF","Alex", "E", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T21");
INSERT INTO Player VALUES ("PV1", "GSW", "SF","Alex", "F", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T22");
INSERT INTO Player VALUES ("PV2", "GSW", "SF","Alex", "G", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T22");
INSERT INTO Player VALUES ("PV3", "GSW", "SF","Alex", "H", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T22");
INSERT INTO Player VALUES ("PV4", "GSW", "SF","Alex", "I", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T22");
INSERT INTO Player VALUES ("PV5", "GSW", "SF","Alex", "J", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T22");
INSERT INTO Player VALUES ("PW1", "MT", "SF","Alex", "K", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T23");
INSERT INTO Player VALUES ("PW2", "MT", "SF","Alex", "L", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T23");
INSERT INTO Player VALUES ("PW3", "MT", "SF","Alex", "M", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T23");
INSERT INTO Player VALUES ("PW4", "MT", "SF","Alex", "N", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T23");
INSERT INTO Player VALUES ("PW5", "MT", "SF","Alex", "O", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T23");
INSERT INTO Player VALUES ("PX1", "OKC", "SF","Alex", "P", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T24");
INSERT INTO Player VALUES ("PX2", "OKC", "SF","Alex", "Q", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T24");
INSERT INTO Player VALUES ("PX3", "OKC", "SF","Alex", "R", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T24");
INSERT INTO Player VALUES ("PX4", "OKC", "SF","Alex", "S", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T24");
INSERT INTO Player VALUES ("PX5", "OKC", "SF","Alex", "T", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T24");
INSERT INTO Player VALUES ("PY1", "SAS", "SF","Alex", "U", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T25");
INSERT INTO Player VALUES ("PY2", "SAS", "SF","Alex", "V", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T25");
INSERT INTO Player VALUES ("PY3", "SAS", "SF","Alex", "W", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T25");
INSERT INTO Player VALUES ("PY4", "SAS", "SF","Alex", "X", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T25");
INSERT INTO Player VALUES ("PY5", "SAS", "SF","Alex", "Y", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T25");
INSERT INTO Player VALUES ("PZ1", "BC", "SF","Matt", "A", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T26");
INSERT INTO Player VALUES ("PZ2", "BC", "SF","Matt", "B", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T26");
INSERT INTO Player VALUES ("PZ3", "BC", "SF","Matt", "C", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T26");
INSERT INTO Player VALUES ("PZ4", "BC", "SF","Matt", "D", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T26");
INSERT INTO Player VALUES ("PZ5", "BC", "SF","Matt", "E", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T26");
INSERT INTO Player VALUES ("PAA1", "BN", "SF","Matt", "F", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T27");
INSERT INTO Player VALUES ("PAA2", "BN", "SF","Matt", "G", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T27");
INSERT INTO Player VALUES ("PAA3", "BN", "SF","Matt", "H", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T27");
INSERT INTO Player VALUES ("PAA4", "BN", "SF","Matt", "I", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T27");
INSERT INTO Player VALUES ("PAA5", "BN", "SF","Matt", "J", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T27");
INSERT INTO Player VALUES ("PAB1", "TR", "SF","Matt", "L", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T28");
INSERT INTO Player VALUES ("PAB2", "TR", "SF","Matt", "M", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T28");
INSERT INTO Player VALUES ("PAB3", "TR", "SF","Matt", "N", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T28");
INSERT INTO Player VALUES ("PAB4", "TR", "SF","Matt", "O", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T28");
INSERT INTO Player VALUES ("PAB5", "TR", "SF","Matt", "P", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T28");
INSERT INTO Player VALUES ("PAC1", "CB", "SF","Matt", "Q", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T29");
INSERT INTO Player VALUES ("PAC2", "CB", "SF","Matt", "R", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T29");
INSERT INTO Player VALUES ("PAC3", "CB", "SF","Matt", "S", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T29");
INSERT INTO Player VALUES ("PAC4", "CB", "SF","Matt", "T", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T29");
INSERT INTO Player VALUES ("PAC5", "CB", "SF","Matt", "U", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T29");
INSERT INTO Player VALUES ("PAD1", "OM", "SF","Matt", "V", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T30");
INSERT INTO Player VALUES ("PAD2", "OM", "SF","Matt", "W", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T30");
INSERT INTO Player VALUES ("PAD3", "OM", "SF","Matt", "X", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T30");
INSERT INTO Player VALUES ("PAD4", "OM", "SF","Matt", "Y", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T30");
INSERT INTO Player VALUES ("PAD5", "OM", "SF","Matt", "Z", "140", "20", "10", "20", "10", "10", "10", "100", "24", "5'7","225lb","USA","100","T30");
INSERT INTO Is_Promoted VALUES("GA1","AD2");
INSERT INTO Is_Promoted VALUES("GB3","AD1");
INSERT INTO Is_Promoted VALUES("GC4","AD7");
INSERT INTO Is_Promoted VALUES("GD6","AD4");
INSERT INTO Is_Promoted VALUES("GE5","AD10");
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Game_ VALUES ("GG1","2023-11-28",	"Miami Heat","Milwaukee Bucks", "16000","124","141");
INSERT INTO Game_ VALUES ("GG2","2023-11-28",	"Cleveland Cavaliers","Atlanta Hawks", "13000","128","105");
INSERT INTO Game_ VALUES ("GG3","2023-11-28",	"Brooklyn Nets", "Toronto Raptors", "14000","115","103");
INSERT INTO Game_ VALUES ("GG4","2023-11-28",	"Boston Celtics","Chicago Bulls", "14000","97","124");
INSERT INTO Game_ VALUES ("GG5","2023-11-28",	"New York Knicks", "Charlotte Hornets", "15000","115","91");
INSERT INTO Game_ VALUES ("GG6","2023-11-28",	"Minnesota Timberwolves", "Oklahoma City Thunders", "14000","106","103");
INSERT INTO Game_ VALUES ("GG7","2023-11-28",	"Dallas Mavericks", "Houston Rockets", "17000","121","115");
INSERT INTO Game_ VALUES ("GG8","2023-11-28",	"Sacramento Kings","Golden State Warriors", "17000","124","123");
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Game_ VALUES ("GG1","2023-11-28",	"Miami Heat","Milwaukee Bucks", "16000","124","141");
INSERT INTO Game_ VALUES ("GG2","2023-11-28",	"Cleveland Cavaliers","Atlanta Hawks", "13000","128","105");
INSERT INTO Game_ VALUES ("GG3","2023-11-28",	"Brooklyn Nets", "Toronto Raptors", "14000","115","103");
INSERT INTO Game_ VALUES ("GG4","2023-11-28",	"Boston Celtics","Chicago Bulls", "14000","97","124");
INSERT INTO Game_ VALUES ("GG5","2023-11-28",	"New York Knicks", "Charlotte Hornets", "15000","115","91");
INSERT INTO Game_ VALUES ("GG6","2023-11-28",	"Minnesota Timberwolves", "Oklahoma City Thunders", "14000","106","103");
INSERT INTO Game_ VALUES ("GG7","2023-11-28",	"Dallas Mavericks", "Houston Rockets", "17000","121","115");
INSERT INTO Game_ VALUES ("GG8","2023-11-28",	"Sacramento Kings","Golden State Warriors", "17000","124","123");
--------------------------------------------------------------------------------------------
INSERT INTO Is_Played_In VALUES("A14","GA1");
INSERT INTO Is_Played_In VALUES("A16","GA2");
INSERT INTO Is_Played_In VALUES("A24","GA3");
INSERT INTO Is_Played_In VALUES("A29","GA4");
INSERT INTO Is_Played_In VALUES("A5","GA5");
---------------------------------------------------------------------------------------------------------------------
INSERT INTO Is_Officiated_By VALUES("GA1","R1");
INSERT INTO Is_Officiated_By VALUES("GA2","R4");
INSERT INTO Is_Officiated_By VALUES("GA3","R7");
INSERT INTO Is_Officiated_By VALUES("GA4","R8");
INSERT INTO Is_Officiated_By VALUES("GA5","R3");
--------------------------------------------------------------------------------------------
INSERT INTO Is_Managed_By VALUES("2020","2027","C1","T1");
INSERT INTO Is_Managed_By VALUES("2017","2029","C2","T2");
INSERT INTO Is_Managed_By VALUES("2018","2024","C3","T3");
INSERT INTO Is_Managed_By VALUES("2022","2023","C4","T4");
INSERT INTO Is_Managed_By VALUES("2015","2025","C5","T5");
--------------------------------------------------------------------------------------------
INSERT INTO Is_Apart_Of VALUES("2020","T1","GW1");
INSERT INTO Is_Apart_Of VALUES("2020","T2","GW1");
INSERT INTO Is_Apart_Of VALUES("2020","T3","GW1");
INSERT INTO Is_Apart_Of VALUES("2020","T4","GW1");
INSERT INTO Is_Apart_Of VALUES("2020","T5","GW1");
INSERT INTO Is_Apart_Of VALUES("2020","T6","GW2");
INSERT INTO Is_Apart_Of VALUES("2020","T7","GW2");
INSERT INTO Is_Apart_Of VALUES("2020","T8","GW2");
INSERT INTO Is_Apart_Of VALUES("2020","T9","GW2");
INSERT INTO Is_Apart_Of VALUES("2020","T10","GW2");
--------------------------------------------------------------------------------------------
INSERT INTO Competes_In VALUES("GA1","T14");
INSERT INTO Competes_In VALUES("GA1","T12");
INSERT INTO Competes_In VALUES("GA2","T16");
INSERT INTO Competes_In VALUES("GA2","T17");
INSERT INTO Competes_In VALUES("GA3","T24");
INSERT INTO Competes_In VALUES("GA3","T22");
INSERT INTO Competes_In VALUES("GA4","T29");
INSERT INTO Competes_In VALUES("GA4","T27");
--------------------------------------------------------------------------------------------
INSERT INTO Scores VALUES("20","PN1","GA1");
INSERT INTO Scores VALUES("30","PN4","GA1");
INSERT INTO Scores VALUES("50","PN5","GA1");
INSERT INTO Scores VALUES("10","PL3","GA1");
INSERT INTO Scores VALUES("60","PL2","GA1");
--------------------------------------------------------------------------------------------
INSERT INTO Ticket VALUES("TICA1a","2000","VIP","Credit Card","GA1","AID1");
INSERT INTO Ticket VALUES("TICA1b","100","Upper-Courtside","Credit Card","GA1","AID2");
INSERT INTO Ticket VALUES("TICA1c","300","Lower-Courtside","Credit Card","GA1","AID3");
INSERT INTO Ticket VALUES("TICA1d","1000","Courtside","Credit Card","GA1","AID4");
INSERT INTO Ticket VALUES("TICA1e","200","Middle-Courtside","Credit Card","GA1","AID5");
