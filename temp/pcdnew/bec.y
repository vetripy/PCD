%{
  #include<stdio.h>
  #include<stdlib.h>
  int flag = 0;
  char v1,v2,v3;
  char* op[5] = {"mov","add","sub","mul","div"};
  int ch = 0;
%}

%token identifier
%left '+' '-'
%left '*' '/' 


%%
statement: identifier '=' E {v1=$1;bec(); return 0;}
          ;
E : E '+' F {ch=1;}
  | E '-' F {ch=2;}
  | E '*' F {ch=3;}
  | E '/' F {ch=4;}
  | identifier {v2=$1;}
  ;
F : identifier {v3=$1;}
  ;
%%
void bec()
{
printf("\nmov %c,R1",v2);
printf("\n%s %c,R1",op[ch],v3);
printf("\nmov R1,%c",v1);
}
int main()
{
printf("Enter code to be translated:");
yyparse();
return 0;
}
void yyerror()
{
  flag = 1;
 
}