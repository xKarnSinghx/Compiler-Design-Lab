/*
Q1.Write a YACC program to implement following arithmetic operations Addition, Subtraction, Multiplication, and Division. Also print whether a arithmetic expression is valid or not.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/

%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+ {
		yylval=atoi(yytext);
		return NUMBER;

	}
[\t] ;

[\n] return 0;

. return yytext[0];

%%

int yywrap()
{
return 1;
}
