/*
Q.1)In  the  syntax  analyzer  phase  of  the  compiler,  the  parser 
 generates  the abstract syntax tree (condensed form of the parse
 tree). This abstract syntax tree needs to be converted into machine 
understandable format using the intermediate  code  generator.  
Write  a  program  in  C  to convert  the  given abstract syntaxes
 into their equivalent machine codes. The following specific machine instruction sets may be considered:
Following argument types may be used:
R →specifies a register in the form R0, R1, R2,etc.
L →specifies a numerical label.
V →specifies a `variable location'pointed to by a register.
A →specifies a constant value.
The instruction set may bedefined as follows:
LOAD A,R→loads the integer value specified by A into register R
STORE R,V→stores the value in register R to variable V.
OUT R→outputs the value in register R.
ADD A,R→adds the value specified by A to register R.
SUB A,R→subtracts the value specified by A from register R.
MUL A,R→multiplies the value specified by A by register R.
DIV A,R→divides register R by the value specified by A.
STOP→stops execution of the machine.

Example:
Input:= t3 99
Output:  STORE t3, 99

Input may be considered as:= 
= t1 2
[]= a 0 1
[]= a 1 2
[]= a 2 3
* t1 6 t2
+ a[2] t2 t3
- a[2] t1 t2
/ t3 t2 t2
print t2
*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int label[20];
int no=0;


int check_label(int k) {
    int i;
    for(i=0;i<no;i++) {
        if(k==label[i])
            return 1;
    }
    return 0;
}

int main() {
    FILE *fp1, *fp2;
    char fname[10], op[10], ch;
    char operand1[8], operand2[8], result[8];
    int i=0, j=0;

    printf("\n Enter filename of the Intermediate Code : ");
    scanf("%s", &fname);

    fp1 = fopen(fname, "r");
    fp2 = fopen("output.txt", "w");
    if(fp1 == NULL || fp2 == NULL) {
        printf("\n Error opening the file !!!");
        exit(0);
    }

    while(!feof(fp1)) {
        fprintf(fp2, "\n");
        fscanf(fp1, "%s", op);
        i++;

        if(check_label(i))
            fprintf(fp2,"\nlabel#%d",i);

        if(strcmp(op,"print")==0) {
            fscanf(fp1,"%s",result);
            fprintf(fp2,"\n\t OUT %s",result);
        }
        if(strcmp(op,"[]=")==0) {
            fscanf(fp1,"%s %s %s",operand1,operand2,result); 
            fprintf(fp2,"\n\t STORE %s[%s],%s",operand1,operand2,result);
        }
        switch(op[0]) {
            case '*': 
                fscanf(fp1,"%s %s %s", operand1, operand2, result);
                fprintf(fp2,"\n \t LOAD %s,R0",operand1);
                fprintf(fp2,"\n \t LOAD %s,R1",operand2);
                fprintf(fp2,"\n \t MUL R1,R0");
                fprintf(fp2,"\n \t STORE R0,%s",result);
                break;

            case '+': 
                fscanf(fp1,"%s %s %s", operand1, operand2, result);
                fprintf(fp2,"\n \t LOAD %s,R0",operand1);
                fprintf(fp2,"\n \t LOAD %s,R1",operand2);
                fprintf(fp2,"\n \t ADD R1,R0");
                fprintf(fp2,"\n \t STORE R0,%s",result);
                break;

            case '-': 
                fscanf(fp1,"%s %s %s", operand1, operand2, result);
                fprintf(fp2,"\n \t LOAD %s,R0",operand1);
                fprintf(fp2,"\n \t LOAD %s,R1",operand2);
                fprintf(fp2,"\n \t SUB R1,R0");
                fprintf(fp2,"\n \t STORE R0,%s",result);
                break;

            case '/': 
                fscanf(fp1,"%s %s %s",operand1,operand2,result);
                fprintf(fp2,"\n \t LOAD %s,R0",operand1);
                fprintf(fp2,"\n \t LOAD %s,R1",operand2);
                fprintf(fp2,"\n \t DIV R1,R0");
                fprintf(fp2,"\n \t STORE R0,%s",result);
                break;

            case '=': 
                fscanf(fp1,"%s %s",operand1,result);
                fprintf(fp2,"\n\t STORE %s %s",operand1,result);
                break;       
        }
    }

    fclose(fp2); 
    fclose(fp1);
    fp2=fopen("output.txt","r");
    if(fp2==NULL) {
        printf("Error opening the file !!!\n");
        exit(0);
    }
    do {
        ch=fgetc(fp2);
        printf("%c",ch);
    }while(ch != EOF);
    fclose(fp1);

    return 0;
}
