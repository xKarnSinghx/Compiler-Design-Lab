/*
Q3.A C program file is given to a student and he was asked to recognize valid identifiers,  operators  and  keywords  in  the  given  program.  Write  a  YACC program that can solve his task.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%option noyywrap
%{
#include <stdio.h>
#include "1906181_Assignment-6_Q3.tab.h"
extern int yylval;
%}

%%
[ \t];
[+|-|*|/|=|<|>] {printf("operator is %s\n",yytext);return OP;}
[0-9]+ {yylval = atoi(yytext); printf("numbers is %d\n",yylval); return DIGIT;} 
int|char|bool|float|void|for|do|while|if|else|return|void {printf("keyword is %s\n",yytext);return KEY;}
[a-zA-Z0-9]+ {printf("identifier is %s\n",yytext);return ID;}
. ;
%%