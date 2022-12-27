%option noyywrap

%{
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string>
using namespace std;
int nlines,nwords,nchars,nbspaces,nnums = 0;
char line[100]="";
%}

letter [A-Za-z_]
digit [0-9]
id {letter}({letter}|{digit})*
digits {digit}+ 
num {digits}([\.]{digits})?([\.]?[E][\+\-]?{digits})?

%%
\n {nchars++; nlines++; strcat(line,yytext); fprintf(yyout, "%d. %s", nlines, line); line[0]='\0';} /* newline */
 
[ ] {nbspaces++; nchars++; strcat(line,yytext);} /* blank spaces */

[#].* {nchars=nchars+yyleng; 
       for(int i=0; i<yyleng; i++) {if(yytext[i]==' ' && yytext[i+1]!=' ') nwords++;} nwords++;
       strcat(line,yytext); cout<<"\nheader file : "<<yytext; } /* header file */

["/"]["*"].*["*"]["/"] {nchars=nchars+yyleng; 
       for(int i=0; i<yyleng; i++) {if(yytext[i]==' ' && yytext[i+1]!=' ') nwords++;} nwords++;
       strcat(line,yytext); cout<<"\ncomment : "<<yytext; }    /* comment */

["/"]["/"].* {nchars=nchars+yyleng; 
       for(int i=0; i<yyleng; i++) {if(yytext[i]==' ' && yytext[i+1]!=' ') nwords++;} 
       strcat(line,yytext); cout<<"\ncomment : "<<yytext; }     /* comment */   

"while"|"if"|"else"|"return"|"break"|"continue"|"int"|"void"|"float"|"char" {nwords++; nchars=nchars+yyleng; strcat(line,yytext); cout<<"\nkeyword : "<<yytext; }  /* keyword */

{digits} {nnums++; nchars=nchars+yyleng; cout<<"\nnum : "<<yytext; strcat(line,yytext); strcat(line,".00"); }  /* integer (update) */

{num}  {nnums++; nchars=nchars+yyleng; strcat(line,yytext); cout<<"\nnum : "<<yytext;}  /* floating point and exponential numbers */

{id} {nwords++; nchars=nchars+yyleng; cout<<"\nidentifier : "<<yytext; if(yytext[0]=='a'|'e'|'i'|'o'|'u'|'A'|'E'|'I'|'O'|'U'){ yytext[0]+=1; } strcat(line,yytext);}  /* identifier (update : id starts with vowel) */

"+"|"-" {nchars++; strcat(line,yytext); cout<<"\naddop : "<<yytext;} 

"*"|"/" {nchars++; strcat(line,yytext); cout<<"\nmulop : "<<yytext; }

"<"|">"|">="|"<="|"=="|"!=" {nchars++; strcat(line,yytext); cout<<"\nrelop : "<<yytext; }

"=" {nchars++; strcat(line,yytext); cout<<"\n= : "<<yytext; }

";" {nchars++; strcat(line,yytext); cout<<"\n; : "<<yytext; }

"&&" {nchars++; strcat(line,yytext); cout<<"\nand : "<<yytext; }

"||" {nchars++; strcat(line,yytext); cout<<"\nor : "<<yytext; }

"!" {nchars++; strcat(line,yytext); cout<<"\nnot : "<<yytext; }

"(" {nchars++; strcat(line,yytext); cout<<"\n( : "<<yytext; }

")" {nchars++; strcat(line,yytext); cout<<"\n) : "<<yytext; }

"{" {nchars++; strcat(line,yytext); cout<<"\n{ : "<<yytext; }

"}" {nchars++; strcat(line,yytext); cout<<"\n} : "<<yytext; }

"[" {nchars++; strcat(line,yytext); cout<<"\n[ : "<<yytext; }

"]" {nchars++; strcat(line,yytext); cout<<"\n] : "<<yytext; }

. {nchars++; strcat(line,yytext); cout<<"\nError : "<<yytext; }
%%


int main()

{
    yyin=fopen("2020csc1044_ceasy.txt","r");
    yyout=fopen("2020csc1044_ceasyO.txt","w");
    yylex();
    cout<<"\n\n\nLines : "<<nlines+1<<"\nWords : "<<nwords<<"\nCharacters : "<<nchars<<"\nBlank Spaces : "<<nbspaces<<"\nNumbers : "<<nnums<<endl;
    return 0;
}
