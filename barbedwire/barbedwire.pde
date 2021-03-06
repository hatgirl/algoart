

int colorconst = 100;
int xdim = 5600;
int ydim = 4200;
int check_until = 3000;

double zoom = 1;
double dimScale = (4.0/xdim)/zoom;

double cx = -1.375;
double cy = 0.03;


void setup(){
 size(xdim, ydim, P2D);
 colorMode(HSB);
}

void draw(){
  
for (int x = 0; x < xdim; x++){
  for (int y = 0; y < ydim; y++){
      double zx = (x - xdim/2)/(0.5*zoom*xdim);
      double zy = (y - ydim/2.0)/(0.5*zoom*xdim);
      
      double newzx = 0;
      double newzy = 0;
      int i = 0;
    while( (zx * zx + zy * zy)  < 4 && (i < check_until)){ 
      newzy = 2.0* zx * zy + cy;
      newzx = zx * zx - zy*zy + cx;
      zy = newzy;
      zx = newzx;
      i ++;
    }
    color c = color(i + colorconst % 256, i % 256, 255 - i*10 % 256 );
    
    if (i > (check_until - 1)){
      
      c = color((i + colorconst) % 256, 255, 0) ;
    }
    if (i < 4){
      c = color(  (i + colorconst)  & 256, 0, 255);
    }
    stroke(c); 
    point(x, y);
    
  }
}
save("barbed_wire.png");
}
