**********************;
** single condition **;
**********************;

* data step filtering ;
data sweet_tooth_ds ;
  set person(where=(sweet_tooth="yes")) ;
run;

* data step is an implicit loop over rows ;
* implies the result of the conditional is an output statement ;
* slower than the above ;
data sweet_tooth_ds2 ;
  set person ;
  
  * implicit ;
  if sweet_tooth="yes";
  
  * explicit ;
  * if sweet_tooth="yes" then output;
run;

* proc sql filtering ;
proc sql noprint;
  create table sweet_tooth_sql as
  select *
  from person
  where sweet_tooth="yes"
  ;
quit;



*************************;
** multiple conditions **;
*************************;

* data step filtering ;
data sweet_tooth_older_ds ;
  set person(where=(sweet_tooth="yes" and age > 20)) ;
run;

* data step is an implicit loop over rows ;
* implies the result of the conditional is an output statement ;
* slower than the above ;
data sweet_tooth_older_ds2 ;
  set person ;
  
  * implicit ;
  if sweet_tooth="yes" and age > 20;
  
  * explicit ;
  * if sweet_tooth="yes" and age > 20 then output;
run;

* proc sql filtering ;
proc sql noprint;
  create table sweet_tooth_older_sql as
  select *
  from person
  where sweet_tooth="yes"
    and age > 20
  ;
quit;
  
