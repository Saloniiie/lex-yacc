%option noyywrap
%{
#include"y.tab.h"
#include <stdio.h>
%}

%%
[0-9]+([\.][0-9]+)?([E][\+\-]?[0-9]+)? {sscanf(yytext, "%lf", &yylval); return NUMBER;}
log|LOG {return LOG;}
In {return nLOG;}
sin|SIN {return SIN;}
cos|COS {return COS;}
tan|TAN {return TAN;}
[ ] {}
\n|. {return yytext[0];}
%%