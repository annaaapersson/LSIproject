/*
 * fastercomputation.c - example in MATLAB External Interfaces
 *
 * Multiplies an input scalar (multiplier) 
 * times a 1xN matrix (inMatrix)
 * and outputs a 1xN matrix (outMatrix)
 *
 * The calling syntax is:
 *
 *		outMatrix = arrayProduct(multiplier, inMatrix)
 *
 * This is a MEX file for MATLAB.
*/
#include "mex.h"

/* The gateway function */
void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, const mxArray *prhs[])
{
/* variable declarations here */

    double multiplier;      /* input scalar */
    double *inMatrix;       /* 1xN input matrix */
    mwSize ncols;           /* size of matrix */
    double *outMatrix;      /* output matrix */



if(nrhs != 2) {
    mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs",
                      "Two inputs required.");
}

if(nlhs != 1) {
    mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nlhs",
                      "One output required.");
}

/* make sure the first input argument is scalar */
if( !mxIsDouble(prhs[0]) || 
     mxIsComplex(prhs[0]) ||
     mxGetNumberOfElements(prhs[0]) != 1 ) {
    mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notScalar",
                      "Input multiplier must be a scalar.");
}

if( !mxIsDouble(prhs[1]) || 
     mxIsComplex(prhs[1])) {
    mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notDouble",
        "Input matrix must be type double.");
}

/* check that number of rows in second input argument is 1 */
if(mxGetM(prhs[1]) != 1) {
    mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notRowVector",
                      "Input must be a row vector.");
}

    
    
void arrayProduct(double x, double *y, double *z, int n)
{
  int i;
  
  for (i=0; i<n; i++) {
    z[i] = x * y[i];
  }
}