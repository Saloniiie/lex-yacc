%{
#include <ctype.h>
#include <stdio.h>
#include <math.h>
int yylex();
void yyerror(char *s);
int varArray[600];
%}

%token BOOLEAN VARIABLE IMPL
%left '+' '.' '&' '|'
%right '!' '^'

%%
lines : lines statement '\n'
|lines '\n'
|
;

statement : expr {printf("%d\n",$1);}
|VARIABLE '=' expr {varArray[$1]=$3;}
;

expr : expr'+'expr {$$=$1||$3;}        /* or */
| expr '.' expr {$$=$1&&$3;}           /* and */
|expr'|'expr {$$=$1|$3;}               /* bitwise or */
|expr'&'expr {$$=$1&$3;}               /* bitwise and */
|expr IMPL expr {$$= !$1|$3;}          /* implication */
|'!'expr {$$=!$2;}                     /* not */
|'('expr')'{$$=$2;}                    /* brackets */
|'^'expr {$$=~$2;}                     /* bitwise not */
|VARIABLE {$$=varArray[$1];}           /* variable */
|BOOLEAN {$$=$1;}                      /* boolean number */
;
%%

int main()
{
printf("Enter the boolean expression...\n");
yyparse();
return 0;
}

void yyerror(char *error)
{
printf("%s\n",error);
}