%option noyywrap

%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[Ss][Ee][Ll][Ee][Cc][Tt]	return SELECT;
[Ff][Rr][Oo][Mm]			return FROM;
[Ww][Hh][Ee][Rr][Ee]        return WHERE;
[Aa][Nn][Dd] 				return AND;
[a-zA-Z][a-zA-Z0-9]+		return IDENTIFIER;
[1-9][0-9]*                 return NUM;
[*;,=]|\n                   return *yytext;
[ \t]+					/* ignore whitespace */;
%%
