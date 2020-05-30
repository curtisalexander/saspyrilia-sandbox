data person ;
input name $10. fruit_veg $20. treat $20. age ;
/*
----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8----+----9----+----0
*/
datalines4;
Alice     apple               apple pie           10
Balin     banana              bananas foster      53
Cal       carrot              carrot cake         34
Dara      dates               doughnut            83
Ezekiel   elderberry          elderberry tart     4
Frances   fig                 fig bars            34
;;;;
run;
