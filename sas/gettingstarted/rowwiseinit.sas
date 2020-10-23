data person ;
input name $10. fav_fruit_veg $20. fav_treat $20. sweet_tooth $3. age ;
/*
----+----1----+----2----+----3----+----4----+----5----+----6----+----7
*/
datalines4;
Alice     apple               apple pie           yes 10
Balin     banana              bananas foster      yes 53
Cal       carrot              carrot cake         no  34
Dara      dates               doughnut            yes 83
Ezekiel   elderberry          elderberry tart     no  4
Frances   fig                 fig bars            no  34
;;;;
run;
