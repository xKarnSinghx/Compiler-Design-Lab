/*
Q4. Given  an  input  sentence,  write  a  Lex  Program  to find  the  maximum number of characters present in the longest word. 


Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/



%{
  #include<stdio.h>
  #include<string.h>
  int len=0, ans=-1;
%}
  
%%
[a-zA-Z]+ { len=strlen(yytext);
            if(ans<len)
	    ans=len;}
%%
  
int yywrap (void ){
    return 1;
 }
  
int main(){
  printf("Enter the sentence:\n");
  yylex();
  printf("\nmaximum number of characters present in the longest word is : %d", ans);
  return 0;
 }