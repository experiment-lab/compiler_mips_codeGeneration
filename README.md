<h1 align="center">Compiler Design Lab Project</h1>
[Link to Presentation](https://docs.google.com/presentation/d/1aJL2K3itWrowGL7sIJbI4r_bsvUzcSxR1cgS7PWgs7s/edit?usp=sharing)
  #how to compile:
>yacc -d lang.y <br />
lex lang.l    <br />
gcc -ll lang.tab.c -o base<br />
  #run parser <br />
> /base  {input filename} {output filename}<br />
  or<br />
 /base  {input filename}<br/>
 
 lang.l : This file is a lexical anaylser which searchs for vaild key words that is used in our program.
          when we run "lex lang.l" file in command prompt, this will generate lex.yy.c
          
 lang.y : In this file we are defining our rules for which, what action we have to take.
          when we run "yacc -d lang.y" file in command prompt, this will generate y.tab.c and y.tab.h for our compiler
         
codegen.c : This contains the actions we are taking in lang.y file.

After linking lex.yy.c and y.tab.c our .exe is generated for our compiler.

<h1 align="center">ScreenShots</h1>

<img src="https://github.com/tushar-amrit-6/compiler_mips_codeGeneration/blob/main/test/ss1.jpeg" /><br>
<img src="https://github.com/tushar-amrit-6/compiler_mips_codeGeneration/blob/main/test/ss2.jpeg" /><br>



 
