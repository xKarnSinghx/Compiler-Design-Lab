/*
Q3. Write a LEX program to convert an octal number to decimal number.


Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/



%{
    #include <stdlib.h>
    #include <stdio.h>
    #include <math.h>
    int b = 0, o = 0, d = 0;
%}

%%
^[0-7]+  {b = 1; o = atoi(yytext);}
[\n] {;}
. {b = 0;}
%%

int yywrap()
{
    if (b)
    {
        d = dec(o);
        printf("Decimal is %d\n", d);
    }
    else
    {
        printf("Invalid octal Number");
    }
}

int dec(int oct)
{
    int d = 0, id = 0;
    while(oct)
    {
        int a = oct % 10;
        d += a * pow(8, id);
        id++;
        oct /= 10;
    }
    return d;
}

int main()
{
    printf("Enter the octal number:\n ");
    yylex();
    return 0;
} 