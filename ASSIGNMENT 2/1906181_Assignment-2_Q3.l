/*
Q3. Write a Lex program to check weather given number is odd or even and if it is odd also check whether it is prime or not.

Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/

%{
    #include<stdio.h>
     int i;
%}
  
%%
  
[0-9]+     {i=atoi(yytext);
          if(i%2==0) 
               printf("Number is Even");
          else {
             printf("Number is Odd ");
	 if (i <= 1)
         printf("and it is not Prime \n");
         else
	if (i <= 3) 
        printf("and it Prime \n");
        else
	if (i % 2 == 0 || i % 3 == 0)
	printf("and it not Prime \n");
	else {
	int z=0,j;
	for ( j = 5; j * j <= i; j = j + 6){
		if (i % j == 0 || i % (j + 2) == 0){
			z=1;
			break;
			}
			}

	if(z==0)printf("and it is Prime \n");
	else
	printf("and it is not Prime \n");
	}
    }
}
%%
   
int yywrap(){}
   
int main(){
   printf("Enter the number:\n");
    yylex();
    return 0;
}