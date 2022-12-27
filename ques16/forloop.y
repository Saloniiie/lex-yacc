%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s);
%}

%token ID NUM FOR LE GE EQ NE OR AND INT

%right '='
%left OR AND
%left '>' '<' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'


%%
   
lines : lines ST '\n'  { printf("\nINPUT ACCEPTED\n");}
|lines '\n'
|
;

ST       : FOR '(' E1 ';' E2 ';' E ')' DEF
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

E1 :  INT ID '=' NUM
      |
      ;      

E2     : E'<'E
         | E'>'E
         | E LE E
         | E GE E
         | E EQ E
         | E NE E
         | E OR E
         | E AND E
         |
         ;  
       
       
E      : ID '=' E
          |E '+' E
          | E '-' E
          | E '*' E
          | E '/' E
          | E '+' '+'
          | E '-' '-'
          | '+' '+' E
          | '-' '-' E
          | ID 
          | NUM
          |
          ;

%%


int main() {
    printf("Enter the expression:\n");
    return yyparse();
}     

void yyerror(char *error)
{
printf("%s\n",error);
}