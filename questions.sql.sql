
# this SQL to generate the questions


#1) longest serving player on each [team]:
    #Correct answer: 
    SELECT r.first, r.last , max(r.yrsleague) 
    FROM  roster r  
    WHERE r.teamid = [team]
    GROUP BY [team]

    #random answers 
    SELECT r.first, r.last
    FROM  roster r  
    WHERE r.team_id = [team] 
    ORDER BY r.yrsleague DESC
    LIMIT 4 

# 2) drafted first overall in [year] 
   #Correct answer: 
   SELECT  d.draft_firstname d.draft_lastname
   FROM draft d
   WHERE d.draft_year = [year] AND 
         d.draft_round = 1 AND 
         d.draft_order = 1 AND

   #RANDOM answers: 
   SELECT  d.draft_firstname d.draft_lastname
   FROM draft d
   WHERE d.draft_year = [year] OR [year + 1] AND 
         d.draft_round = 1 AND 
         d.draft_order = 2 OR 3 OR 4

# 3) who did [team] draft first in [year]
	#Correct answer: 
	    SELECT DISTINCT d.draft_firstname d.draft_lastname 
	    FROM draft d 
	    WHERE d.draft_year = [year] AND 
	          d.draft_round = 1 AND 
	          d.draft_team = [team]
    #random answes: 
       SELECT DISTINCT d.draft_firstname d.draft_lastname 
	    FROM draft d 
	    WHERE d.draft_year = [year] AND 
	          d.draft_round = 2 OR 3 OR 4 AND 
	          d.draft_team = [team]

# 4) how many wins does the [team] have this season?
  #correct answer: 
        SELECT t.name , sum(t.win_count)
        FROM   team_stats t
        WHERE  t.name = [name]
        GROUP BY t.name
  #random answer: (return all win counts as an array, then we will choose random elements)
        SELECT    sum(t.win_count) 
        FROM      cfl_team_stats.csv t 
        GROUP BY  t.name

# 5) which team (team1) (team2) has a higher first downs per game average 
     #correct answer: 
        SELECT   t.name , avgFD AS sum(t.first_downs_number) / count(t.id)
        FROM     team_stats t
        WHERE    t.name = [team1] OR [team2] 
        GROUP BY t.name  
     #random answers

     # just get the correct answer the +/- 1 

#
