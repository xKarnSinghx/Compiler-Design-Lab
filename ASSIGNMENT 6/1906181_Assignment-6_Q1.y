/*
Q1.A student needs to check whether the given number is palindrome or not? He  had  the  problem  of  reversing  the  number.  Write  a YACC program  that can solve his problem.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
	extern int yylex();
	
	void yyerror(char *msg);
	int flag;
	
	int i;
	int k =0;	
%}

%union {
	char* f;
}

%token <f> STR
%type <f> E
%%

S : E {
		flag = 0;
		k = strlen($1) - 1;
		if(k%2==0){
		
		for (i = 0; i <= k/2; i++) {
		if ($1[i] == $1[k-i]) {
			} else {
			flag = 1;
			}
		}
		if (flag == 1) printf("The number is not palindrome\n");
		else printf("The number is  palindrome\n");
		return 0;
		}else{
		
		for (i = 0; i < k/2; i++) {
		if ($1[i] == $1[k-i]) {
		} else {
			flag = 1;
			}
			}
		if (flag == 1) printf("The number is not palindrome\n");
		else printf("The number is  palindrome\n");		
		return 0;

		}
	}
;

E : STR {$$ = $1;}
;

%%

void yyerror(char *msg)
{
	fprintf(stderr, "%s\n", msg);
	exit(1);
}

int main()
{
        printf("Enter the number: ");
	yyparse();
	return 0;
}
