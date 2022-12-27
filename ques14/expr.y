%{
    #include<stdio.h>
    int yylex();
    void yyerror();
%}

%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
lines : lines E '\n'  { printf("\nEntered arithmetic expression is Valid\n\n");}
|lines '\n'
|
;

E:E'+'E 
 |E'-'E 
 |E'*'E 
 |E'/'E 
 |E'%'E 
 |'('E')' 
 | NUMBER
;
%%

void main()
{ 
   printf("\nEnter Any Arithmetic Expression : \n");
   yyparse();
}

void yyerror()
{
   printf("\nEntered arithmetic expression is Invalid\n\n");

}