
%{
int op = 0,op2 = 0,f1=0,f2=0;
float c,d;
int a,b;
void int_cal();
void digi();
%}
inte [0-9]+
f [0-9]+|([0-9]*)"."([0-9]+)
add "+"
sub "-"
mul "*"
div "/"
%%
{inte} {f1=1;int_cal();}
{f} {f2=1;digi();}
{add} {
	if(f1==1)
	op=1;
	else
	op2=1;
}
{sub} {
	if(f1==1)
	op=2;
	else
	op2=2;
}
{mul} {
	if(f1==1)
	op=3;
	else
	op2=3;
}
{div} {
	if(f1==1)
	op=4;
	else
	op2=4;
}
"\n" {}
"//"|"**" {printf("Not a valid input\n");exit(0);}
[^+*/-] {printf("Not a valid input\n");exit(0);}
%%
void int_cal()
{
if(op==0)
a=atoi(yytext);
else
{
b=atoi(yytext);

switch(op)
{
case 1:a=a+b; printf("Sum is %d\n",a);
	break;

case 2:a=a-b; printf("Difference is %d\n",a);
break;

case 3:a=a*b; printf("Product is %d\n",a);
break;

case 4:
printf("Quotient is %.2f\n",a/(float)b);
break;
}
op=0; op2=0;
}
}

void digi(){
	if(op2==0)
	c=atof(yytext);
	else{
	d = atof(yytext);
	switch(op2)
	{
	case 1: c = c+d; printf("Sum is %.2f\n",c); break;
	case 2: c = c-d; printf("Difference is %.2f\n",c); break;
	case 3: c = c*d; printf("Product is %.2f\n",c); break;
	case 4: c = c/d; printf("Quotient is %.2f\n",c); break;
	}
	}
}
int main(int argv,char *argc[])
{
yylex();
}

int yywrap()
{
return 1;
}
