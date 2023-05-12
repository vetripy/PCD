%{
#include "y.tab.h"
%}
%%
[a-zA-Z] {yylval = yytext[0]; return identifier;}
[\t] ;
[\n] return 0;
. return yytext[0];
%%
int yywrap()
{
return 1;
}