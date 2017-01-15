import processing.video.*;
import blobDetection.*;
import java.net.*;


String data_path = "/Users/matthewepler/Desktop/blob_detector_engine/data";

BlobDetection theBlobDetection;
boolean newFrame = false;

// FILE VARIABLES
File dir;
String path;
String[] files;
String currentFile;
int fileCounter;
PImage currentImage;

void setup() {
  // load data directory
  loadDirectory(data_path);
  
  // load an image.
  try {
    currentImage = loadFile(fileCounter);
  } catch (Exception e) {
    // if we have reached the end of the directory, exit
    if(fileCounter >= files.length - 1) {
      println("end of directory reached");
      exit();
    } else {
      // skip this file and keep going
      println(e);
      println("unable to load image file from directory");
      println("fileCounter = " + fileCounter);
    }
  }
}


void draw() {
  
}


PImage loadFile(int counter) {
  File thisFile = new File(path + "/" + files[counter]);
  String mimeType = URLConnection.guessContentTypeFromName(thisFile.getName());
  if(mimeType.contains("image")) {
    println("loading " + files[counter]);
    PImage frame = loadImage(files[counter]);
    return frame;
  } else {
    fileCounter++;
    loadFile(fileCounter);
    return new PImage();
  }
}

void loadDirectory( String s )
{
  path = s;
  dir = new File( path );

  if ( dir.isDirectory() )
  {
    files = dir.list();
    String success = "Directory \'" + dir.getName() + "\' loaded successfully.";
    println( success );
  } 
  else
  {
    String fail = "Failed to load directory. Please verify the path string.";
    println(fail);
    //fail += "\n";
    //fail += "Path = " + path;
    //textSize( smallText );
    //fill( 255, 0, 0 );
    //text( fail, windowLeft + windowWidth/2, height/2 );
    //println( fail );
  }
}