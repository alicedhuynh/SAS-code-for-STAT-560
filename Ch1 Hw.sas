/*Exerises 1.1 and 1.4*/

proc import out=muscle_building
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter1\DATA for Exercises 1.1 and 1.4.csv"
   dbms=csv replace; 
run; 
title1 'Exerises 1.1 and 1.4';
data muscle_building;
	set muscle_building;
diff = two_weeks-start;
run;
proc univariate data=muscle_building;
	var diff;
run;

/*Exerises 1.2 and 1.5*/

proc import out=mental_fit
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter1\DATA for Exercises 1.2 and 1.5.csv"
   dbms=csv replace; 
run; 
title1 'Exerises 1.2 and 1.5';
data mental_fit;
	set mental_fit;
diff = intervention-control;
run;
proc univariate data=mental_fit;
	var diff;
run;

/*Exerises 1.3 and 1.6*/
proc import out=stock_prices
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter1\DATA for Exercises 1.3 and 1.6.csv"
   dbms=csv replace; 
run; 
title1 'Exerises 1.3 and 1.6';
data stock_prices;
	set stock_prices;
diff = price1-price2;
run;
proc univariate data=stock_prices;
	var diff;
run;

/*Exerises 1.7*/

proc import out=arthroplasty
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter1\DATA for Exercise 1.7.csv"
   dbms=csv replace; 
run; 
title1 'Exerises 1.7';
proc npar1way data=arthroplasty wilcoxon;
class group;
var nstay;
exact;
run;

/*Exerises 1.8*/

proc import out=health_education
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter1\DATA for Exercise 1.8.csv"
   dbms=csv replace; 
run; 
title1 'Exerises 1.8';
proc npar1way data=health_education wilcoxon;
class group;
var correct;
exact;
run;

/*Exerises 1.9*/

proc import out=network
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter1\DATA for Exercise 1.9.csv"
   dbms=csv replace; 
run; 
title1 'Exerises 1.9';
proc npar1way data=network wilcoxon;
class gender;
var nlikes;
exact;
run;

/*Exerises 1.10*/

proc import out=moms
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter1\DATA for Exercise 1.10.csv"
   dbms=csv replace; 
run; 
title1 'Exerises 1.10';
proc npar1way data=moms wilcoxon ab;
class status;
var nexercise;
exact;
run;

/*Exerises 1.11 and 1.14*/

proc import out=shoulder_score
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter1\DATA for Exercises 1.11 and 1.14.csv"
   dbms=csv replace; 
run; 
title1 'Exerises 1.11';
proc npar1way data=shoulder_score wilcoxon ab D;
class scale;
var score;
exact;
run;

/*Exerises 1.12*/
proc import out=adhesions
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter1\DATA for Exercise 1.12.csv"
   dbms=csv replace; 
run; 
title1 'Exerises 1.12';
proc npar1way data=adhesions D;
class group;
var score;
exact;
run;

/*Exerises 1.13*/
proc import out=tumor
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter1\DATA for Exercise 1.13.csv"
   dbms=csv replace; 
run; 
title1 'Exerises 1.13';
proc npar1way data=tumor D;
class group;
var reduction;
exact;
run;








