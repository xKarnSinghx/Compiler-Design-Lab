/*
Q2. Write a YACC program to recognize string over alphabet {a,b} having equal no. of ‘a, and equal no of ‘b’ and length of string is greater than equal to zero.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(char *s);
%}

%token A B NL

%%
stmt: S NL { printf("ACCEPTED\n");
			exit(0); }
;
S: A S B |
;
%%

int yyerror(char *msg)
{
printf("NOT ACCEPTED\n");
exit(0);
}

int main()
{
printf("Enter the string: \n");
yyparse();
}

