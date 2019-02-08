Simple NFL API to return bye week and point data.

Setup:
------

1. Run create-db.sql in your MySQL environment (I use Sequel Pro on macOS). This will create the games and bye tables, as well as populate the bye week data for each team.
2. Edit the host, username, and password settings in db.js to reflect your local environment.
3. Navigate to the project root in Terminal and run 'npm install' to download the required node modules. 
4. Run 'node injest.js'. This will insert all 256 2018 regular season games into the 'games' table. 
5. After the injest is complete (should only take a couple seconds), press Ctrl + C to kill the process.
6. To query the data, start the app server by running 'node app.js'.
7. The endpoints can be found at:

localhost:3000/bye/:year/:team?

ex. localhost:3000/bye/2018/SEA

This endpoint takes the year/season (ex. 2018) and returns bye week data for all teams. Optionally add a team abbreviation (ex. MIN, SEA) to return bye data for that team.

localhost:3000/pointsafterbye/:team/:quarter?

ex. localhost:3000/pointsafterbye/SEA/Q2

This endpoint takes the team abbreviation (ex. MIN, SEA) and returns the average points per game after their bye week. Optionally add a quarter (Q1, Q2, Q3, Q4) to return average points for that quarter after their bye week. 


Notes:
------

- My database structure in particular could definitely be improved upon. However keeping everything in one table, while a pain to look at, made everything easier for me when writing queries (no joins). 
- I was originally looking at using node-json-db to avoid having to setup mySQL but I'm more comfortable querying SQL so I went with that.
- Express is awesome! I managed to get this thing fully debugged via just node and console.log. Pretty painless to actually build the routes and return data. 
- Most time consuming part was definitely building out the SQL and debugging the queries. 
- I try to use camelCase but I may have missed some variables/functions while writing this. 
