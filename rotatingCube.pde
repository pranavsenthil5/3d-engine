double coordinateArray[][] = {{50},
                              {50}};
                              
int degree = 2;
matrix point;
void setup(){
  background(255);
  size (1000,1000);
  translate(500,500);
  rectMode(CENTER);
  //rect(0,0,100,100);
  /*
  double arrayA[][] = {{1,2},
                        {3,4}};
  double arrayB[][] = {{5,6},
                        {7,8}};
  matrix a = new matrix(arrayA);
  matrix b = new matrix(arrayB);
  
  matrix I = new matrix(matrix.identityMatrix(2));
  System.out.println("Called function!");
  
  I.display();
  a.display();
  
  matrix c = new matrix(matrix.matrixMultiplication(a.mat,b.mat));
  c.display();
  */
  
  point = new matrix(coordinateArray);
  point.display();     
  //point.rotateMatrix(3.14);
  point.display();    
  
}

void draw(){
  background(255);
  translate(500,500);
  fill(0);
  strokeWeight(10);
  point(0,0); 
  point((int) round((float)coordinateArray[0][0]),(int)round((float)coordinateArray[1][0]));
  delay(50);
  update();
}

void update(){
  double radians = ((double)degree)*6.28/360; 
  point.rotateMatrix((float)radians);
  coordinateArray[0][0]= point.mat[0][0];
  coordinateArray[1][0]= point.mat[1][0];
}
