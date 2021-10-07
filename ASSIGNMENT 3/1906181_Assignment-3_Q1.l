/*
Q1.A story writer wishesto recheck his story. In ordertorecheck he needs to find all those words which are followed by ‘?’and ‘!’. Write a lex program that can solve his problem.


Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/



%{
    #include<stdio.h>
    int c=0;
%}

%%
[a-zA-Z0-9]*(\?|!) {printf("%s \n",yytext);c++;}
.      { continue;}
<<EOF>> { return 0; }
%%

int yywrap(void)
{
return 1;
}

int main(){
    printf("Enter Sentence : \n");
    yylex();
    printf("Total Words Ending with  ? or !  are : %d",c);
}