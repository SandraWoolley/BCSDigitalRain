/* A simple Processing sketch creating a Matrix-style 'digital rain' effect
  for the BCS Stoke-on-Trent and Staffordshire Creative Coding event at Keele University Digital Society Institute 
  https://www.keele.ac.uk/digital-society-institute/ @Keele_DSI
  Sandra Woolley
*/
int[] h = new int[80];
int[] index=new int[80];
//int selectString=[4,2,3,1,0]
String[] rainStrings={"010 BCS 101","01010 BCS Stoke-on-Trent and Staffordshire branch 010101", "010 BCS 0101", "010 CREATIVE CODING  101", "010 BCS @KeeleDSI BCS 101"};

void setup() {
  size(960, 540);
  frameRate(8);
  textSize(20);
  textAlign(CENTER);
  //initialise array with random values for height
  for (int n = 0; n < h.length; n++) {
    h[n] = round(random(60));
  }
}

void draw() {
  //draw slightly transparent black rectangle to give a fade effect
  fill(color(0, 15));
  rect(0, 0, width, height);
  //draw strings
  fill(100, 255, 100);
  for (int n = 0; n < h.length; n++) {
    //for simplicity there is some hardcoding (we could have replaced 5 with rainStrings.length() )
    text(rainStrings[n%5].charAt(index[n]), n*18+9, h[n]*20);
    index[n]=(index[n]+1)%rainStrings[n%5].length();
    h[n] = (h[n] + 1)%60;
  }
}
