/*
Q3.Write  a  lex  program to  design  a  DFA  over input {a,b}, which  accepts  all  thewords containing odd number of ‘b’.

Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/

%{	
%}

%s A B DEAD

%%
<INITIAL>a BEGIN B;
<INITIAL>b BEGIN A;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<A>a BEGIN A;
<A>b BEGIN INITIAL;
<A>[^ab\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("Accepted\n");}

<B>a BEGIN B;
<B>b BEGIN A;
<B>[^ab\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");} 

%%

int yywrap()
{
   return 1;
}
int main()
{
     yylex();
	return 0;
}