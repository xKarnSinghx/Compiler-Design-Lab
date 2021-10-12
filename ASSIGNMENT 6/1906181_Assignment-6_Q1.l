/*
Q1.A student needs to check whether the given number is palindrome or not? He  had  the  problem  of  reversing  the  number.  Write  a YACC program  that can solve his problem.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/



%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "1906181_Assignment-6_Q1.tab.h"
%}

%%

[0-9]+ {yylval.f = yytext; return STR;}
[-+()*/] {return yytext[0];}
[ \t\n]	 {;}

%%

int yywrap()
{
return -1;
}
