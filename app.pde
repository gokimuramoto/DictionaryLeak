



float x_eng,y_eng,x_jap,y_jap,x,y;
int ratio;
int len_eng,len_jap;
int num_link;
int r_node;
int maxCount=1000;
float minRadius = 2;
float maxRadius = 500;
int dX_cordinate=0;
int dY_cordinate=0;

float[] r_nodes = new float[maxCount]; //radius
float[] r_nodes_jap = new float[maxCount]; //radius
int[] closestIndex = new int[maxCount]; 
int LEN_J,LEN_E;


String[] eng_word={"美しい", "綺麗な","立派な", "素晴らしい","素敵な", "麗しい","巧みな", "かなりの","見事な","ハンサムな", "なかなかよい"};
String[] jap_word={"beautiful", "beauteous","better-looking", "good-looking","handsome", "reputable","stunning", "not bad","groovy","swell", "nifty"};
float jap_x[]={0.03290053,0.469605556,0.188770281,0.2421303,0.524332472,-0.226814284,-0.057300955,-0.21929059,-0.499816493,-0.464604007,-0.15686338,0.194256924};
float jap_y[]={0.066827367,0.187178842,0.298062709,-0.027605226,-0.171234574,0.292171651,-0.244845365,0.011943335,-0.019071588,-0.342864123,-0.405502759,-0.410596321};
int jap_link[][]={{0,1,2,3,4},{5,0,8888,8888,8888},{8888,8888,8888,8888,8888},{0,8888,8888,8888,8888},{6,7,8,9,8888,0},{2,8888,8888,8888,8888},{4,3,8888,8888,8888},{10,8888,8888,8888,8888},{11,8888,8888,8888,8888},{8888,8888,8888,8888,8888},{4,3,8888,8888,8888},{12,13,3,14,8888}};


float eng_x[]={0.195279613,0.068368909,-0.226151739,-0.20547592,-0.046666513,0.48643871,0.655301837,0.58203224,0.36932524,0.450183207,-0.218730428,-0.499204169,0.289903224,0.176999559,0.055814401};
float eng_y[]={0.040639077,0.256236131,0.291113816,-0.253947466,-0.280596903,0.219223447,-0.224559249,-0.019924972,-0.085772808,-0.295688992,0.013153174,-0.020987267,-0.492751299,-0.302563174,-0.541428788};
int eng_link[][]={{0,1,2,3,4},{0,8888,8888,8888,8888},{5,8888,8888,8888,8888},{6,7,8,9,10},{11,8888,8888,8888,8888},{8888,8888,8888,8888,8888},{12,8888,8888,8888,8888},{13,8888,8888,8888,8888},{6,8888,8888,8888,8888},{4,8888,8888,8888,8888},{14,8888,8888,8888,8888},{15,8888,8888,8888,8888},{16,8888,8888,8888,8888},{17,18,17,19,16},{20,21,8888,8888,8888}};

void setup(){
  frameRate(300);
  
  colorMode(HSB);
  size(1600,900);

  background(0);
  ratio=500;

  LEN_J=10;
  LEN_E=10;
  len_eng=10;
  len_eng=10;
  num_link=5;
  print(jap);
  
  
  
  closestIndex[0] = 0;
  for(int i = 0;i<len_eng+len_jap;i++){
    r_nodes[i]=minRadius;
    r_nodes_jap[i]=minRadius;
  }
  


}
void draw(){
  colorMode(HSB);
  background(255,45);
  translate(0,0);
  fill(0);
  text("ratio:"+ratio/200,50,50);
  translate(width/2+dX_cordinate,height/2+dY_cordinate);
  
  boolean intersection = false;
  boolean touch = false;
  //JAP= loadTable("jap.csv");
  //ENG = loadTable("eng.csv");
  //jap=JAP;
  //eng=ENG;
  len_jap=LEN_J;
  len_eng=LEN_E;
  

  
  for(int i = 0;i<len_jap;i++){
    
    
    //x_jap=jap.getFloat(i,num_link+1)*ratio;
    //y_jap=jap.getFloat(i,num_link+2)*ratio;
    
    x_jap=jap_x[i]*ratio;
    y_jap=jap_y[i]*ratio;
    
    for(int j=0;j<num_link;j++){
      /*
      if( Float.isNaN(jap.getFloat(i,j)) == false && jap.getFloat(i,j)<len_jap ){
        stroke(50,50);
        int target=int(jap.getFloat(i,j));
        if(target<len_eng){
          line(x_jap,y_jap,ratio*eng.getFloat(target,num_link+1),ratio*eng.getFloat(target,num_link+2));
        }
        //line(x_jap,y_jap,ratio*eng.getFloat(int(jap.getFloat(i,j)),num_link+1),ratio*eng.getFloat(int(jap.getFloat(i,j)),num_link+2));
      }*/
      if( jap_link[i][j] != 8888 && jap_link[i][j]<len_jap ){
        stroke(50,50);
        int target=int(jap_link[i][j]);
        if(target<len_eng){
          line(x_jap,y_jap,ratio*eng_x[target],ratio*eng_y[target]);
        }
        //line(x_jap,y_jap,ratio*eng.getFloat(int(jap.getFloat(i,j)),num_link+1),ratio*eng.getFloat(int(jap.getFloat(i,j)),num_link+2));
      }
    }
    fill(#0E3E8E);
    noStroke();
    ellipse(x_jap,y_jap,10,10);
    //text(jap.getString(i,0),x_jap,y_jap);
    text(jap_word[i],x_jap,y_jap); 
  }
  
  //eng

  for(int i = 0;i<len_eng;i++){
    //x_eng=eng.getFloat(i,num_link+1)*ratio;
    //y_eng=eng.getFloat(i,num_link+2)*ratio;
    x_eng=eng_x[i]*ratio;
    y_eng=eng_y[i]*ratio;
    
    for(int j=0;j<num_link;j++){

      if( eng_link[i][j] != 8888 && eng_link[i][j]<len_eng ){
        stroke(50,50);
        int target=int(eng_link[i][j]);
        if(target<len_jap){
          line(x_eng,y_eng,ratio*jap_x[target],ratio*jap_y[target]);
        }
        //line(x_jap,y_jap,ratio*eng.getFloat(int(jap.getFloat(i,j)),num_link+1),ratio*eng.getFloat(int(jap.getFloat(i,j)),num_link+2));
      }
    }
    fill(#FA1235);
    noStroke();
    ellipse(x_eng,y_eng,10,10);
    //text(eng.getString(i,0),x_eng,y_eng); 
    text(eng_word[i],x_eng,y_eng); 
  }

    
  
}


void  keyPressed( ) {
  if( key == 'z' ){
    ratio=ratio+20;
  } else if( key == 'x' ){
    ratio=ratio-20;
  }
  if (key == CODED) {      // コード化されているキーが押された
    if (keyCode == RIGHT) {    // キーコードを判定
          dX_cordinate+= -10;
    } else if (keyCode == LEFT) {
           dX_cordinate+= 10;
    }else if (keyCode == UP) {
           dY_cordinate+= -10;
    }else if (keyCode == DOWN) {
           dY_cordinate+= +10;
    }
  }

}
