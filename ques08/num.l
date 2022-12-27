%option noyywrap

%{
#include<iostream>
int a=0;
char ch;

/* store output in a file */
void fileout(char* s, int a);

/* print output on terminal */
void terout(int a); 

%}


%%

[0] { exit(0);}

[+]?[0-9]+ {a=atoi(yytext); a=a*a*a; 
            if(ch=='a' || ch=='c')
            {
                terout(a);
            }
            if(ch=='b' || ch=='d')
            {
                fileout(yytext,a);
            } }

[-][0-9]+ {a=atoi(yytext); a=a*a;
           if(ch=='a' || ch=='c')
            {
                terout(a);
            }
           if(ch=='b' || ch=='d')
            {
                fileout(yytext,a);
            } }

%%

void fileout(char* s, int a) {
    fprintf(yyout, "%s : %d\t", s, a);
    return;
}


void terout(int a) {
    printf("%d", a);
    return;
}

int main()
{
    printf("a. Take input from terminal and print output on terminal.\n");
    printf("b. Take input from terminal and store output in a file.\n");
    printf("c. Take input from a file and print output on terminal.\n");
    printf("d. Take input from a file and store output in another file.\n");
    printf("e. Exit \n");
    printf("Enter your choice... ");
    scanf("%s", &ch);

    switch(ch)
    {
        case 'a' :
        {
            printf("\nEnter integers... ");
            yylex();
            printf("\n");
            break;
        }
        case 'b' :
        {
            yyout = fopen("num2.txt","w");
            printf("\nEnter integers... ");
            yylex();
            break;
        }
        case 'c' :
        {
            yyin = fopen("num.txt","r");
            yylex();
            printf("\n");
            break;
        }
        case 'd' :
        {
            yyin = fopen("num.txt","r");
            yyout = fopen("num2.txt","w");
            yylex();
            break;
        }
        case 'e' :
        {
            exit(0);
            break;
        }
        default :
        {
            exit(0);
        }
    }

  return 0;
}  