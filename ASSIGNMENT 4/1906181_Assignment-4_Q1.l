/*
Q1.Write a Lex program to accept your Roll Number.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
#include<stdio.h>
#include<string.h>

char replace []="1906181";
%}


%%
[0-9]+ { if(strcmp(yytext, replace)==0) {
	printf("Accepted\n");		
                          
           }
	   else
	   printf("Not Accepted\n");
	   }
.+ {printf("Invalid\n");}
%%


int yywrap()
{
	return 1;
}
int main()
{	
        printf("Enter Roll number:\n");
	yylex();
	return 0;
}