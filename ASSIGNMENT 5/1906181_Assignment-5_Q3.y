/*
Q3.Write and YACC program which accept string that starts and end with 0 or 1.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/

%{
#include<stdlib.h>
#include<stdio.h>
int yylex();
void yyerror(char *s);
%}
%token Z O
%%
r : s {printf("\nACCEPTED\n");} 
;
s : n
| Z a 
| O b
;

a : n a 
| Z 
; 
 
b : n b 
| O 
; 
 
n : Z 
| O 
; 
%% 
int main() 
{ 
printf("Enter the string: \n"); 
yyparse(); 
} 
void yyerror(char *s) 
{ 
fprintf(stdout,"\nNOT ACCEPTED\n"); 
} 

