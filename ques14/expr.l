/* valid expressions */

%option noyywrap

%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+ return NUMBER;
[\t] ;
.|\n return yytext[0];
%%