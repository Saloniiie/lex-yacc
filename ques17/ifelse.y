%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s);
%}

%token ID NUM IF THEN LE GE EQ NE OR AND ELSE

%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%left '+''-'
%left '*''/'


%%

lines : lines ST '\n'  { printf("\nINPUT ACCEPTED\n");}
|lines '\n'
|
;

ST    : IF '(' E2 ')' DEF ELSE DEF
        | IF '(' E2 ')' DEF
        ;

DEF    : '{' BODY '}'
           | E';'
           | ST
           |
           ;
           
BODY  : BODY BODY
           | E ';'
           | ST
           |            
           ;        

E    : E'='E
      | E'+'E
      | E'-'E
      | E'*'E
      | E'/'E
      | ID
      | NUM
      ;

E2  : E'<'E
      | E'>'E
      | E LE E
      | E GE E
      | E EQ E
      | E NE E
      | E OR E
      | E AND E
      | ID
      | NUM
      ;

%%

int main()
{
  printf("Enter the exp: ");
  return yyparse();
}

void yyerror(char *error)
{
printf("%s\n",error);
}