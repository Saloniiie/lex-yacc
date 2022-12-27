/*Caesar Cipher */

%option noyywrap

%{
#include<iostream>
using namespace std;
%}

%%
[a-z]	{ char ch = yytext[0];
          ch += 3;
          if (ch > 'z') ch -= 26;
          cout<<ch;
        }
          
[A-Z]	{ char ch = yytext[0];
          ch += 3;
          if (ch > 'Z') ch -= 26;
          cout<<ch;
        }
%%

int main () 
{
        return yylex ();
}