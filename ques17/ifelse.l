%option noyywrap

%{
#include"y.tab.h"
#include <stdio.h>
%}

alpha [A-Za-z]
digit [0-9]

%%
[ \t]   ;
if    return IF;
then    return THEN;
else    return ELSE;
{digit}+    return NUM;
{alpha}({alpha}|{digit})*    return ID;
"<="    return LE;
">="    return GE;
"=="    return EQ;
"!="    return NE;
"||"    return OR;
"&&"    return AND;
.|\n    return yytext[0];
%%