/* Lex Program to print string starting with vowel */

%option noyywrap

%{
#include<iostream>
using namespace std;
%}

%%
[aeiouAEIOU][^ \n\t]* {cout<<yytext;}
[^ \n\t]*
%%

int main()
{
yyin=fopen("text.txt","r");	
yylex();
return 0;
}