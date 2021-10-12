/*
Q2.A grammar is given: a^nb^nc^md^m, where n, m>=0. Check the validity of the following strings “abcd” and “aabbcd” using the given grammar with the help of a YACC program.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
#include"1906181_Assignment-6_Q2.tab.h"
%}
%%
a |
A {return A;}
c |
C {return C;}
b |
B {return B;}
d |
D {return D;}
[ \t] {;}
"\n" {return NEWLINE;}
. {return yytext[0];}
%%
int yywrap()
{
 return 1;
} 