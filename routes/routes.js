var request = require('request');
var mysql = require('mysql');
var connection = require('../db');

var router = function (app) {
    app.get("/", function (req, res) {
        res.status(200).send({ message: 'Simple NFL API' });
    });

    app.get("/bye/:year/:team?", function (req, res) {
        if (!req.params.team) {
            var sql = "SELECT * FROM byeweeks WHERE season = " + req.params.year + " ORDER BY byeWeek ASC";
        }
        else {
            var sql = "SELECT * FROM byeweeks WHERE season = " + req.params.year + " AND homeTeamabbr = '" + req.params.team + "'";
        }

        connection.query(sql, function (err, result, fields) {
            if (err) {
                res.status(400).send({ message: 'Error grabbing bye week data.' });
                throw err;
            }
            res.status(200).send(result);
        });
    });

    app.get("/pointsafterbye/:team/:quarter?", function (req, res) {
        if (!req.params.quarter) {
            var byeQuery = "SELECT byeWeek FROM byeweeks WHERE homeTeamabbr = '" + req.params.team + "'";
            connection.query(byeQuery, function (err, result, fields) {
                if (err) throw err;
                var bye = result[0].byeWeek;
                console.log("Team: " + req.params.team + ", Bye Week: " + bye);

                var homeQuery = "SELECT AVG(scorevisitorTeamScorepointTotal) AS average FROM games WHERE homeTeamabbr = '" + req.params.team + "' AND week > " + bye;
                connection.query(homeQuery, function (err, result, fields) {
                    if (err) throw err;
                    var averageHomeScore = result[0].average;
                    console.log("Average Home Score After Bye: " + averageHomeScore)

                    var awayQuery = "SELECT AVG(scorehomeTeamScorepointTotal) AS average FROM games WHERE homeTeamabbr = '" + req.params.team + "' AND week > " + bye;
                    connection.query(awayQuery, function (err, result, fields) {
                        if (err) throw err;
                        var averageAwayScore = result[0].average;
                        console.log("Average Away Score After Bye: " + averageAwayScore);

                        var average = (averageHomeScore + averageAwayScore) / 2;
                        console.log("Overall Average After Bye: " + average)

                        res.status(200).send(String(average));
                    });
                });
            });
        }
        else {
            var byeQuery = "SELECT byeWeek FROM byeweeks WHERE homeTeamabbr = '" + req.params.team + "'";
            connection.query(byeQuery, function (err, result, fields) {
                if (err) throw err;
                var bye = result[0].byeWeek;
                console.log("Team: " + req.params.team + ", Bye Week: " + bye);

                var homeQuery = "SELECT AVG(scorevisitorTeamScorepoint" + req.params.quarter + ") AS average FROM games WHERE homeTeamabbr = '" + req.params.team + "' AND week > " + bye;
                connection.query(homeQuery, function (err, result, fields) {
                    if (err) throw err;
                    var averageHomeScore = result[0].average;
                    console.log("Average " + req.params.quarter + " Home Score After Bye: " + averageHomeScore)

                    var awayQuery = "SELECT AVG(scorehomeTeamScorepoint" + req.params.quarter + ") AS average FROM games WHERE homeTeamabbr = '" + req.params.team + "' AND week > " + bye;
                    connection.query(awayQuery, function (err, result, fields) {
                        if (err) throw err;
                        var averageAwayScore = result[0].average;
                        console.log("Average " + req.params.quarter + " Away Score After Bye: " + averageAwayScore);

                        var average = (averageHomeScore + averageAwayScore) / 2;
                        console.log("Overall " + req.params.quarter + " Average After Bye: " + average)

                        res.status(200).send(String(average));
                    });
                });
            });
        }
    });
}

module.exports = router;