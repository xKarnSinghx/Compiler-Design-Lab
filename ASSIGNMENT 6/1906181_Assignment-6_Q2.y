/*
Q2.A grammar is given: a^nb^nc^md^m, where n, m>=0. Check the validity of the following strings “abcd” and “aabbcd” using the given grammar with the help of a YACC program.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror();
%}
%token A B C D NEWLINE
%%
stmt: S NEWLINE { printf("VALID\n");
return 1;
 }
 ;
S: X Y
 ;

X: A X B
 |
 ;
Y: C Y D
 |
 ;
%%
void main()
{
printf("Enter the string: \n");
yyparse();

}

void yyerror() {
	printf("INVALID!");
	exit(-1);
}