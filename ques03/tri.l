/* string triangle */

%option noyywrap

%{
    #include <iostream>
    using namespace std;
%}

%%
[a-zA-Z0-9]+ { while(yyleng>0) {
                 for(int i=0; i<yyleng; i++) {
                   cout<<yytext[i]; }
                 cout<<endl;
                 yyleng--; }
             }
%%

int main()
{
    return yylex();
}