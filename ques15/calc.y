%{
#include <ctype.h>
#include <stdio.h>
#include <math.h>
#define YYSTYPE double
int yylex();
void yyerror(char *s);
double fac(int x);
%}

%token NUMBER
%token LOG SIN nLOG COS TAN
%left '-' '+' '!'
%left '*' '/'
%right '^' UMINUS
%left LOG SIN nLOG COS TAN

%%
lines : lines expr '\n' {printf("%g\n",$2);}
|lines '\n'
|
;

expr : expr'+'expr {$$=$1+$3;}        /* add */
| expr '-' expr {$$=$1-$3;}           /* subtract */ 
| expr '*' expr {$$=$1*$3;}           /* multiply */
| expr '/' expr                       /* divide */ 
{ if($3==0) {yyerror("divide by zero");}
else {$$=$1/$3;}
}
|expr'^'expr {$$=pow($1,$3);}         /* exponent */
|'-'expr %prec UMINUS{$$=-$2;}        /* unary minus */
|'('expr')'{$$=$2;}                   /* brackets */
|LOG expr {$$=log($2)/log(10);}       /* log */
|nLOG expr {$$=log($2);}              /* In */
|SIN expr {$$=sin($2*3.14/180);}      /* sin */
|COS expr {$$=cos($2*3.14/180);}      /* cos */
|TAN expr {$$=tan($2*3.14/180);}      /* tan */
|expr '!' {$$=fac($1);}               /* factorial */
|NUMBER {$$=$1;}                      /* number */
;
%%

int main()
{
printf("Enter the expression\n");
yyparse();
return 0;
}

double fac(int x)
{
    int f=1;
    for(int i=1; i<=x; i++) { f*=i; }
    return f;
}

void yyerror(char *error)
{
printf("%s\n",error);
}