/*
Q4.Write a Lex program accept 'baba' as a substring over input alphabet a, b.

Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/

%{	
%}

%s A B C D E DEAD

%%
<INITIAL>b BEGIN A;
<INITIAL>a BEGIN E;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<A>b BEGIN A;
<A>a BEGIN B;
<A>[^ab\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<B>a BEGIN E;
<B>b BEGIN C;
<B>[^ab\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<C>a BEGIN D;
<C>b BEGIN A;
<C>[^ab\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; {printf("Not Accepted\n");}

<D>a BEGIN D;
<D>b BEGIN D;
<D>[^ab\n] BEGIN DEAD;
<D>\n BEGIN INITIAL; {printf("Accepted\n");}

<E>a BEGIN E;
<E>b BEGIN A;
<E>[^ab\n] BEGIN DEAD;
<E>\n BEGIN INITIAL; {printf("Not Accepted\n");}

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