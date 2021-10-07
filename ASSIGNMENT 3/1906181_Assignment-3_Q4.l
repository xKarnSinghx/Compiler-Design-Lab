/*
Q4.Given a text file, write a lex program to search aninput word in the file. If the word is present then count the total number of its occurrences, and replace every odd occurrenceof the word with your roll number.

Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
%{
#include<stdio.h>
#include<string.h>

char rep [10];
char replace [10];
int z =1;
int count=0;
%}


%%
[a-zA-Z]+ { if(strcmp(yytext, replace)==0) {
			count++;
                                if(z%2==1){
				 fprintf(yyout, "%s", rep);
                                  }
				else{
				 fprintf(yyout, "%s", replace);
				  }
                                 z++;
                                 }
	    else
		            fprintf(yyout, "%s", yytext);
           }
.		  fprintf(yyout, "%s", yytext);
%%


int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter the word to find : ");
        scanf("%[^\n]%*c", replace);	
         printf("Enter the word you want to replace with : ");
         scanf("%[^\n]%*c", rep);
        extern FILE *yyin, *yyout;	
	yyin=fopen("input1.txt", "r");
	yyout=fopen("output1.txt", "w");
	yylex();
	if(count>0)
	printf("Total number of occurrences of %s is %d\n",replace,count);
	else
	printf("%s is not present\n",replace);


}