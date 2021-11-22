/*
Q2.Write  a  program in  C to  find  three  address  codeusing  triples for  the following set of input expression: a = b * –c + b * –c.


Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404


*/
#include<iostream>
using namespace std;

int main(){
    cout<<"The set of input expression:- a = b * -c + b * -c\n";
    cout<<"Enter values of b and c for above expression:\n";
    int b,c;
    cout<<"b:";
    cin>>b;
    cout<<"c:";
    cin>>c;
    cout<<"\nNote: 'u_minus' is used for making negative of the operand\n\n";
    int result[6];
    cout<<"#\tOperand  \tArgument-1\tArgument-2\n";
    for(int i=0;i<6;i++){
        switch(i){
            case 0:
            cout<<"("<<i<<")\t"<<"u_minus"<<" \t  c="<<c<<endl;
            result[i]=0-c;
            break;
            case 1:
            cout<<"("<<i<<")\t"<<"  *\t"<<"\t  ("<<i-1<<") \t"<<" \t b="<<b<<endl;
            result[i]=result[0]*b;
            break;
            case 2:
            cout<<"("<<i<<")\t"<<"u_minus"<<" \t  c="<<c<<endl;
            result[i]=0-c;
            break;
            case 3:
            cout<<"("<<i<<")\t"<<"  *\t"<<"\t  ("<<i-1<<") \t"<<" \t b="<<b<<endl;
            result[i]=result[0]*b;
            break;
            case 4:
            cout<<"("<<i<<")\t"<<"  +\t"<<"\t  ("<<"1"<<") \t"<<" \t (3)"<<endl;
            result[i]=result[1]+result[3];
            break;
            case 5:
            cout<<"("<<i<<")\t"<<"  =\t"<<"\t  a \t"<<" \t (4)"<<endl;
            result[i]=result[i-1];
            break;
        }
    }
    cout<<"\nResult of above expression  is :a= "<<result[5]<<endl;
    return 0;
}
