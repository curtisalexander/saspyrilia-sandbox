***************;
** data step **;
***************;

data name_treat ;
  set person(keep=name
                  fav_treat);
run;


*********;
** sql **;
*********;

proc sql noprint;
  create table name_treat2 as
  select  name
         ,fav_treat
  from person
  ;
quit;


***********;
** macro **;
***********;

%macro selectcolumns(inds=
                    ,outds=
                    ,keeplist=) ;

  data &outds. ;
    set &inds.(keep=&keeplist.);
  run;
%mend;

%selectcolumns(inds=person
              ,outds=name_treat3
              ,keeplist=%str(name fav_treat));