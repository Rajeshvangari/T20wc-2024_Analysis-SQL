SELECT *
from batting;

-- All the india matches and its results

SELECT *
FROM match_result
where Winner = 'india';

-- Team india player in ascending order

SELECT *
from batting
WHERE Team LIKE 'iNDIA'
ORDER BY Player ASC;

-- player scored more runs in whole tournament and catches of minimun 5

SELECT batting.Player,batting.Team, fielding.Ct, MAX(Runs) as most_runs
FROM batting
JOIN fielding
on batting.Player = fielding.Player
WHERE fielding.Ct >= 5
GROUP BY batting.Player,batting.Team,fielding.Ct
ORDER BY most_runs  desc 
Limit 10
;

-- Payer who scored over 100 runs and took more 5 catches and more than 2 wkts

SELECT batting.Player,bowling.Team , fielding.Ct,batting.Runs,bowling.Wkts
FROM batting
LEFT JOIN bowling ON batting.Player = bowling.Player
LEFT JOIN fielding ON fielding.Player = bowling.Player
WHERE batting.Runs > 100  AND fielding.Ct > 5 and bowling.Wkts >= 2
;



-- searching for india in winner column

SELECT *
FROM match_result 
WHERE Winner LIKE 'India'
;

-- list of players along with their team, runs scored, strike rate, batting average, and number of catches, ordered alphabetically by player name.

SELECT batting.player,batting.Team,batting.Runs,batting.SR,batting.Ave,wk.Ct
from wk
JOIN batting on wk.Player = batting.Player
ORDER BY Player ASC
;



-- PLAYER who scored minimum 100 runs and Has an Average of 30 and 3 fifties and strike rate of 100 took minimum of 5 ct 


SELECT batting.Player,batting.Team, batting.Runs,batting.Ave,batting.SR,batting.`50`,fielding.Ct 
FROM batting
left JOIN fielding on batting.Player = fielding.Player
WHERE Runs > 200 and Ave > 30  and SR > 100 and `50` > 2 and Ct <= 5 ;

-- players scored more than 100 runs, achieved exactly one fifty, took more than six catches, and took more than two wickets

with cte_example as
(
SELECT batting.Player,batting.Team,batting.Runs,batting.`50`,batting.Ave,fielding.Ct,bowling.Wkts,bowling.Ave as bow_ave,bowling.BBI
FROM batting
left JOIN bowling On batting.Player = bowling.Player
left JOIN fielding ON batting.player = fielding.player
)
select *
from cte_example
where  Runs > 100 and`50` = 1 and Ct > 6 and Wkts > 2;









 

 




