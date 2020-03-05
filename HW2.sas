/*Exercise 2.1*/
/*Import csv file*/
proc import out=books
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter2\DATA for Exercise 2.1.csv"
   dbms=csv replace; 
run; 

title1 'Exercise 2.1';
proc sort data=books;
by student;
run;
proc rank data=books out=ranked;
var response;
by student;
ranks rank;
run;
/*Friedman rank test*/
proc freq data=ranked;
table student*month*rank/noprint cmh;
run;

/*Exercise 2.2*/
/*Import csv files*/
proc import out=TVcustomers
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter2\DATA for Exercise 2.2.csv"
   dbms=csv replace; 
run; 
title1 'Exercise 2.2';
proc sort data=TVcustomers;
by customer;
run;
proc rank data=TVcustomers out=ranked;
var probability;
by customer;
ranks rank;
run;
/*Friedman rank test*/
proc freq data=ranked;
table customer*contact*rank/noprint cmh;
run;

/*creating a new data set with variable letter phone text*/
data contactl;
	set TVcustomers;
	if contact = 'letter';
	rename probability = letter;
	run;
data contactp;
	set TVcustomers; 
	if contact = 'phone';
	rename probability = phone;
	run;

data contactt;
 	set TVcustomers;
	if contact = 'text';
	rename probability = text;
	run;

data contact (drop=contact);
	merge contactl contactp contactt;
	by customer;
	difflp = letter - phone;
	difflt = letter - text;
	diffpt = phone - text;
run;

/*wilcoxon sign test*/

proc univariate data=contact;
	var difflp difflt diffpt;
run;

/*Exercise 2.3*/
proc import out=lead_contents
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter2\DATA for Exercise 2.3.csv"
   dbms=csv replace; 
run; 

title1 'Exercise 2.3';

proc npar1way data=lead_contents wilcoxon;
class pond;
var lead;
exact;
run;

proc npar1way data=lead_contents wilcoxon;
class pond;
var lead;
exact;
where (pond ne 'B');
run;
proc npar1way data=lead_contents wilcoxon;
class pond;
var lead;
exact;
where (pond ne 'A');
run;
proc npar1way data=lead_contents wilcoxon;
class pond;
var lead;
exact;
where (pond ne 'C');
run;

/*Excerise 2.4*/
proc import out=germination
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter2\DATA for Exercise 2.4.csv"
   dbms=csv replace; 
run; 

title1 'Exercise 2.4';

proc npar1way data=germination wilcoxon;
class temperature;
var _Rate;
exact;
run;

/*Excerise 3.1*/
data prices;
	infile'C:\Users\Alice\Desktop\Spring 2020\STAT 560\DAT_Data_Exercises\CHAPTER3\DATA for Exercise 3.1.dat';
	input gasoline milk;
run;
title1 'Exercise 3.1';
proc freq data=prices;
table gasoline*milk;
exact scorr;
run;
proc corr data=prices spearman;
var gasoline milk;
run;

title1 'Exercise 3.2';
proc import out=family_therapy
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter3\DATA for Exercise 3.2.csv"
   dbms=csv replace; 
run; 
title1 'Exercise 3.2';
data recoded;
set family_therapy;
/* educ_rec=education recoded */
if educ='<HS' then educ_rec=1;
if educ='HS_grad' then educ_rec=2;
if educ='HS+' then educ_rec =3;
/* violence_rec=violence recoded */
if violence='never' then violence_rec=1;
if violence='sometimes' then violence_rec=2;
if violence='often' then violence_rec=3;
run;
proc freq data=recoded;
table educ_rec*violence_rec;
exact scorr;
run;
proc corr data=recoded spearman;
var educ_rec violence_rec;
run;

title1 'Exercise 3.3';
proc import out=KobeBryantPts
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter3\DATA for Exercise 3.3.csv"
   dbms=csv replace; 
run; 

proc freq;
table year*points;
exact scorr;
run;
proc corr spearman;
run;


title1 'Exercise 3.4';
proc import out=heart_valve
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter3\DATA for Exercise 3.4.csv"
   dbms=csv replace; 
run; 
title1 'Exercise 3.4';
proc freq data=heart_valve order=data;
weight count;
table center*age/fisher;
run;

title1 'Exercise 3.5';
proc import out=middle_school
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter3\DATA for Exercise 3.5.csv"
   dbms=csv replace; 
run; 
title1 'Exercise 3.5';
proc freq data=middle_school order=data;
weight count;
table gender*activity/fisher;
run;

title1 'Exercise 3.6';
data writers;
do count=1 to 6;
name='pen '; time='<1900';
output;
end;
do count=1 to 4;
name='pen '; time='1900+';
output;
end;
do count=1 to 9;
name='real'; time='<1900';
output;
end;
do count=1 to 11;
name='real'; time='1900+';
output;
end;
run;
proc freq data=writers;
table name*time/fisher;
run;

data writers1;
input name $ time $ count;
cards;
pen <1900 6
pen 1900+ 4
real <1900 9
real 1900+ 11
;
proc freq data=writers1;
weight count;
table name*time/fisher;
run;

title1 'Exercise 3.7';
proc import out=tribes
  datafile="C:\Users\Alice\Desktop\Spring 2020\STAT 560\CSV_Data_Exercises\Chapter3\DATA for Exercise 3.7.csv"
   dbms=csv replace; 
run; 
proc freq data=tribes;
table tribe*occupation/fisher;
run;
