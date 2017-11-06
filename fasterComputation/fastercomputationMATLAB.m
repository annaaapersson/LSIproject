mex calculateContrastC.c

kernelSize = 3; 
b = 2;
A3 = [1 7 13 19 25 31 1; 
     2 8 14 20 26 32 1;
     3 9 15 21 27 33 1;
     4 10 16 22 28 34 1;
     5 11 17 23 29 35 1;
     6 12 18 24 30 36 1;
     1 1 1 1 1 1 1];
 
 A1 = [1 7 13 19 25 31; 
     2 8 14 20 26 32;
     3 9 15 21 27 33;
     4 10 16 22 28 34;
     5 11 17 23 29 35;
     6 12 18 24 30 36];
 A = magic(30)
% summan = sum(sum(A))
B = calculateContrastC(kernelSize,A,b)
