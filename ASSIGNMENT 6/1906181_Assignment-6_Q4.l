/*
Q4.Let's  say  we  have  a  thermostat  that  we  want  to  control  using  a  simple language. 
A session with the thermostat may look like this:
heat on
  Heater on!
heat off
   Heater off!
target temperature 22
    New temperature set!
Write a YACC program that can control the thermostat.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
#include <stdio.h>
#include <string.h>
#include "1906181_Assignment-6_Q4.tab.h"
extern int yylval;
%}
%%
[0-9]+                  yylval=atoi(yytext); return NUMBER;
heat                    return TOKHEAT;
on|off                  yylval=!strcmp(yytext,"on"); return STATE;
target                  return TOKTARGET;
temperature             return TOKTEMPERATURE;
\n                      
[ \t]+                  
%%