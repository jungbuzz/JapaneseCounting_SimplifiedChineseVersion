import http.requests.*;

PFont font1,font2,font3;


PostRequest runQuery;
int hposition=50;

String url;
int number=0;
String Type="";
char []type=new char[100];
boolean send=false;
boolean error=false;
boolean select_whether=false;
int []select_block;
int problem_which=0;
boolean end=false;
int score=0;
boolean correct=false;
boolean game_start=false;
boolean gameEnd_whether=false;
int choose_which=0;
int problem_number=0;
int max_number;
boolean read_whether=false;
String []readTemp=new String[0];
String []Data;
int data_length;
boolean challengeDecide_whether=true;//true为没有选，false为有至少一项已选择
String japanese_n;
boolean []Type_select=new boolean[12];
int enter_count=0;

void setup(){
  size(800, 600);
  background(0);
  font1 = createFont("NotoSerifTC-Regular.otf",32);
  font2 = createFont("NotoSansJP-Bold.otf",32);
  font3 = createFont("NotoSansSC-Bold.otf",32);
  textFont(font1);
  textFont(font2);
  textFont(font3);
  frameRate(60);
  send=false;
  error=false;
  choose_which=0;
  game_start=false;
  gameEnd_whether=false;
  read_whether=false;
  score=0;
  for(int i=0;i<Type_select.length;i++){
    Type_select[i]=false;
  }
}

void draw(){
  background(0);
  textSize(25);
  fill(#DB8700);
  if(!game_start){
    challengeDecide_whether=true;
    for(int i=0;i<Type_select.length;i++){
      challengeDecide_whether &= !Type_select[i];
    }
    textSize(25);
    fill(255);
    text("若打不出字，请先点一下输入框，\n或者确认一下键盘输入是否为英文输入法。 \n必须选取范围才能开始\n按ENTER送出再按一次下一题",55,400);
    rect(400,50,150,40);
    text("题数:",350,80);
    fill(0);
    text(Type,405,80);
    mouseScan_2(0);
    rect(50,150,50,50);
    mouseScan_2(1);
    rect(120,150,50,50);
    mouseScan_2(2);
    rect(190,150,50,50);
    mouseScan_2(3);
    rect(260,150,50,50);
    mouseScan_2(4);
    rect(330,150,50,50);
    mouseScan_2(5);
    rect(400,150,50,50);
    mouseScan_2(6);
    rect(470,150,50,50);
    mouseScan_2(7);
    rect(50,230,50,50);
    mouseScan_2(8);
    rect(120,230,50,50);
    mouseScan_2(9);
    rect(190,230,50,50);
    mouseScan_2(10);
    rect(260,230,50,50);
    mouseScan_2(11);
    rect(330,230,50,50);
    fill(0);
    textSize(35);
    text("あ",58,190);
    text("か",128,190);
    text("さ",198,190);
    text("た",268,190);
    text("な",338,190);
    text("は",408,190);
    text("ま",478,190);
    text("や",58,270);
    text("ら",128,270);
    text("わ",198,270);
    text("濁",268,270);
    text("拗",338,270);
    mouseScan_1(650,150,120,50);
    rect(650,150,120,50);
    mouseScan_1(680,230,70,40);
    rect(680,230,70,40);
    mouseScan_1(200,300,120,50);
    rect(200,300,120,50);
    mouseScan_1(400,300,120,50);
    rect(400,300,120,50);
    fill(0);
    textSize(25);
    text("清除选择",655,180);
    text("全选",690,260);
    text("练平假名",205,330);
    text("练片假名",405,330);
    if(error){
      fill(255);
      text("请确认是否输入完整",55,200);
    }
  }
  if(game_start && choose_which!=0){
    if(!read_whether){
      if(Type_select[0]){
        String []A_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%205&gid=0");
        readTemp=concat(readTemp,A_row);
      }
      if(Type_select[1]){
        String []Ka_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%205%20offset%205&gid=0");
        readTemp=concat(readTemp,Ka_row);
      }
      if(Type_select[2]){
        String []Sa_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%205%20offset%2010&gid=0");
        readTemp=concat(readTemp,Sa_row);
      }
      if(Type_select[3]){
        String []Ta_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%205%20offset%2015&gid=0");
        readTemp=concat(readTemp,Ta_row);
      }
      if(Type_select[4]){
        String []Na_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%205%20offset%2020&gid=0");
        readTemp=concat(readTemp,Na_row);
      }
      if(Type_select[5]){
        String []Ha_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%205%20offset%2025&gid=0");
        readTemp=concat(readTemp,Ha_row);
      }
      if(Type_select[6]){
        String []Ma_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%205%20offset%2030&gid=0");
        readTemp=concat(readTemp,Ma_row);
      }
      if(Type_select[7]){
        String []Ya_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%203%20offset%2035&gid=0");
        readTemp=concat(readTemp,Ya_row);
      }
      if(Type_select[8]){
        String []Ra_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%205%20offset%2038&gid=0");
        readTemp=concat(readTemp,Ra_row);
      }
      if(Type_select[9]){
        String []Wa_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%202%20offset%2043&gid=0");
        readTemp=concat(readTemp,Wa_row);
      }
      if(Type_select[10]){
        String []Voiced_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%2025%20offset%2046&gid=0");
        readTemp=concat(readTemp,Voiced_row);
      }
      if(Type_select[11]){
        String []Yoon_row=loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=offset%2071&gid=0");
        readTemp=concat(readTemp,Yoon_row);
      }
      String[] word_N = loadStrings("https://docs.google.com/spreadsheets/u/0/d/1FugGPwyIltcoKSwaeDuyXHeFC1qG3bc5nw9Vp5czH5M/gviz/tq?tqx=out:csv&tq=limit%201%20offset%2045&gid=0");
      readTemp=concat(readTemp,word_N);
      Data=readTemp;
      data_length=Data.length;
      Type="";
      number=0;
      read_whether=true;
    }
    
    if(problem_number>data_length){
      max_number=data_length;
    }
    else{
      max_number=problem_number;
    }
    if(problem_which>=max_number){
      gameEnd_whether=true;
      fill(255);
      text("您的成绩:"+score,355,150);
      text("满分:"+5*max_number,355,180);
      mouseScan_1(350,250,120,50);
      rect(350,250,120,50);
      fill(0);
      textSize(25);
      text("再来一次",355,280);
    }
    if(problem_which<max_number){
      gameEnd_whether=false;
      textSize(25);
      fill(255);
      rect(400,50,150,40);
      text("拼音:",330,80);
      fill(0);
      text(Type,405,80);
      mouseScan_1(600,500,90,40);
      rect(600,500,90,40);
      fill(0);
      text("下一题",605,530);
      mouseScan_1(700,500,70,40);
      rect(700,500,70,40);
      fill(0);
      text("送出",705,530);
      if(!select_whether){
        IntList scrambler = new IntList();//产生整数阵列
        for (int i=0; i<data_length; i++){
          scrambler.append(i);//加入所有数字
        }
        scrambler.shuffle();//洗乱
        select_block=scrambler.array();
        select_whether=true;
      }
      Data[select_block[problem_which]]=Data[select_block[problem_which]].replace('"',' ');
      trim(Data[select_block[problem_which]]);
      String []list=split(Data[select_block[problem_which]],",");
      fill(255);
      if(choose_which==1){
        println(problem_which + 1 + ". " + "平假名: "+list[0]);
        textSize(30);
        text(problem_which + 1 + ". " + "平假名: "+list[0], 20, hposition);
      }
      if(choose_which==2){
        println(problem_which + 1 + ". " + " 片假名: "+list[1]);
        textSize(30);
        text(problem_which + 1 + ". " + " 片假名: "+list[1], 20, hposition);
      }
      if(send){
        fill(255);
        enter_count=1;
        if(!Type.equals(trim(list[2])) && !Type.equals(trim(list[3]))){
          text("错误:"+Type,55,200);
          if(choose_which==1){
            if(trim(list[3]).length()>0){
              text("正确答案:"+ (problem_which +1) + ". " + "平假名: "+list[0]+" 拼音: "+list[2]+"("+list[3]+")",55,300);
            }
            else{
              text("正确答案:"+ (problem_which +1) + ". " + "平假名: "+list[0]+" 拼音: "+list[2],55,300);
            }
          }
          if(choose_which==2){
            if(trim(list[3]).length()>0){
              text("正确答案:"+ (problem_which +1) + ". " +" 片假名: "+list[1]+" 拼音: "+list[2]+"("+list[3]+")",55,300);
            }
            else{
              text("正确答案:"+ (problem_which +1) + ". " +" 片假名: "+list[1]+" 拼音: "+list[2],55,300);
            }
          }
          correct=false;
        }
        else{
          if(choose_which==1){
            if(trim(list[3]).length()>0){
              text("答对:"+ (problem_which + 1 )+ ". " + "平假名: "+list[0]+" 拼音: "+list[2]+"("+list[3]+")",55,200);
            }
            else{
              text("答对:"+ (problem_which + 1 )+ ". " + "平假名: "+list[0]+" 拼音: "+list[2],55,200);
            }
          }
          if(choose_which==2){
            if(trim(list[3]).length()>0){
              text("答对:"+ (problem_which + 1 )+ ". " +" 片假名: "+list[1]+" 拼音: "+list[2]+"("+list[3]+")",55,200);
            }
            else{
              text("答对:"+ (problem_which + 1 )+ ". " +" 片假名: "+list[1]+" 拼音: "+list[2],55,200);
            }
          }
          correct=true;
        }
      }
      hposition=50;
      if(error){
        fill(255);
        text("请确认是否输入完整",55,400);
      }
    }
  }
}


void keyPressed() {
  if(!game_start){
    if(keyCode != BACKSPACE && keyCode!=LEFT && keyCode!=SHIFT && keyCode!=TAB && keyCode!=ENTER && number<3){
      if(key >= '0' && key <= '9'){
        type[number]=key;
        Type=Type+type[number];
        number++;
      }
    }
    if(key == BACKSPACE){
      if(number>0){
        number--;
      }
      Type="";
      for(int i=0;i<number;i++){
        Type=Type+type[i];
      }
    }
  }
  if(!send && game_start){
    if(keyCode != BACKSPACE && keyCode!=LEFT && keyCode!=SHIFT && keyCode!=TAB && keyCode!=ENTER && number<6){
      type[number]=key;
      Type=Type+type[number];
      number++;
    }
    if(key == BACKSPACE){
      if(number>0){
        number--;
      }
      Type="";
      for(int i=0;i<number;i++){
        Type=Type+type[i];
      }
    }
    if(key == ENTER){
      if(Type.length()>0){
        error=false;
        send=true;
      }
      else{
        error=true;
        send=false;
      }
    }
  }
  if(send && game_start && key == ENTER){
    if(enter_count==1){
      problem_which++;
      if(correct){
        score+=5;
        correct=false;
      }
      error=false;
      send=false;
      Type="";
      number=0;
      enter_count=0;
    }
  }
}

void keyTyped() {
  println(Type);
}

void mouseClicked(){
  //あ
  if(mouseX>=50 && mouseX<=100 && mouseY>=150 && mouseY<=200){
    if(!game_start){
      if(!Type_select[0]){
        Type_select[0]=true;
      }
      else{
        Type_select[0]=false;
      }
    }
  }
  //か
  if(mouseX>=120 && mouseX<=170 && mouseY>=150 && mouseY<=200){
    if(!game_start){
      if(!Type_select[1]){
        Type_select[1]=true;
      }
      else{
        Type_select[1]=false;
      }
    }
  }
  //さ
  if(mouseX>=190 && mouseX<=240 && mouseY>=150 && mouseY<=200){
    if(!game_start){
      if(!Type_select[2]){
        Type_select[2]=true;
      }
      else{
        Type_select[2]=false;
      }
    }
  }
  //た
  if(mouseX>=260 && mouseX<=310 && mouseY>=150 && mouseY<=200){
    if(!game_start){
      if(!Type_select[3]){
        Type_select[3]=true;
      }
      else{
        Type_select[3]=false;
      }
    }
  }
  //な
  if(mouseX>=330 && mouseX<=380 && mouseY>=150 && mouseY<=200){
    if(!game_start){
      if(!Type_select[4]){
        Type_select[4]=true;
      }
      else{
        Type_select[4]=false;
      }
    }
  }
  //は
  if(mouseX>=400 && mouseX<=450 && mouseY>=150 && mouseY<=200){
    if(!game_start){
      if(!Type_select[5]){
        Type_select[5]=true;
      }
      else{
        Type_select[5]=false;
      }
    }
  }
  //ま
  if(mouseX>=470 && mouseX<=520 && mouseY>=150 && mouseY<=200){
    if(!game_start){
      if(!Type_select[6]){
        Type_select[6]=true;
      }
      else{
        Type_select[6]=false;
      }
    }
  }
  //や
  if(mouseX>=50 && mouseX<=100 && mouseY>=230 && mouseY<=280){
    if(!game_start){
      if(!Type_select[7]){
        Type_select[7]=true;
      }
      else{
        Type_select[7]=false;
      }
    }
  }
  //ら
  if(mouseX>=120 && mouseX<=170 && mouseY>=230 && mouseY<=280){
    if(!game_start){
      if(!Type_select[8]){
        Type_select[8]=true;
      }
      else{
        Type_select[8]=false;
      }
    }
  }
  //わ
  if(mouseX>=190 && mouseX<=240 && mouseY>=230 && mouseY<=280){
    if(!game_start){
      if(!Type_select[9]){
        Type_select[9]=true;
      }
      else{
        Type_select[9]=false;
      }
    }
  }
  
  //浊音及半浊音
  if(mouseX>=260 && mouseX<=310 && mouseY>=230 && mouseY<=280){
    if(!game_start){
      if(!Type_select[10]){
        Type_select[10]=true;
      }
      else{
        Type_select[10]=false;
      }
    }
  }
  //拗音
  if(mouseX>=330 && mouseX<=380 && mouseY>=230 && mouseY<=280){
    if(!game_start){
      if(!Type_select[11]){
        Type_select[11]=true;
      }
      else{
        Type_select[11]=false;
      }
    }
  }
  //取消选择
  if(mouseX>=650 && mouseX<=770 && mouseY>=150 && mouseY<=200){
    if(!challengeDecide_whether && !game_start){
      for(int i=0;i<Type_select.length;i++){
        Type_select[i]=false;
      }
      challengeDecide_whether=true;
    }
  }
  
  //全选
  if(mouseX>=680 && mouseX<=750 && mouseY>=230 && mouseY<=270){
    if(!game_start){
      for(int i=0;i<Type_select.length;i++){
        Type_select[i]=true;
      }
    }
  }
  
  if(mouseX>=200 && mouseX<=320 && mouseY>=300 && mouseY<=350){
    if(!game_start && !challengeDecide_whether){
      if(Type.length()>0){
        problem_number=int(Type);
        error=false;
        choose_which=1;
        game_start=true;
      }
      else{
        error=true;
      }
    }
  }
  if(mouseX>=400 && mouseX<=520 && mouseY>=300 && mouseY<=350){
    if(!game_start && !challengeDecide_whether){
      if(Type.length()>0){
        problem_number=int(Type);
        error=false;
        choose_which=2;
        game_start=true;
      }
      else{
        error=true;
      }
    }
  }
  if(mouseX>=700 && mouseX<=770 && mouseY>=500 && mouseY<=540){
    if(Type.length()>0){
      error=false;
      send=true;
    }
    else{
      error=true;
      send=false;
    }
  }
  if(mouseX>=600 && mouseX<=690 && mouseY>=500 && mouseY<=540){
    if(send && game_start){
      problem_which++;
      if(correct){
        score+=5;
        correct=false;
      }
      error=false;
      send=false;
      Type="";
      number=0;
    }
  }
  if(mouseX>=350 && mouseX<=470 && mouseY>=250 && mouseY<=300){
    if(game_start && gameEnd_whether){
      game_start=false;
      gameEnd_whether=false;
      choose_which=0;
      problem_which=0;
      select_whether=false;
      read_whether=false;
      challengeDecide_whether=true;
      enter_count=0;
      readTemp=new String[0];
      for(int i=0;i<Type_select.length;i++){
        Type_select[i]=false;
      }
      problem_number=0;
      score=0;
      error=false;
      send=false;
      Type="";
      number=0;
    }
  }
}
