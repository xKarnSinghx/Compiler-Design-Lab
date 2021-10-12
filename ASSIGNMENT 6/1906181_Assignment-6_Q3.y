/*
Q3.A C program file is given to a student and he was asked to recognize valid identifiers,  operators  and  keywords  in  the  given  program.  Write  a  YACC program that can solve his task.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
#include <stdio.h>
#include <stdlib.h>
int id=0, dig=0, key=0, op=0;
int yylex();
int yyerror();
%}
%token DIGIT ID KEY OP

%%
input:
DIGIT input { dig++; }
| ID input { id++; }
| KEY input { key++; }
| OP input {op++;}
| DIGIT { dig++; }
| ID { id++; }
| KEY { key++; }
| OP { op++;}
;
%%

#include <stdio.h>
extern int yylex();
extern int yyparse();
extern FILE *yyin;
int main() 
{
	FILE *myfile = fopen("input.c", "r"); 
	if (!myfile) 
	{
		printf("I can't open input.c!");
		return 0;
	}
	yyin = myfile;
	do{
		yyparse();
	}while (!feof(yyin));
	printf("Numbers=%d\nKeywords = %d\nIdentifiers = %d\noperators = %d\n",dig,key,id, op);
	return 0;
}

int yyerror() {
	printf("EEK, parse error! Message: ");
	exit(-1);
}