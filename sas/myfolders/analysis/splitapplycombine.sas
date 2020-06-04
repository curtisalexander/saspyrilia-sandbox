data person ;
input name $10. fruit_veg $20. treat $20. sweet_tooth $3. age ;
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

* sql ;
proc sql noprint;
  create table sweet_tooth_avg_age as
  select  sweet_tooth
         ,count(age) as age_cnt
         ,avg(age) as age_avg
  from person
  group by sweet_tooth
  ;
quit;


* means ;
proc means data=person nway noprint ;
  class sweet_tooth ;
  var age ;
  output out=sweet_tooth_avg_age2(drop=_type_ rename=(_freq_=age_cnt))
    mean=age_avg
  ;
run;