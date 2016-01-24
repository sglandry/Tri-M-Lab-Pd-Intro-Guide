int poseInt, poseS, poseMIDI= 0;
String pose;

void convertPose(){
   if ((pose=="REST")||(pose=="UNCKNOWN")) poseInt = 0;
    else if (pose=="FIST") poseInt = 1;
    else if (pose=="FINGERS_SPREAD") poseInt = 2;
    else if (pose=="WAVE_IN") poseInt = 3;
    else if (pose=="WAVE_OUT") poseInt = 4;
    else if (pose=="DOUBLE_TAP") poseInt = 5;
}

void sendPose(){
  
   if(MIDI){
   poseMIDI = int(poseInt*25.4); 
   myBus.sendControllerChange(chMIDI, 20, poseMIDI);
   /*cc20 send pose messages
     v0 = UNCKNOWN
     v25 = FIST
     v50 = FINGERS_SPREAD
     v76 = WAVE_IN
     v101 = WAVE_OUT
     127 = DOUBLE_TAP
   */
   }  
   
   if(OpenSoundControl){ 
    OscMessage Pose = new OscMessage("/pose");
    
    poseS = poseInt*51; // scale poseI values into serial values
    // 0 = rest and uncknown
    // 51 = FIST
    // 102 = FINGERS_SPREAD
    // 153 = WAVE_IN
    // 204 = WAVE_OUT
    // 255 = DOUBLE_TAP
    
    Pose.add(pose);
    Pose.add(poseInt);
    Pose.add(poseS);

    oscP5.send(Pose, myRemoteLocation);
 }
}
