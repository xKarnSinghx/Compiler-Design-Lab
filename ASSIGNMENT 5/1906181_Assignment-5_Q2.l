/*
Q2. Write a YACC program to recognize string over alphabet {a,b} having equal no. of ‘a, and equal no of ‘b’ and length of string is greater than equal to zero.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/

%{
#include "1906181_Assignment-5_Q2.tab.h"
%}

%%
[aA] {return A;}
[bB] {return B;}
\n {return NL;}
. {return yytext[0];}
%%

int yywrap()
{
return 1;
}
