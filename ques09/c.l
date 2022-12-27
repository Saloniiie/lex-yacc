%option noyywrap

%{
    #include <bits/stdc++.h>
    using namespace std;
%}

%%
.|\n {fprintf(yyout, "%s", yytext);}
%%


int main(int argc, char* argv[]) {
    int l = sizeof(argv[1]) / sizeof(argv[1][0]);
    char s[l]="";
    strcat(s,argv[1]);
    if(s[l-2]=='c' && s[l-3]=='.') 
    {
        yyin = fopen(argv[1],"r");
        yylex();
    }
    else{
        cerr<<"C file is not found";
    }
    return 0;
}