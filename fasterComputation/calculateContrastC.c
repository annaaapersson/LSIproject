/*==========================================================
 * arraySummation.c - example in MATLAB External Interfaces
 *
 * Multiplies an input scalar (multiplier) 
 * times a 1xN matrix (inMatrix)
 * and outputs a 1xN matrix (outMatrix)
 *
 * The calling syntax is:
 *
 *		outMatrix = arrayProduct(multiplier, inMatrix)
 *
 * This is a MEX-file for MATLAB.
 * Copyright 2007-2012 The MathWorks, Inc.
 *
 *========================================================*/

#include "mex.h"

/* The computational routine */
void calculateContrastC(double x, double kernelSize, double *y, double *z, mwSize cols, mwSize rows)
{
    mwSize i, a, c, d, j;
//     mexPrintf("%d \n ", cols);
//     mexPrintf("%d \n ", rows);
    mwSize lengthRows = floor(rows / kernelSize);
    mwSize lengthCols = floor(cols / kernelSize);
    mwSize kernal = kernelSize;
//     mexPrintf(" lengthCols: %d ", lengthRows);
//     mexPrintf(" lengthRows: %d ", cols);
//     mexPrintf(" \n");

    for (j=0; j<(lengthRows); j++) {
        for (d=0; d<(lengthCols); d++) {
            for (a=0; a<kernelSize; a++) {
                for (c=0; c<kernelSize; c++) {

                    z[j*2 + d] = z[j*2 + d] + y[a*rows + c + d*kernal + j*rows*kernal];
                    
                    mexPrintf("d %d ", d);
                    mexPrintf("j %d ", j);
                    mexPrintf("c %d ", c);
                    mexPrintf("Y %d ", a*rows + c + d*kernal + j*rows*kernal);
                    mexPrintf("Y %8.4f ", y[a*rows + c + d*kernal + j*rows*kernal]);
                    mexPrintf("MatrixPos: %d ", j*2 + d);
                    mexPrintf("\n \n");
                }
            }
        }
    }
}

/* The gateway function */
void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, mxArray *prhs[])
{
    double multiplier;              /* input scalar */
    double kernelSize;
    double *inMatrix;               /* 1xN input matrix */
    size_t ncols;                   /* size of matrix */
    size_t nrows;
    double *outMatrix;              /* output matrix */

    /* check for proper number of arguments */
//     if(nrhs!=2) {
//         mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs","Two inputs required.");
//     }
//     if(nlhs!=1) {
//         mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nlhs","One output required.");
//     }
    /* make sure the first input argument is scalar */
//     if( !mxIsDouble(prhs[0]) || 
//          mxIsComplex(prhs[0]) ||
//          mxGetNumberOfElements(prhs[0])!=1 ) {
//         mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notScalar","Input multiplier must be a scalar.");
//     }
    
    /* make sure the second input argument is type double */
//     if( !mxIsDouble(prhs[1]) || 
//          mxIsComplex(prhs[1])) {
//         mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notDouble","Input matrix must be type double.");
//     }
    
    /* check that number of rows in second input argument is 1 */
//     if(mxGetM(prhs[1])!=1) {
//         mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notRowVector","Input must be a row vector.");
//     }
   
    /* get the value of the scalar input  */
    multiplier = mxGetScalar(prhs[2]);
    
    /* get the value of the scalar input n2  */
    kernelSize = mxGetScalar(prhs[0]);
    
    /* create a pointer to the real data in the input matrix  */
    inMatrix = mxGetPr(prhs[1]);
//     mexPrintf("%8.4f ", inMatrix[0]);
//     mexPrintf("%8.4f ", inMatrix[1]);
//     mexPrintf("%8.4f ", inMatrix[2]);
//     mexPrintf("%8.4f ", inMatrix[3]);
//     mexPrintf("%8.4f ", inMatrix[4]);
//     mexPrintf("%8.4f ", inMatrix[5]);
    
    /* get dimensions of the input matrix */
    ncols = mxGetN(prhs[1]);
    
    /* get dimensions of the input matrix */
    nrows = mxGetM(prhs[1]);

    /* create the output matrix */
    plhs[0] = mxCreateDoubleMatrix(nrows/kernelSize,ncols/kernelSize,mxREAL);

    /* get a pointer to the real data in the output matrix */
    outMatrix = mxGetPr(plhs[0]);

    /* call the computational routine */
    calculateContrastC(multiplier, kernelSize, inMatrix,outMatrix, (mwSize)ncols, (mwSize)nrows);
}
