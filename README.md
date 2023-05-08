# asembler_x86_64_AT_and_T_simple_programs
I was working on Ubuntu 22.04.1 LTS, and gcc version 11.3.0
I will be posting here my simple programs that I will prepare while studying for exams

must be compiled via for example:
as calculator.s -o calculator.o
gcc calculator.o -o result ( if u will have problem, write -no-pie at the end)
./result 

calculator:
After compile run then with 3 parameters, for example:
./result 2 3 2 (that will be 3 - 2 = 1)
First parameter is an operation, second is first argument, third is second argument

