import processing.sound.*;

/*


  TODO: Variablen aufräumen

  Diese Variablen werden gerade nicht gebraucht!

  // X-Position der Maus soll Amplitude sein
  float freq = mouseX;

  // Y-Position der Maus soll Tonhöhe/Frequenz sein
  float amp = mouseY;


*/

// Boolean für keyPressed() Event
boolean isPlaying = true;

// Einschränk für minimale Tonhöhe
float minFreq = 200;

// Einschränk für maximale Tonhöhe
float maxFreq = 1000;

// SinOsc macht den Ton
SinOsc sin = new SinOsc(this);

// Boolean für den Amplituden/Panning Switch durch Mausklick
boolean mouseWasClicked = false;
  

void setup(){
  size(700,400);
  background(255);
}

void draw(){
  
 // Damit dirket ab Programmstart der Ton erklingt
 if(isPlaying == true){
    sin.play();
 }
 
 /*
 
   TODO: Visualisierung des Mauszeigers durch 2 Linien
 
   line(mouseX, 200, mouseX, 200);
   line(0, 0, mouseY, mouseY);

  */
 
 // Änderung der Frequenz durch Bewegen der Maus
 if(mouseY >= minFreq && mouseY <= maxFreq){
    sin.freq(mouseY);
    
    // Nur zum Debuggen
    print("\nMouseY: " + mouseY);
 }
 
 // Änderung der Amplitude durch Bewegen der Maus
 if(mouseX >= 0 && mouseX <= 1){
   sin.amp(mouseX);
   
 }
 
 // Maus wurde gelickt, also wechsel zu Panning
 if(mouseWasClicked == true){
   sin.pan(map(mouseX, 0, width, -1.0, 1.0));
   
   // Nur zum Debuggen
   print("\nMouseX/Pan: " + mouseX);
 }
 
 // Maus wurde nicht gelickt, also macht mouseX die Amplitude
 else if(mouseWasClicked == false){
   sin.amp(map(mouseX, 0, width, 0, 1));
   
   // Nur zum Debuggen
   print("\nMouseX/Amp: " + mouseX);
 }
 
}

void keyPressed(){
  
  // ASCII Code für Leertaste ist 32
  if(keyCode == 32){
      if(isPlaying == true){ 
        isPlaying = false;
        sin.stop();
      }
      
      else if(isPlaying == false){
        isPlaying = true;
        sin.play();
      }
  } 
  
}
    
// Logik für den Wechsel Amp <-> Pan durch Mausklick
void mouseClicked(){
  if(mouseWasClicked == true){
    mouseWasClicked = false;
  }
  
  else if(mouseWasClicked == false){
    mouseWasClicked = true;
    sin.pan(map(mouseX, 0, width, -1.0, 1.0));
  }

}
