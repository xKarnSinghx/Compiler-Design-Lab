/*
Q1.Write a YACC program to implement following arithmetic operations Addition, Subtraction, Multiplication, and Division. Also print whether a arithmetic expression is valid or not.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
#include <stdio.h>
int flag=0;
int yylex();
int yyerror();
%}

%token NUMBER

%left '+' '-'

%left '*' '/' '%'

%left '(' ')'

%%

ArithmeticExpression: E{

		printf("\nEntered Arithmetic Expression is Valid and Result=%d\n", $$);

		return 0;

		};
E:E'+'E {$$=$1+$3;}

|E'-'E {$$=$1-$3;}

|E'*'E {$$=$1*$3;}

|E'/'E {$$=$1/$3;}

|E'%'E {$$=$1%$3;}

|'('E')' {$$=$2;}

| NUMBER {$$=$1;}

;

%%

int main()
{
printf("\nEnter The Arithmetic Expression:\n");

yyparse();
}

int yyerror()
{
printf("\nEntered Arithmetic Expression is Invalid\n\n");
flag=1;
}
