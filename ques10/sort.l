%option noyywrap

%{
    #include <bits/stdc++.h>
    using namespace std;
    vector<int> v;
%}

%%
[\-\+]?[0-9]+ {v.push_back(atoi(yytext));}
.|\n {;}
%%

int main() {
    yyin = fopen("text.txt","r");
    yylex();
    sort(v.begin(), v.end());
    for (auto x : v)
        cout<< x << " ";
  
    return 0;
}