/*
Q3.Write a Lex program that accept a string start with 'b’ and end with 'a' over input alphabet a, b.

Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/

%{	
%}

%s A B C DEAD

%%
<INITIAL>b BEGIN A;
<INITIAL>a BEGIN C;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<A>b BEGIN A;
<A>a BEGIN B;
<A>[^ab\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<B>a BEGIN B;
<B>b BEGIN A;
<B>[^ab\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("Accepted\n");}

<C>a BEGIN C;
<C>b BEGIN C;
<C>[^ab\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");} 

%%

int yywrap()
{
   return 1;
}
int main()
{
        printf("Enter strings:\n");
	yylex();
	return 0;
}