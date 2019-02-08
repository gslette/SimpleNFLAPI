CREATE DATABASE IF NOT EXISTS nfl;

USE nfl;

/* To easily create this table, I ran the NFL API's JSON through a MySQL converter. 
This has the benefit of the field names aligning with the source JSON. The only downside is that
for nested elements, the titles of columns have been concatenated with their parent element 
(ex. homeTeamseason) and as such may have odd caseing for names.*/

CREATE TABLE IF NOT EXISTS nfl.games(
   gameId                                   INTEGER  NOT NULL PRIMARY KEY 
  ,gameDate                                 VARCHAR(10)  NOT NULL
  ,gameKey                                  INTEGER  NOT NULL
  ,gameTimeEastern                          VARCHAR(8) NOT NULL
  ,gameTimeLocal                            VARCHAR(8) NOT NULL
  ,gameType                                 VARCHAR(10) NOT NULL
  ,homeDisplayName                          VARCHAR(50) NOT NULL
  ,homeNickname                             VARCHAR(50) NOT NULL
  ,homeTeamseason                           INTEGER  NOT NULL
  ,homeTeamteamId                           INTEGER  NOT NULL
  ,homeTeamabbr                             VARCHAR(10) NOT NULL
  ,homeTeamcityState                        VARCHAR(50) NOT NULL
  ,homeTeamfullName                         VARCHAR(50) NOT NULL
  ,homeTeamnick                             VARCHAR(50) NOT NULL
  ,homeTeamteamType                         VARCHAR(4) NOT NULL
  ,homeTeamconferenceAbbr                   VARCHAR(3) NOT NULL
  ,homeTeamdivisionAbbr                     VARCHAR(3) NOT NULL
  ,homeTeamAbbr_2                           VARCHAR(3) NOT NULL
  ,homeTeamId                               INTEGER  NOT NULL
  ,isoTime                                  VARCHAR(30)  NOT NULL
  ,networkChannel                           VARCHAR(25) NOT NULL
  ,ngsGame                                  BOOLEAN  NOT NULL
  ,season                                   INTEGER  NOT NULL
  ,seasonType                               VARCHAR(10) NOT NULL
  ,sitesiteId                               INTEGER  NOT NULL
  ,sitesiteCity                             VARCHAR(50) NOT NULL
  ,sitesiteFullname                         VARCHAR(50) NOT NULL
  ,sitesiteState                            VARCHAR(2) 
  ,siteroofType                             VARCHAR(25) NOT NULL
  ,visitorDisplayName                       VARCHAR(50) NOT NULL
  ,visitorNickname                          VARCHAR(50) NOT NULL
  ,visitorTeamseason                        INTEGER  NOT NULL
  ,visitorTeamteamId                        INTEGER  NOT NULL
  ,visitorTeamabbr                          VARCHAR(10) NOT NULL
  ,visitorTeamcityState                     VARCHAR(50) NOT NULL
  ,visitorTeamfullName                      VARCHAR(50) NOT NULL
  ,visitorTeamnick                          VARCHAR(50) NOT NULL
  ,visitorTeamteamType                      VARCHAR(4) NOT NULL
  ,visitorTeamconferenceAbbr                VARCHAR(3) NOT NULL
  ,visitorTeamdivisionAbbr                  VARCHAR(3) NOT NULL
  ,visitorTeamAbbr_2                        VARCHAR(3) NOT NULL
  ,visitorTeamId                            INTEGER  NOT NULL
  ,week                                     INTEGER  NOT NULL
  ,weekName                                 VARCHAR(10)  NOT NULL
  ,weekNameAbbr                             VARCHAR(10)  NOT NULL
  ,scoretime                                VARCHAR(5) NOT NULL
  ,scorephase                               VARCHAR(25) NOT NULL
  ,scorevisitorTeamScorepointTotal          INTEGER  NOT NULL
  ,scorevisitorTeamScorepointQ1             INTEGER  NOT NULL
  ,scorevisitorTeamScorepointQ2             INTEGER  NOT NULL
  ,scorevisitorTeamScorepointQ3             INTEGER  NOT NULL
  ,scorevisitorTeamScorepointQ4             INTEGER  NOT NULL
  ,scorevisitorTeamScorepointOT             INTEGER  NOT NULL
  ,scorevisitorTeamScoretimeoutsRemaining   INTEGER  NOT NULL
  ,scorehomeTeamScorepointTotal             INTEGER  NOT NULL
  ,scorehomeTeamScorepointQ1                INTEGER  NOT NULL
  ,scorehomeTeamScorepointQ2                INTEGER  NOT NULL
  ,scorehomeTeamScorepointQ3                INTEGER  NOT NULL
  ,scorehomeTeamScorepointQ4                INTEGER  NOT NULL
  ,scorehomeTeamScorepointOT                INTEGER  NOT NULL
  ,scorehomeTeamScoretimeoutsRemaining      INTEGER  NOT NULL
  ,validated                                BOOLEAN  NOT NULL
  ,releasedToClubs                          BOOLEAN  NOT NULL
);

/*INSERT INTO nfl.games(gameId,gameDate,gameKey,gameTimeEastern,gameTimeLocal,gameType,homeDisplayName,homeNickname,homeTeamseason,homeTeamteamId,homeTeamabbr,homeTeamcityState,homeTeamfullName,homeTeamnick,homeTeamteamType,homeTeamconferenceAbbr,homeTeamdivisionAbbr,homeTeamAbbr_2,homeTeamId,isoTime,networkChannel,ngsGame,season,seasonType,sitesiteId,sitesiteCity,sitesiteFullname,sitesiteState,siteroofType,visitorDisplayName,visitorNickname,visitorTeamseason,visitorTeamteamId,visitorTeamabbr,visitorTeamcityState,visitorTeamfullName,visitorTeamnick,visitorTeamteamType,visitorTeamconferenceAbbr,visitorTeamdivisionAbbr,visitorTeamAbbr_2,visitorTeamId,week,weekName,weekNameAbbr,scoretime,scorephase,scorevisitorTeamScorepointTotal,scorevisitorTeamScorepointQ1,scorevisitorTeamScorepointQ2,scorevisitorTeamScorepointQ3,scorevisitorTeamScorepointQ4,scorevisitorTeamScorepointOT,scorevisitorTeamScoretimeoutsRemaining,scorehomeTeamScorepointTotal,scorehomeTeamScorepointQ1,scorehomeTeamScorepointQ2,scorehomeTeamScorepointQ3,scorehomeTeamScorepointQ4,scorehomeTeamScorepointOT,scorehomeTeamScoretimeoutsRemaining,validated,releasedToClubs) VALUES (2018090900,'09/09/2018',57568,'13:00:00','13:00:00','REG','Baltimore Ravens','Ravens',2018,0325,'BAL','Baltimore','Baltimore Ravens','Ravens','TEAM','AFC','ACN','BAL',0325,1536512400000,'CBS',true,2018,'REG',3695,'Baltimore','M&T Bank Stadium','MD','OUTDOOR','Buffalo Bills','Bills',2018,0610,'BUF','Buffalo','Buffalo Bills','Bills','TEAM','AFC','ACE','BUF',0610,1,'Week 1','Week 1','00:05','FINAL',3,0,0,3,0,0,0,47,14,12,14,7,0,0,true,true);
*/

CREATE TABLE IF NOT EXISTS nfl.byeweeks(
   homeTeamabbr                             VARCHAR(10) NOT NULL
   ,byeWeek                                 INTEGER NOT NULL
   ,season                                  INTEGER NOT NULL
);

INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("CAR", 4, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("WAS", 4, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("CHI", 5, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("TB", 5, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("DET", 6, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("NO", 6, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("GB", 7, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("OAK", 7, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("PIT", 7, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("SEA", 7, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("ATL", 8, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("DAL", 8, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("LAC", 8, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("TEN", 8, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("ARI", 9, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("CIN", 9, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("IND", 9, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("JAX", 9, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("NYG", 9, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("PHI", 9, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("BAL", 10, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("DEN", 10, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("HOU", 10, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("MIN", 10, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("BUF", 11, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("CLE", 11, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("MIA", 11, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("NEP", 11, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("NYJ", 11, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("SF", 11, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("KC", 12, 2018);
INSERT INTO byeweeks(homeTeamabbr, byeWeek, season) VALUES ("LAR", 12, 2018);