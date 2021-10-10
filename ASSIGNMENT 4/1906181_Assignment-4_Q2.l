/*
Q2.A story has been written and saved in file, later you have given a task to search given word in the story. Write a Lex program to accomplish this task.
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
#include<string.h>
void check(char *);
%}
%%
[a-zA-Z]+ check(yytext);
%%
int yywrap()
{
	return 1;
}
int main()
{ 
        printf("Enter words to search:\n");
	yylex();
	return 0;
}
void check(char *str)
{
	FILE *fp;
	char temp[30];
	fp=fopen("input1.txt", "r");
	while((fscanf(fp, "%s", temp))!=EOF)
	{
		if(!(strcmp(temp, str)))
		{
			printf("FOUND\n");
			return;
		}
		
	}
	printf("NOT FOUND\n");
		return;
}
