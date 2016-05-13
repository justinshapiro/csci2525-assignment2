##Assignment 3##
Create the two programs described below. Upload them to Canvas prior to the
due date.
1. reorder.asm
- rearranges the values of the following array into this order: 3, 1, 2. Use
only MOV and XCHG to accomplish the desired result. DO NOT use any
immediate values. Use only direct offset addressing to accomplish the goal.
arrayD DWORD 1,2,3
2. fibonacci.asm
- computes the following.
a. Compute fib(n) for n = 2, 3, …, 6 using an array.
b. Store each computed value in an array of the appropriate size and
type.
c. Store fib(3) through fib(6) in consecutive bytes of the ebx register
starting from the lowest byte; that is, fib(3) is stored in the low byte
(bl) of ebx, fib(4) is stored in the next byte (bh), fib(5) is stored in the
next byte of ebx and fib(6) is stored in the highest byte.
Notes
1. Assume fib(0)=0, fib(1)=1.
2. You may use any instruction/directive/operator through chapter 4 pg 128,
including any of the arithmetic operators +, *, /, -.
3. Your program must use indirect operands in some way as discussed in chapter 4.
4. Your program must make one call to DumpRegs before quitting to display the
ebx register.
5. Part of the program will be graded on the basis of program style. I reserve the
right to judge style as I deem fit for the assignment