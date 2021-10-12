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
int yylex();
int yyerror();
%}

%token NUMBER TOKHEAT STATE TOKTARGET TOKTEMPERATURE
%%
commands: 
        | commands command
        ;

command:
        heat_switch
        |
        target_set
        ;

heat_switch:
        TOKHEAT STATE
        {
                if($2)
                        printf("\tHeater on!\n");
                else
                        printf("\tHeater off!\n");
        }
        ;

target_set: 
        TOKTARGET TOKTEMPERATURE NUMBER
        {
                printf("\tNew temperature set!\n");
        }
        ;

%%

int yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}
int yywrap()
{
        return 1;
} 
  
int main()
{
        yyparse();
	return 0;
} 

 
 