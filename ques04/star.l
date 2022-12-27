%option noyywrap

%{
#include<iostream>
using namespace std;
%}

%%
[^ \n\t]+ { for(int i=1; i<yyleng; i++)
            { yytext[i] = '*'; }
            cout<<yytext<<endl;}            
%%

int main()
{
yylex();
return 0;
}