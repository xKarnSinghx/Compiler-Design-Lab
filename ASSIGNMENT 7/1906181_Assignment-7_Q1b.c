/*
Q1.b)write C program to find First and Follow sets of following grammar .
E -> E + T / T
T -> T * F/ F
F -> id
Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
#include<stdio.h>
#include<ctype.h>
#include<string.h>
void followfirst(char, int, int);
void follow(char c);
void findfirst(char, int, int);
int count, n = 0;
char calc_first[10][100];
char calc_follow[10][100];
int m = 0;
char production[10][10];
char f[10], first[10];
int k;
char ck;
int e;
int main(){
	int jm = 0,km = 0,i, choice;
	char c, ch;
	count = 7;
	/*
	After Eliminating left recursion of the grammar we get:
	E->TE'
    E'->+TE'|epsilon
    T->FT'
    T'->*FT'|epsilon
    F->id
	*/
	strcpy(production[0], "E=TR");//R is for E' and = in palce of ->
	strcpy(production[1], "R=+TR");//R is for E' and = in palce of ->
	strcpy(production[2], "R=#");//R is for E' and # is for epsilon and = in palce of ->
	strcpy(production[3], "T=FQ");//Q is for T'and = in palce of ->
	strcpy(production[4], "Q=*FQ");//Q is for T'
	strcpy(production[5], "Q=#");//Q is for T' and # is for epsilon and = in palce of ->
	strcpy(production[6], "F=id");// = in palce of ->
	
	int kay;
	char done[count];
	int ptr = -1;
	for(k = 0; k < count; k++) {
		for(kay = 0; kay < 100; kay++) {
			calc_first[k][kay] = '!';
		}
	}
	int point1 = 0, point2, xxx;
	
	printf("------------------------FIRST SET------------------------\n");
	for(k = 0; k < count; k++){
		c = production[k][0];
		point2 = 0;
		xxx = 0;
		for(kay = 0; kay <= ptr; kay++)
			if(c == done[kay])
				xxx = 1;
				
		if (xxx == 1)
			continue;
		findfirst(c, 0, 0);
		ptr += 1;
		done[ptr] = c;
		if(c=='R')
		printf("\n First(E') = { ");
		else if(c=='Q')
		printf("\n First(T') = { ");
		else 
		printf("\n First(%c) = { ", c);
		calc_first[point1][point2++] = c;
		for(i = 0 + jm; i < n; i++) {
			int lark = 0, chk = 0;
			
			for(lark = 0; lark < point2; lark++) {
				
				if (first[i] == calc_first[point1][lark]){
					chk = 1;
					break;
				}
			}
			if(chk == 0){
				if(i!=n-1){
					if(first[i]=='#')
					printf("epsilon,");
					else if(first[i]=='i')
					printf("id,");
					else
					printf("%c, ", first[i]);
				}
				else{
				if(first[i]=='#')
				printf("epsilon ");
				else if(first[i]=='i')
					printf("id "); 
				else			
				printf("%c ", first[i]);
				}
				calc_first[point1][point2++] = first[i];
			}
		}
		printf("}\n");
		jm = n;
		point1++;
	}
	printf("\n");
	printf("------------------------FOLLOW SET------------------------\n\n");
	char donee[count];
	ptr = -1;
	for(k = 0; k < count; k++) {
		for(kay = 0; kay < 100; kay++) {
			calc_follow[k][kay] = '!';
		}
	}
	point1 = 0;
	int land = 0;
	for(e = 0; e < count; e++){
		ck = production[e][0];
		point2 = 0;
		xxx = 0;
		for(kay = 0; kay <= ptr; kay++)
			if(ck == donee[kay])
				xxx = 1;
				
		if (xxx == 1)
			continue;
		land += 1;
		follow(ck);
		ptr += 1;
		donee[ptr] = ck;
		if(ck=='R')
		printf("\n Follow(E') = { ");
		else if(ck=='Q')
		printf("\n Follow(T') = { ");
		else 
		printf(" Follow(%c) = { ", ck);
		calc_follow[point1][point2++] = ck;
		for(i = 0 + km; i < m; i++) {
			int lark = 0, chk = 0;
			for(lark = 0; lark < point2; lark++){
				if (f[i] == calc_follow[point1][lark]){
					chk = 1;
					break;
				}
			}
			if(chk == 0){
				if(f[i]=='i')
				printf("id, ");
				else if(f[i]!='$')
				printf("%c, ", f[i]);
				else if( f[i]=='i')
				printf("id ");
				else
				printf("%c", f[i]);
				calc_follow[point1][point2++] = f[i];
			}
		}
		printf(" }\n\n");
		km = m;
		point1++;
	}
}

void follow(char c){
    int i, j;
    if(production[0][0] == c) {
        f[m++] = '$';
    }
    for(i = 0; i < 10; i++) {
        for(j = 2;j < 10; j++){
            if(production[i][j] == c){
                if(production[i][j+1] != '\0'){
                    followfirst(production[i][j+1], i, (j+2));
                }
                 
                if(production[i][j+1]=='\0' && c!=production[i][0]){
                    follow(production[i][0]);
                }
            }
        }
    }
}
 
void findfirst(char c, int q1, int q2){
    int j;
    if(!(isupper(c))) {
        first[n++] = c;
    }
    for(j = 0; j < count; j++){
        if(production[j][0] == c){
            if(production[j][2] == '#') {
                if(production[q1][q2] == '\0')
                    first[n++] = '#';
                else if(production[q1][q2] != '\0' && (q1 != 0 || q2 != 0)){
                    findfirst(production[q1][q2], q1, (q2+1));
                }
                else
                    first[n++] = '#';
            }
            else if(!isupper(production[j][2])) {
                first[n++] = production[j][2];
            }
            else {
                findfirst(production[j][2], j, 3);
            }
        }
    }
}
 
void followfirst(char c, int c1, int c2){
    int k;
    if(!(isupper(c)))
        f[m++] = c;
    else {
        int i = 0, j = 1;
        for(i = 0; i < count; i++){
            if(calc_first[i][0] == c)
                break;
        }
        while(calc_first[i][j] != '!') {
            if(calc_first[i][j] != '#') {
                f[m++] = calc_first[i][j];
            }
            else{
                if(production[c1][c2] == '\0') {
                    follow(production[c1][0]);
                }
                else{
                    followfirst(production[c1][c2], c1, c2+1);
                }
            }
            j++;
        }
    }
}
