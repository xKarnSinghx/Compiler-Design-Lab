/*
Q2. Write a LEX program to count the number of lines, spaces and tabs.


Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/



%{
#include<stdio.h>
int line=0, space=0, tab=0; 
%}
 
%%
\n {printf("line\t");line++;} 
([ ])+ {printf("space\t");space++;} 
\t {printf("tab\t");tab++;}
%%
int yywrap(){}
int main()
{
    printf("X-----Start-----X\n");
    yylex();  
    printf("\nNo. of lines=%d", line); 
    printf("\nNo. of spaces=%d", space);
    printf("\nNo. of tabs=%d", tab);
     
}