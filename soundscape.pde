/*
  EMI WiSe18/19 - Praxisaufgabe 2: Java & Processing
  
  Aufgabe 2.2:
  Soundscape - Klanglandschaft
  
  von Rasmus Zabel-Langhennig
  und Jonas Bohmann
*/

import processing.sound.*;

// Boolean für keyPressed() Event
boolean isPlaying = true;

// Einschränkung für minimale Tonhöhe
float minFreq = 200;

// Einschränkung für maximale Tonhöhe
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
  
 // Damit direkt ab Programmstart der Ton erklingt
 if(isPlaying == true){
    sin.play();
    
 /* 
    Änderung der Frequenz durch Bewegen der Maus
    ----------------------------------------------
    map() Funktion zur Übertragung von Fenstergröße (700,400) auf
    minimal Frequenz (200) und maximale Frequenz (1000)
 */
    sin.freq(map(mouseY, 0, height, minFreq, maxFreq));
  
 }
 
 // Nur zum Debuggen
 print("\nMouseY: " + mouseY);
 print("\nFreq: " + map(mouseY, 0, height, minFreq, maxFreq));
 

 // Maus wurde geklickt, also Wechsel zu Panning
 if(mouseWasClicked == true){
   
   // Panning kann von -1.0 (links) bis 1.0 (rechts) reichen
   sin.pan(map(mouseX, 0, width, -1.0, 1.0));
   
   // Nur zum Debuggen
   print("\nPan: " + map(mouseX, 0, width, -1.0, 1.0));
   print("\nMouseX: " + mouseX);
 }
 
 // Maus wurde nicht geklickt, also macht mouseX die Amplitude
 else if(mouseWasClicked == false){
   
   // Amplitude kann von 0 (kein Ton) bis 1.0 (laut) reichen
   sin.amp(map(mouseX, 0, width, 0, 1));
   
   // Nur zum Debuggen
   print("\nAmp: " + map(mouseX, 0, width, 0, 1));
   print("\nMouseX: " + mouseX);
 }
 
}

// Logik für Start & Stopp bei Drücken der Leertaste
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
  }

}
