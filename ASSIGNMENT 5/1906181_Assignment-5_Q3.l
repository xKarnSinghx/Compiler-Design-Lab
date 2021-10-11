/*
Q3.Write and YACC program which accept string that starts and end with 0 or 1.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/

%{
#include<stdio.h> 
#include<stdlib.h> 
#include "1906181_Assignment-5_Q3.tab.h"
extern int yylval; 
%}

%% 
0 {yylval=0;return Z;} 
1 {yylval=1;return O;} 
[ \t] {;} 
\n return 0; 
. return yytext[0]; 
%% 
int yywrap() 
{ 
return 1; 
} 

