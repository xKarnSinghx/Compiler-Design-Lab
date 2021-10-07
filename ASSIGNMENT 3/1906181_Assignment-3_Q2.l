/*
Q2.Write a lex program to design a DFA over input {0,1}, which accept odd no. of 0s or even no. of 1s but not both together.

Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
%}
 
%s A B C DEAD
 
%%

<INITIAL>1 BEGIN A;
<INITIAL>0 BEGIN B;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Accepted\n");}
  
<A>1 BEGIN INITIAL;
<A>0 BEGIN C;
<A>[^01\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("Accepted\n");}
  
<B>1 BEGIN C;
<B>0 BEGIN INITIAL;
<B>[^01\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("Not Accepted\n");} 
  
<C>1 BEGIN B;
<C>0 BEGIN A;
<C>[^01\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; {printf("Accepted\n");} 

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");} 
  
 

%%
 
int yywrap ()
 {
    return 1;
 }

int main()
{
        yylex();
	return 0;
}