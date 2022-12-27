%option noyywrap

%{

#include <iostream>
using namespace std;
int openB=0;
int closeB=0;

%}

%%
[\(]*[-]?[0-9]+[\)]?[\+\-\*/][\(]?[-]?[0-9]+[\)]* { for(int i=0; i<yyleng; i++) {
                                                    if(yytext[i] == '(') {
                                                        openB++;
                                                    } else if (yytext[i] == ')') {
                                                        closeB++;
                                                    }
                                                   }
                                                    if(openB == closeB) {
                                                        cout << "valid expression";
                                                    } else {
                                                        cout << "invalid expression";
                                                    }
                                                    }
%%

int main() {
    return yylex();
}
