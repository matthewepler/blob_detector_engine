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
  
}


void draw() {
  // load an image.
  if(fileCounter <= files.length - 1) {
    if (checkFile(fileCounter)) {
       currentImage = loadImage(files[fileCounter]);
       println("loading " + files[fileCounter]);
    } 
  } else {
    println("end of directory reached");
    exit();
  }
  fileCounter++;
}


boolean checkFile(int counter) {
  File thisFile = new File(path + "/" + files[counter]);
  String mimeType = URLConnection.guessContentTypeFromName(thisFile.getName());
  if(mimeType.contains("image")) {
    return true;
  } else {
     return false; 
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