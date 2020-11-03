%{

	#include <stdio.h>
	#include <stdlib.h>
	#include<ctype.h>
	#include <string.h>
	#include"lex.yy.c"

	int yylex(void);
	void yyerror(char *s);
	int vars[26];
	int yywrap();

	void initialize_out();
	void print_instr(char *str);
	void push();
	void pop();
	int get_top();

	void cgen_push();
	void cgen_int();
	void cgen_var();

	void cgen_assign(int var_id);
	void cgen_print();
	void cgen_input(int var_id);
	void cgen_neg();
	void cgen_binop(char op);
	void cgen_div();

	int stack[1000];
	int st_top;
	int if_num, op_num, loop_num;
%}

%token PRINT INPUT
%token INT VAR

%left POW
%left '&' '|'
%left '+' '-'
%left '*' '/'
%nonassoc NEG

%%

lines:
	lines line
	|
	;

line:
	';'
	| expr ';'
	| VAR '=' expr ';' {cgen_assign($1);}
	| PRINT expr ';'  {cgen_print();}
	| INPUT VAR ';'	{cgen_input($2);}
	| '{' lines '}'
	;

expr:
	INT	{cgen_int();}
	| VAR	{cgen_var();}
	| '-' expr %prec NEG {cgen_neg();}
	| expr POW expr
	| expr {cgen_push();} '+' expr {cgen_binop('+');}
	| expr {cgen_push();} '-' expr {cgen_binop('-');}
	| expr {cgen_push();} '*' expr {cgen_binop('*');}
	| expr {cgen_push();} '/' expr {cgen_div('/');}
	| '(' expr ')'
	;

%%

#include "codegen.c"

void yyerror(char *s) {
	printf("%d: %s '%s'\n", yylineno, s, yytext );
}

int yywrap() {
	return 1;
}

int main(int argc, char *argv[])
{
	st_top = 0;
	if_num = 0;
	op_num = 0;
	loop_num = 0;
	if (argc > 1)
		yyin = fopen(argv[1], "r");
	if (argc == 3) {
		yyout = fopen(argv[2], "w");
	}
	else {
		yyout = fopen("out.s", "w");
	}
	initialize_out();
	
	if(!yyparse())
		printf("\nParsing completed successfully.\n");
	else
		printf("\nParsing failed!\n");

	//print_instr("li	$v0 10\t# Code for syscall: exit\n\tsyscall\n");
	
	fclose(yyin);
	fclose(yyout);
    return 0;
}