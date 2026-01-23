%{
#include<stdio.h>
int line_count=0, space_count=0, tab_count=0, meta_count=0;
%}

%%
[!@#$%^&*(){}[]|\/'] {meta_count++;}
" " {space_count++;}
\t {tab_count++;}
\n {line_count++;}
%%

int main(int argc, char* argv[]){
	extern FILE *yyin;
	yyin = fopen(argv[1],"r");
	yylex();
	printf("\nSpaces: %d\n Lines: %d\n Meta Character:%d\n Tabs: %d\n",space_count,line_count,meta_count,tab_count);
	return 0;
}
int yywrap(){
	return 1;
}

