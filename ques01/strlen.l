/*lex program to find the length of a string*/

%option noyywrap

%{
#include<iostream>
using namespace std;
%}

%%
[^ \n\t]+ {cout<<"length of given string is : "<<yyleng<<endl;}
%%

int main()
{
yylex();
return 0;
}