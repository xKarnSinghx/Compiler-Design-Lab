/*
Q1. Write a LEX program to count the number of vowels and consonants in a given string.


Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/



%{
    #include<stdio.h>
    int vowel=0,consonent =0;
%}
  
%%
[aeiouAEIOU] { printf("vowel\t");vowel++;}
[a-zA-Z] {printf("consonent\t");consonent++;}
%%
int yywrap(){}
int main()
{
    printf("Enter the string comprising english alphabet\n");
    yylex();
    printf("Number of vowels are:  %d\n", vowel);
    printf("Number of consonants are:  %d\n", consonent);
    return 0;
} 