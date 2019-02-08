var fs = require('fs');
var request = require('request');
var mysql = require('mysql');
var connection = require('./db');
var gamedata = {};

request('https://api.ngs.nfl.com/league/schedule?season=2018&seasonType=REG', function (error, response, body) {

    if (!error && response.statusCode == '200') {
        // console.log(body);
        gamedata = response.body;

        //this isn't actually used, but I was originally having issues reading from the API 
        //muliple times in a row so I ended up writing it out and was planning to read from the local copy. 
        fs.writeFile('nfl-reg-2018.json', JSON.stringify(gamedata), function (err) {
            if (err) throw err;
            console.log('Current NFL game data saved locally.');
        });

        insertNFLGames(JSON.parse(gamedata), connection);
    }
    else {
        console.log('error:', error);
        console.log('statusCode:', response && response.statusCode);
    }
})

function insertNFLGames(games, con) {
    //loop through games object and insert games into database
    var gameCount = games.length;
    for (var i = 0; i < gameCount; i++) {
        var game = games[i];

        var sql = "INSERT INTO games(gameId,gameDate,gameKey,gameTimeEastern,gameTimeLocal,gameType,homeDisplayName,homeNickname,homeTeamseason,homeTeamteamId,homeTeamabbr,homeTeamcityState,homeTeamfullName,homeTeamnick,homeTeamteamType,homeTeamconferenceAbbr,homeTeamdivisionAbbr,homeTeamAbbr_2,homeTeamId,isoTime,networkChannel,ngsGame,season,seasonType,sitesiteId,sitesiteCity,sitesiteFullname,sitesiteState,siteroofType,visitorDisplayName,visitorNickname,visitorTeamseason,visitorTeamteamId,visitorTeamabbr,visitorTeamcityState,visitorTeamfullName,visitorTeamnick,visitorTeamteamType,visitorTeamconferenceAbbr,visitorTeamdivisionAbbr,visitorTeamAbbr_2,visitorTeamId,week,weekName,weekNameAbbr,scoretime,scorephase,scorevisitorTeamScorepointTotal,scorevisitorTeamScorepointQ1,scorevisitorTeamScorepointQ2,scorevisitorTeamScorepointQ3,scorevisitorTeamScorepointQ4,scorevisitorTeamScorepointOT,scorevisitorTeamScoretimeoutsRemaining,scorehomeTeamScorepointTotal,scorehomeTeamScorepointQ1,scorehomeTeamScorepointQ2,scorehomeTeamScorepointQ3,scorehomeTeamScorepointQ4,scorehomeTeamScorepointOT,scorehomeTeamScoretimeoutsRemaining,validated,releasedToClubs) VALUES ?";
        var values = [[game.gameId,
        game.gameDate,
        game.gameKey,
        game.gameTimeEastern,
        game.gameTimeLocal,
        game.gameType,
        game.homeDisplayName,
        game.homeNickname,
        game.homeTeam.season,
        game.homeTeam.teamId,
        game.homeTeam.abbr,
        game.homeTeam.cityState,
        game.homeTeam.fullName,
        game.homeTeam.nick,
        game.homeTeam.teamType,
        game.homeTeam.conferenceAbbr,
        game.homeTeam.divisionAbbr,
        game.homeTeamAbbr,
        game.homeTeamId,
        game.isoTime,
        game.networkChannel,
        game.ngsGame,
        game.season,
        game.seasonType,
        game.site.siteId,
        game.site.siteCity,
        game.site.siteFullname,
        game.site.siteState,
        game.site.roofType,
        game.visitorDisplayName,
        game.visitorNickname,
        game.visitorTeam.season,
        game.visitorTeam.teamId,
        game.visitorTeam.abbr,
        game.visitorTeam.cityState,
        game.visitorTeam.fullName,
        game.visitorTeam.nick,
        game.visitorTeam.teamType,
        game.visitorTeam.conferenceAbbr,
        game.visitorTeam.divisionAbbr,
        game.visitorTeamAbbr,
        game.visitorTeamId,
        game.week,
        game.weekName,
        game.weekNameAbbr,
        game.score.time,
        game.score.phase,
        game.score.visitorTeamScore.pointTotal,
        game.score.visitorTeamScore.pointQ1,
        game.score.visitorTeamScore.pointQ2,
        game.score.visitorTeamScore.pointQ3,
        game.score.visitorTeamScore.pointQ4,
        game.score.visitorTeamScore.pointOT,
        game.score.visitorTeamScore.timeoutsRemaining,
        game.score.homeTeamScore.pointTotal,
        game.score.homeTeamScore.pointQ1,
        game.score.homeTeamScore.pointQ2,
        game.score.homeTeamScore.pointQ3,
        game.score.homeTeamScore.pointQ4,
        game.score.homeTeamScore.pointOT,
        game.score.homeTeamScore.timeoutsRemaining,
        game.validated,
        game.releasedToClubs
        ]];

        con.query(sql, [values], function (err) {
            if (err) throw err;
            console.log('Game inserted successfully.');
        });
    };
}
