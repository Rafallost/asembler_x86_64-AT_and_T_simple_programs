# asembler_x86_64_AT_and_T_simple_programs
**You can use command "sudo su" on the beginning and avoid writing it before every command**
I was working on Ubuntu 22.04.1 LTS, and gcc version 11.3.0
I will be posting here my simple programs that I will prepare while studying for exams

must be compiled via for example:
as calculator.s -o calculator.o
gcc calculator.o -o result ( if u will have problem, write "-no-pie" at the end)
./result 

calculator.s:
After compile run then with 3 parameters, for example:
./result 2 3 2 (that will be 3 - 2 = 1)
First parameter is an operation, second is first argument, third is second argument

Array_and_loop.s:
simple compile:
That program just checking how many zeros is in the array.

bmi.s:
simple compile:
Calculate bmi for values: weight 62 kg, height 1.82 m

celsius_to_fahrenheit.s:
After compile run then with 3 parameters, for example:
./result 222 22 1232
Program returns  celsius

celsius_to_fahrenheit_with_c:
temperature_c.c:
gcc -c temperature_c.c -o temperature1.o
temperature_s.s:
as temperature_s.s -o temperature2.o
compile:
gcc temperature1.o temperature2.o -o result ( if u will have problem, write "-no-pie" at the end)
After compile run then with 3 parameters, for example:
./result 512 323 23

delta.s:
simple compile:
return delta for values included in data section;

vectors.c:
gcc vectors.c -o result
./result
Part 1: Makes square root from first four numbers from first array.
Part 2: Multiplying whole wektor by another wektor ( in this case, wektor wich values are 4.0)