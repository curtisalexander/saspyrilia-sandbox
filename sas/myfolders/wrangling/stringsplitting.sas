* split string on comma returning first element ;
data _null_;
  fruit_string = "apple, banana, carrot";
  first_fruit = strip(scan(fruit_string, 1, ","));

  put fruit_string=;
  put first_fruit=;
run;

* split string on comma returning all elements ;
data _null_;
  fruit_string = "apple, banana, carrot";
  
  array fruits {3} $;
  do i = 1 to 3 ;
  	fruits{i} = strip(scan(fruit_string, i, ","));
  end;

  put fruit_string=;
  put fruits1=;
  put fruits2=;
  put fruits3=; 
run;

* macro - split string on comma returning first element ;
%macro first_fruit;
  %let fruit_string = apple, banana, carrot ;
  %let first_fruit = %trim(%left(%scan(%bquote(&fruit_string), 1, %str(,))));
  
  %put &=fruit_string.;
  %put &=first_fruit.;
%mend;

%first_fruit;

* macro - split string on comma returning all elements ;
%macro all_fruits;
  %let fruit_string = apple, banana, carrot ;
  %let fruit_cnt = %sysfunc(countw(%bquote(&fruit_string), %str(,)));
  
  %do i = 1 %to &fruit_cnt.;
    %let fruits&i. = %trim(%left(%scan(%bquote(&fruit_string), &i., %str(,))));
  %end;
  
  
  %put &=fruit_string.;
  %put &=fruits1.;
  %put &=fruits2.;
  %put &=fruits3.;
%mend;

%all_fruits;
