/*
Q1.a)write C program to eliminate left recursion of following grammar.
E -> E + T / T
T -> T * F/ F
F -> id
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
#include<stdio.h> 
#include<string.h> 
#define sz 15
int main()
{
 char nt;
 char b,a;
 int n;
 char p[10][sz];
 int id = 3; 
 printf("Enter Number of Productions : ");
 scanf("%d", &n);
 printf("Enter the GRAMMAR as E->E-A :\n");
 int i = 0;
 for (i = 0; i < n; i++) {
     scanf("%s", p[i]);
    
  }
 for (i = 0; i < n; i++){
   printf("\nGRAMMAR :  %s", p[i]);
     nt = p[i][0];
    if (nt == p[i][id]){
       a = p[i][id + 1];
      printf(" is left recursive.\n");
      while (p[i][id] != 0 && p[i][id] != '|')
	    id++;
       if (p[i][id] != 0)
      {
         b = p[i][id + 1];
       printf("GRAMMAR without left recursion: \n");
        printf("%c->%c%c\'", nt, b, nt);
        printf("\n%c\'->%c%c%c\'|%s\n", nt, a,b,nt,"epsilon");
      }
     else  
	  printf(" can't be reduced.\n");
     
    }
    else  
	printf(" is not left recursive.\n");
    id = 3;
    
  }
 
}
