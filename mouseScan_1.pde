void mouseScan_1(int x,int y,int rect_width, int rect_height){
  if(mousePressed && mouseX>=x && mouseX<=x+rect_width && mouseY>=y && mouseY<=y+rect_height){
    fill(#B4B1B1);
  }
  else{
    fill(255);
  }
}
