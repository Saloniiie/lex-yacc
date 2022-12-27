/* lex program to count words, lines and characters of input file */

%option noyywrap

%{
#include<iostream>
using namespace std;
int nlines,nwords,nchars;
%}

%%
\n { nchars++; nlines++; }
 
[^ \n\t]+ {nwords++, nchars=nchars+yyleng;}

. {nchars++;}
%%

int main() 
{
 yyin=fopen("text.txt","r");
 yylex();
 cout<<"Lines : "<<nlines+1<<"\nWords : "<<nwords<<"\nCharacters : "<<nchars<<endl;

 return 0;
} 