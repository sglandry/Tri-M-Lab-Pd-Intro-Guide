int gyroXMIDI, gyroYMIDI, gyroZMIDI; //cc7, cc8, cc9
int gyroSx, gyroSy, gyroSz = 0;


void sendGyro(){
  if(MIDI){   
     gyroXMIDI = int(gyro.x*0.127);
     gyroYMIDI = int(gyro.y*0.127);
     gyroYMIDI = int(gyro.z*0.127);
     
     myBus.sendControllerChange(chMIDI, 7, rollMIDI); // Send a Midi noteOn
     myBus.sendControllerChange(chMIDI, 8, pitchMIDI); // Send a Midi noteOn
     myBus.sendControllerChange(chMIDI, 9, yawMIDI); // Send a Midi noteOn
    }

if(OpenSoundControl){
  // Scale Midi Myo Value in serial Value
    gyroSx = int(gyro.x*0.255);
    gyroSy = int(gyro.y*0.255);
    gyroSz = int(gyro.z*0.255);

    OscMessage Gyro = new OscMessage("/gyro");
    OscMessage gyroS = new OscMessage("/gyroS");
   
    Gyro.add(gyro.x);
    Gyro.add(gyro.y);
    Gyro.add(gyro.z);
    
    gyroS.add(gyroSx);
    gyroS.add(gyroSy);
    gyroS.add(gyroSz);
    
    oscP5.send(Gyro, myRemoteLocation); 
    oscP5.send(gyroS, myRemoteLocation); 
 }
}
