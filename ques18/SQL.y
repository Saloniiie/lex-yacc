%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

%%

%token SELECT FROM WHERE AND IDENTIFIER NUM;

line: line select items using condition ';' '\n' { printf("Correct Syntax\n"); };
	| line '\n'
	|
	;

select: SELECT;

items: '*' | identifiers;

identifiers: IDENTIFIER | IDENTIFIER ',' identifiers;

using: FROM IDENTIFIER WHERE | FROM IDENTIFIER;

condition: condition AND condition
		| IDENTIFIER '=' NUM
		| IDENTIFIER '=' IDENTIFIER
		|
		; 

%%

int main()
{
yyparse();
return 0;
}

void yyerror(char *error)
{
printf("%s\n",error);
}