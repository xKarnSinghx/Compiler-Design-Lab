/*
Q2.Given a paragraph in English, write a lex program which count the number of words, number of special characters, number of lines, spaces and tabs in the paragraph.


Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/

%{
#include<stdio.h>
int lines=0, words=0,special=0,space=0,tab=0;
%}
%%


 
\n { lines++; words++;}
([ ])+ {space++;words++;} 
\t {tab++;words++;} 
[A-Z] ;
[a-z] ;
[0-9] ;
. special++;
%%





int main(){
printf("Enter a Paragraph:\n");
yylex();
printf(" This Paragraph contains -->");
printf("\n\t%d lines", lines);
printf("\n\t%d words",words);
printf("\n\t%d special characters",special);
printf("\n\t%d space",space);
printf("\n\t%d tab",tab);
return 0;
}
 
int yywrap(){
return(1);
}
