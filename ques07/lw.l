/* Write a Lex program that finds the longest word in the input. */

%option noyywrap

%{
#include <iostream>
#include <string>
using namespace std;
int count=0;
string longest="";
%}

%%
[^ \n\t]+ { if (yyleng > count) {
		count=yyleng;
		longest = yytext;
		}
	}

%%

int main()
{
yyin=fopen("text.txt","r");
yylex();
cout<<"longest word : "<<longest;
cout<<"\nlength of the word : "<<count<<endl;
return 0;
}