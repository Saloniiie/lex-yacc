%option noyywrap
%{
#include"y.tab.h"
#include <stdio.h>
%}

%%
[01] {yylval=atoi(yytext); return BOOLEAN;}
[a-zA-Z][0-9] {yylval= (int(yytext[0])*10 + atoi(yytext+1))-650; return VARIABLE;}
"=>" {return IMPL;}
[ ]+ {}
\n|. {return yytext[0];}
%%