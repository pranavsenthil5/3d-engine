

static class matrix
{
  int rowLength=0;
  int columnLength=0;
  double[][] mat;

  matrix(int x, int y)
  {
    rowLength = x;
    columnLength = y;

    mat = new double[rowLength][columnLength];
  }

  matrix(int x)
  {
    rowLength = x;
    columnLength = x;

    mat = new double[rowLength][columnLength];
  }
  
  void updateSize()
  {
     rowLength = mat.length;
     columnLength = mat[0].length;
  }

  static double[][] identityMatrix(int x)
  {
    double[][] I = new double[x][x];
    
    for(int i=0;i<x;i++)
    {
      for(int j=0;j<x;j++)
      {
        I[i][j]=0;
        if(i==j)
        {
          I[i][j]=1;
        }
      }
    }
    return I;
  }
  
  matrix(double[][] m)
  {
    
    mat = new double[m.length][m[0].length];
    
    for (int i =0; i<m.length; i++)
    {
      for (int j=0; j<m[i].length; j++)
      {
        this.mat[i][j] = m[i][j];
      }
    }
    updateSize();
  }
  
  matrix(int[][] m)
  {
    
    mat = new double[m.length][m[0].length];
    
    for (int i =0; i<m.length; i++)
    {
      for (int j=0; j<m[i].length; j++)
      {
        this.mat[i][j] = m[i][j];
      }
    }
    updateSize();
  }

  void display()
  {
    System.out.println("In function!");
    System.out.println("[");
    for (int i =0; i<rowLength; i++)
    {
      for (int j=0; j<columnLength; j++)
      {
        System.out.print(this.mat[i][j]+"\t");
      }
      System.out.println();
    }
    System.out.println("]");
    
  }

  static double[][] matrixMultiplication(double [][] matA, double[][]matB)
  {
    double[][] resultantMatrix = new double [matA.length][matB[0].length];

    if (matA[0].length != matB.length)
    {
      System.out.println("Cannot multiply matrices");
    } else
    {
      //Going through the positions of the final matrix and asigning the value of A(i,offset)*B(offset,j)
      for (int i =0; i<resultantMatrix.length; i++)
      {
        for (int j=0; j<resultantMatrix[i].length; j++)
        {

          double temp=0.0;
          for (int offset=0; offset<matA[i].length; offset++)
          {
            temp += matA[i][offset] * matB[offset][j];
          }
          resultantMatrix[i][j] = temp;
        }
      }
    }

    return resultantMatrix;
  }
  
  void rotateMatrix(float theta)
  {
    double transArray[][] = {{cos(theta),-1*sin(theta)},
                              {sin(theta),cos(theta)}};
                              
    //matrix transMatrix = new matrix(transArray);
    
    mat = matrixMultiplication(transArray, mat);
    
                          
  }
}
