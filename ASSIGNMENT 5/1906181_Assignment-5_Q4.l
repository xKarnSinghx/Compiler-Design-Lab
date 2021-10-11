/*
Q4.Write an YACC program to convert base 2 digit to base 10 digit.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/

%{
#include<stdio.h> 
#include<stdlib.h> 
#include "1906181_Assignment-5_Q4.tab.h"
extern int yylval; 
%}
%%
0 {yylval=0;return ZERO;}
1 {yylval=1;return ONE;}

[ \t] {;}
\n return 0;
. return yytext[0];
%%

	
int yywrap()
{
return 1;
}

