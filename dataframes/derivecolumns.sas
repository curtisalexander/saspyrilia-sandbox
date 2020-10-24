*****************************;
** constant / static value **;
*****************************;

data hungry;
  set person;
  
  hungry = "yes";
run;

proc sql noprint;
  create table hungryb as
  select  *
         ,"yes" as hungry
  from person
  ;
quit;



******************;
** derive value **;
******************;

data hungry2;
  set person;
  
  if sweet_tooth = "yes" and
     substr(lowcase(name), 1, 1) in ("a", "e", "i", "o", "u") then hungry = "yes";
  else hungry = "no";
run;

proc sql noprint;
  create table hungry2b as
  select  *
         ,case
            when sweet_tooth = "yes" and
                 substr(lowcase(name), 1, 1) in ("a", "e", "i", "o", "u") then "yes"
            else "no"
          end as hungry
  from person
  ;
quit;
