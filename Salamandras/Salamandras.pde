//head
Jugador p1;
Jugador p2;
Jugador J1;
Jugador J2;
Jugador J3;
Jugador J4;
Jugador J5;
Jugador J6;
Pantallas P1;
Pantallas P2;
Pantallas P3;
Pantallas P4;
int Estado= 0;
boolean Jugo1 =false;
boolean Jugo2 = false;
int D1=0;
int D2=0;
int turno;


void setup(){
  size(1200,600);
  
  p1 = new Jugador();
  p2 = new Jugador();
  
  J1 = new Jugador(300,300,0,10,color(0,200,80),100);
  J2 = new Jugador(300,300,0,20,color(0,200,40),100);
  J3 = new Jugador(300,300,0,30,color(0,200,120),100);
  J4 =new Jugador(900,300,1,10,color(50,100,180),100);
  J5 =new Jugador(900,300,1,20,color(50,50,180),100);
  J6 =new Jugador(900,300,1,30,color(50,150,180),100);
  P1 = new Pantallas();
  P2 = new Pantallas();
  P3 = new Pantallas();
  P4 = new Pantallas();
  
}

void draw(){
   background(0,255,180);   
   switch(Estado){
    case 0:
      P1.Pan1();
      if(key== ENTER){
        Estado=1;  
      }  
    break;
    
    case 1:
      P2.Pan2(); 
      switch(key){
         case 'a' :
            Jugo1 = true;
            J1.dibujarPersonaje();
            D1 = 0;
         break;
         
         case 's':
            Jugo1 = true;
            J2.dibujarPersonaje();   
            D1 = 1;
         break;
         
         case 'd':
            Jugo1 = true;
            J3.dibujarPersonaje();  
            D1=2;
         break;
         
         case '1':
            Jugo2 = true;
            J4.dibujarPersonaje(); 
            D2=5;
         break;
         
         case '2':
            Jugo2 = true;
            J5.dibujarPersonaje();  
            D2=3;
         break;
         
         case '3':
            Jugo2 = true;
            J6.dibujarPersonaje(); 
            D2=7;
         break;   
      }
         if(Jugo1 && Jugo2){
           Estado=2;
         }
    break;
       
    case 2:
      P3.Pan3();
      BarraVida();
      switch(D1){
        case 0:
          J1.dibujarPersonaje();
        break;
       
        case 1:
          J2.dibujarPersonaje();
        break;
        
        case 2:
          J3.dibujarPersonaje();
        break;
      }
      
      switch(D2){
        case 5:
          J4.dibujarPersonaje();
        break;
       
        case 3:
          J5.dibujarPersonaje();
        break;
       
        case 7:
          J6.dibujarPersonaje();
        break;
      }
     
      if(p1.vida <= 0 || p2.vida <= 0){
        Estado = 3;
      }
    break;
   
     case 3:
       P4.Pan4();
       if(p1.vida<=0){
         pushMatrix();
         translate(-300,0);
         p2.dibujarPersonaje();
          popMatrix();
       }
       if(p2.vida<=0){
         pushMatrix();
         translate(300,0);
         p1.dibujarPersonaje();
         popMatrix();
       }
       if(keyPressed){
         if(key == ' '){
           Estado =0 ;
           Jugo1 = false;
           Jugo2 = false;
           J1.vida = 100;
           J2.vida = 100;
           J3.vida = 100;
           J4.vida = 100;
           J5.vida = 100;
           J6.vida = 100;
         }
       }
     break;
  }
} 


class Jugador{
  //Atributos
   
   float tamano=120;
   color c;
   float x;
   float y;
   int tipo;
   float vida;
   float poder;

  //Metodos
   Jugador(){    
     tamano=120;
     x= 0;
     y= 0;
     tipo=0;
     vida=100;
     poder=0;
   }
   
   Jugador(int x_, int y_,int tipo_, int poder_, color c_,int vida_){
     x=x_;
     y=y_;
     tipo=tipo_;
     poder= poder_;
     c= c_;
     vida=vida_;
   } 
   

  
   void dibujarPersonaje(){
   //apariencia fisica del personaje
     if(tipo==0){
       pushMatrix();
       ellipseMode(CENTER);
       stroke(1);
       fill(c);
       ellipse(x,y-tamano/2,tamano,tamano);
      
       rectMode(CENTER);
       fill(c);
       //noStroke();
       rect(x,y,tamano,tamano);
       translate(30,30);
       rect(x-30,y+tamano/2,tamano/2+10,tamano/2);
       translate(30,70);
       rect(x-60,y+tamano/3,tamano/3,tamano/3);
       translate(30,45);
       rect(x-90,y+tamano/4,tamano/4,tamano/4);
       popMatrix();
      
       
      //linea
       pushMatrix();
       fill(0);
       stroke(2);
       line(x,y-tamano+30,x,y+tamano*1.8);
       
       //ojos
       fill(0);
       ellipse(x+tamano/4,y-tamano+30,15,15);
       translate(-30,0);
       ellipse(x,y-tamano+30,15,15);
       popMatrix();
     }  
     else if(tipo==1){
       pushMatrix();
       ellipseMode(CENTER);
       //noStroke();
       fill(c);
       ellipse(x,y-tamano/2,tamano,tamano);
       ellipseMode(CENTER);
       fill(c);
       //noStroke();
       ellipse(x,y,tamano,tamano);
       translate(30,30);
       ellipse(x-30,y+tamano/2,tamano/2+10,tamano/2);
       translate(30,70);
       ellipse(x-60,y+tamano/3,tamano/3,tamano/3);
       translate(30,45);
       ellipse(x-90,y+tamano/4,tamano/4,tamano/4);
       popMatrix();
       pushMatrix();
       //linea
       fill(0);
       stroke(2);
       line(x,y-tamano+30,x,y+tamano*1.8);
       //ojos
       fill(0);
       ellipse(x+tamano/4,y-tamano+30,15,15);
       translate(-30,0);
       ellipse(x,y-tamano+30,15,15);
       popMatrix();
     }
   }
 }  
 
 void BarraVida(){
   p1 = J1;
   p1 = J2;
   p1 = J3;
   
   p2 = J4;
   p2 = J5;
   p2 = J6;
    
   rectMode(CORNER);
   noStroke();
   fill(0);
   rect(0,35,p1.vida/100f*600,30);
   rect(width/2,35,p2.vida/100f*600,30);
   
   if(turno == 0){
     if(keyPressed){
       if (key== 'z'){
         p2.vida = p2.vida-p1.poder;
         turno = 1;
       }
     }
   }
   
   if(turno == 1){
     if(keyPressed){
       if (key== '0'){
         p1.vida = p1.vida - p2.poder;
         turno = 0;
       }
     }
   }
   
 }


class Pantallas{
  //Atributos
  color c;
  PFont font= createFont("ArialMT-32.vlw",70);

  
  
  //METODOS
 
    void DibujarPantalla(){
      
      switch(Estado){
        case 0:
        Pan1();
        Estado = 1;  
     
      break;
        case 1:
        Pan2();
        Estado = 2;
      
      break;
        case 2:
        Pan3();
        Estado = 3;
      break;
        case 3:
        Pan4();
        Estado = 0;
      break;
      
      }  
    }


  
  void Pan1(){
    //nombre del juego y boton Star, instrcuccion: Presiona Enter para Star
   
    background(140,250,100,190);
    fill(0);
    textFont(font);
    text("Salamandras",width/2-250,height/2);
    noStroke();
    rectMode(CENTER);
    rect(width/2-50,height/2+100,100,50);
    fill(255);
    textSize(30);
    text("PRESS ENTER",width/2-150,height/2+180);
    fill(random (255));
    text("STAR",width/2-90,height/2+110);
    
    
    
  }
  
  void Pan2(){
    //cada jugador seleeciona un personaje, 
    
    background(140,250,140,30);
    fill(230,80,140,200);
    noStroke();
    rect(width/2,1200,600,600);
    textFont(font);
    textSize(20);
    text("JUGADOR 1", 20,30);
    text("JUGADOR 2", 1060,30);
    textSize(50);
    text("Personajes",width/2-130,70);
    pushMatrix();
    scale(.7);
    translate(-180,70); 
    J1.dibujarPersonaje();
    textSize(30);
    text("Ag",280,550);
    textSize(20);
    text("PRESS A",260,150);
    textSize(30);
    fill(255,100,0);
    noStroke();
    ellipse(300,570,20,20);
    stroke(1);
    translate(280,0); 
    J2.dibujarPersonaje();
    text("Ti",285,550);
    textSize(20);
    text("PRESS S",260,150);
    textSize(30);
    fill(255,100,0);
    noStroke();
    ellipse(295,570,20,20);
    ellipse(325,570,20,20);
    stroke(1);
    translate(280,0); 
    J3.dibujarPersonaje();
    text("Me",285,550);
    textSize(20);
    text("PRESS D",260,150);
    textSize(30);
    fill(255,100,0);
    noStroke();
    ellipse(295,570,20,20);
    ellipse(325,570,20,20);
    ellipse(355,570,20,20);
    stroke(1);
    translate(-250,0); 
    J4.dibujarPersonaje();
    text("Fu",885,550);
    textSize(20);
    text("PRESS 1",860,150);
    textSize(30);
    noStroke();
    fill(255,100,0);
    ellipse(900,570,20,20);
    stroke(1);
    translate(280,0); 
    J5.dibujarPersonaje();
    text("Ai",885,550);
    textSize(20);
    text("PRESS 2",860,150);
    textSize(30);
    fill(255,100,0);
    noStroke();
    ellipse(895,570,20,20);
    ellipse(925,570,20,20);
    stroke(1);
    translate(280,0); 
    J6.dibujarPersonaje();
    text("Co",885,550);
    textSize(20);
    text("PRESS 3",860,150);
    textSize(30);
    fill(255,100,0);
    noStroke();
    ellipse(895,570,20,20);
    ellipse(925,570,20,20);
    ellipse(955,570,20,20);
    stroke(1);
    popMatrix();
    
  }
  
  void Pan3(){
    
    background(140,250,140,100);
    fill(230,80,140,200);
    noStroke();
    rectMode(CORNER);
    rect(600,0,600,600);
    fill(0);
    textFont(font);
    textSize(20);
    text("JUGADOR 1", 20,30);
    fill(random(255));
    text("Attack  with Z",220,100);
    fill(0);
    text("JUGADOR 2", 1060,30);
    fill(random(255));
    text("Attack  with 0",840,100);
    } 
  
  void Pan4(){
    
    background(140,250,140,100);
    
    fill(random(255));
    textFont(font);
    textSize(50);
    text("¡GANASTE!",width/2-130,70);
    textSize(30);
    text("PRESS SPACE TO PLAY AGAIN",390,550);    
    
  }
  
  
}



   
