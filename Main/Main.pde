/*
  ┌───────────────────────────────────────────────────────────────────────────────────────────┐
  │ @name         Classroom scene reproduction                                                │
  │ @author       Léa Gallier                                                                 │
  │ @version      1.0                                                                         │
  │ @created      2022-05-24                                                                  │
  │ @modified     2023-01-19                                                                  │
  │ @description  Reproduction of a classroom at the University of Le Havre Normandy in the   │
  │               form of a scene                                                             │
  │                                                                                           │
  │   This file is the main class file of our program.                                        │
  │ In this file, we will create the drawing of room A106, create all the instances of the    │
  │ different classes that will allow us to create all the objects that make up the room. We  │
  │ will also from this file, create all the variables for the shaders, the textures and of   │
  │ course the dimensions of the objects (the room, the computers, desks, chairs, ...). In    │
  │ addition, we will create the variables for the camera, for the lights and other variables │
  │ like fonts or even a boolean variable to manage the lights of the room.                   │
  └───────────────────────────────────────────────────────────────────────────────────────────┘
*/

// Main drawing (Shape) of room A106
PShape a106;

// Class instances
Camera camera;
Salle salle;
Porte porte;
Tableau tableau;
Bureau bureau;
BureauProf bureauProf;
Chaise chaise;
BlocPC blocpc;
EcranTactile ecranTactile;
Enceinte enceinte;
BlocPriseMur blocPriseMur;
Fenetre fenetre;
Colonne colonne;
Radiateur radiateur;
Rideau rideau;
Details details;
Led led;

// Variables for shaders
PShader shader;

// Variables for textures
PImage texSol, texMur, texMurBrique, texMurCouloir, texPlafond, texAfficheVerso, texAfficheRecto, texNomSalle, texTableau, texBureau;
PImage texBureauProf, texChaise, texChaiseBarre, texTour, texClavier, texSouris, texEcran1, texEcran2, texEcran3, texEcran4, texEcran5;
PImage texEcran6, texEcran7, texEcran8, texEcran9, texEcran10, texEcran11, texEcranTactile, texAfficheTableau, texLogoDell, texLogoSpeechi;
PImage texAlimentation, texEnceinte, texFenetre1, texFenetre2, texRadiateur, texRideau, texLedSalle, texLedSalleAllume, texLedTab;
PImage texTampon, texAfficheCouloir1, texAfficheCouloir2, texInterrupteur, texPrise;

// The scale : 1cm = 1px

// Variables for building the room
// Room size
final float salleL = 620/2, salleH = 280/2, salleP = 980/2;
// Room wall thickness
final int epaisseur = 5;
// Dimensions of skirting blackboards
final float plintheH = 10, plintheP = 1;

// Variables for building doors
// Size of a door
final float porteL = 92, porteHVert = 189, porteHGris = 16, porteP = 2;
// Dimension of a door outline
final float contourEpaisseur = 3, contourH = 208, contourP = 3;
final float cylindrePorteH = 1, cylindrePorteR = 2.5;
final float cylindrePoignee1H = 4.5, cylindrePoignee1R = 1;
final float cylindrePoignee2H = 12.5, cylindrePoignee2R = 1;

// Variables for the construction of the blackboard
// Blackboard size
final float tableauL = 400, tableauH = 126, tableauP = 1.5;
// Vertical shelf dimension
final float tablette1L = 402, tablette1H = 3.5, tablette1P = 1;
// Horizontal shelf dimension
final float tablette2L = 402, tablette2H = 1, tablette2P = 7;

// Size of a desk
final float plateauL = 160, plateauH = 2, plateauP = 80;
final float piedH = 73, piedR = 2.5;
final float bordure1L = 148, bordure1H = 5, bordure1P = 2;
final float bordure2L = 2, bordure2H = 5, bordure2P = 68;

// Dimensions of the teacher's desk
final float plateauPL = 130, plateauPH = 2, plateauPP = 65;
final float piedPH = 70, piedPR = 1.5;
final float bordureP1L = 120, bordureP1H = 4, bordureP1P = 2.5;
final float bordureP2L = 2.5, bordureP2H = 4, bordureP2P = 54;
final float planche1L = 120, planche1H = 30, planche1P = 2.5;
final float planche2L = 2.5, planche2H = 30, planche2P = 54;

// Dimensions of a chair
final float assiseL = 40, assiseH = 2, assiseP = 35;
final float dossierL = 40, dossierH = 43, dossierP = 2;
final float piedChaiseH = 43, piedChaiseSupportH = 44, piedChaiseR = 1.5;

// Desk and row number data (for placement of desks and chairs), as well as the number of leds
final int nb_bureau = 3, nb_rangee = 4, nb_leds = 4;

// Dimensions of a computer tower
final float tourL = 9.5, tourH = 29, tourP = 29;

// Dimensions of a computer keyblackboard
final float clavierL = 44, clavierH = 1.5, clavierP = 12.5;

// Dimensions of a computer mouse
final float sourisL = 6, sourisH = 2, sourisP = 8;

// Dimensions of a computer screen
final float ecranL = 54, ecranH = 32, ecranP = 2;
final float supportL = 20, supportH = 2, supportP = 16.5;
final float piedEH = 34, piedER = 2;

// Touch screen size
final float ecranTL = 170, ecranTH = 98, ecranTP = 9;
final float supportETL = 90, supportETH = 15, supportETP = 60;
final float piedETL = 20, piedETH = 140, piedETP = 15;

// Dimensions of a speaker
final float enceinteL = 15, enceinteH = 22, enceinteP = 13;

// Dimensions of the projector curtain
final float rideauPR = 4, rideauPH = 225;

// Window size
final float fenetre1L = 221.75, fenetre2L = 665.25, fenetreH = 170, fenetreP = 1;

// Dimensions of a radiator
final float radiateurL = 180, radiateurH = 60, radiateurP = 10;

// Dimensions of the trash can
final float poubelleR = 15, poubelleH = 30;

// Projector size
final float projecteurL = 30, projecteurH = 10, projecteurP = 30;
final float piedProjecteurR = 2.5, piedProjecteurH = 10;

// Dimension of the room leds
final float ledSalleL = 20, ledSalleH = 1, ledSalleP = 120;

// Dimension of the leds of the blackboard
final float ledTabL = 10, ledTabH = 5, ledTabP = 120;

// Dimension of the blackboard buffer
final float tamponL = 10, tamponH = 1.5, tamponP = 3;

// Size of switches and electrical outlets
final float blocElecL = 8.5, blocElecH = 7, blocElecP = 1;

// Variables for creating a camera
// Base camera x, y and z position
float camX = salleL-salleL/2;
float camY = -salleH/2;
float camZ = salleP-salleP/4;

// Variables for light positions
PVector[] lightPos = {
  // Ceiling lights
  new PVector(10*salleL,-salleH,10*salleP),
  new PVector(10*salleL,-salleH,-10*salleP),
  
  // Light from windows
  new PVector(-salleL,-20*salleH,0),
  
  new PVector(10*salleL,salleH,10*salleP),
  new PVector(10*salleL,salleH,-10*salleP),
  
  new PVector(-10*salleL,0,0)
};

// Variables for light colors
PVector[] lightColor = {
  new PVector(100,100,100)
};

// Fonts for text
PFont font1, font2;

// Boolean variable for lighting in room A106
boolean eclairage = false;

/*
  ┌───────────────────────────────────────────────────────────────────────────────────────────┐
  │   Setup                                                                                   │
  │ Here we will define the general information, such as the size of the window (here size    │
  │ 800), the name of the window ("Room A106"), the loading of shaders and textures (for      │
  │ textures this will be done via a "textures" function), the loading of character fonts,    │
  │ the initialization of class instances with constructors and finally the creation of room  │
  │ A106 by calling function A106().                                                          │
  └───────────────────────────────────────────────────────────────────────────────────────────┘
*/

void setup() {
  // Window size in 3 dimensions
  size(800, 800, P3D);
  
  // Applying the title "A106 Room Simulator" to the window
  surface.setTitle("A106 Room Simulator");
  
  // Loading shaders
  shader = loadShader("LightShaderTexFrag.glsl", "LightShaderTexVert.glsl");
  // Call of the function which loads and generates all the textures
  textures();

  // Loading fonts
  font1 = loadFont("Roboto-Black-50.vlw");
  font2 = loadFont("Karumbi-Regular-50.vlw");

  // Initializing instances with constructors
  camera = new Camera();
  salle = new Salle(epaisseur);
  porte = new Porte();
  tableau = new Tableau();
  bureau = new Bureau();
  bureauProf = new BureauProf();
  chaise = new Chaise();
  blocpc = new BlocPC();
  ecranTactile = new EcranTactile();
  enceinte = new Enceinte();
  blocPriseMur = new BlocPriseMur();
  fenetre = new Fenetre();
  colonne = new Colonne();
  radiateur = new Radiateur();
  rideau = new Rideau();
  details = new Details();
  led = new Led();

  // Call of method A106() to create room A106
  a106 = A106();
}

/*
  ┌───────────────────────────────────────────────────────────────────────────────────────────┐
  │   Draw                                                                                    │
  │ This function continuously executes the lines of code contained in its block until the    │
  │ program stops.                                                                            │
  └───────────────────────────────────────────────────────────────────────────────────────────┘
*/

void draw() {
  // Background color (black)
  background(0);
  
  // To light the room or not depending on the boolean variable
  if(eclairage==true) {
    lights();
  }
  
  // We draw the room
  shape(a106);
  resetShader();

  // We display the texts in the drawing of room A106
  texts();

  // Movement in space
  camera.deplacementEspace();
  // Camera movement
  camera.deplacementCamera();
  // Camera update
  camera.miseAJourCamera();
}

/* Function in which we generate all the textures that we will use in the different classes */

void textures() {
  texSol = loadImage("../pictures/sol.jpg");
  texMur = loadImage("../pictures/mur.jpg");
  texMurBrique = loadImage("../pictures/brique.jpg");
  texMurCouloir = loadImage("../pictures/murcouloir.jpg");
  texPlafond = loadImage("../pictures/plafond.jpg");
  texAfficheVerso = loadImage("../pictures/affiche1.jpg");
  texAfficheRecto = loadImage("../pictures/affiche2.jpg");
  texNomSalle = loadImage("../pictures/nomSalle.jpg");
  texTableau = loadImage("../pictures/tableau.png");
  texBureau = loadImage("../pictures/bureau.png");
  texBureauProf = loadImage("../pictures/bureau_prof.jpg");
  texChaise = loadImage("../pictures/chaise.jpg");
  texTour = loadImage("../pictures/tour.jpg");
  texClavier = loadImage("../pictures/clavier.png");
  texSouris = loadImage("../pictures/souris.png");
  texEcranTactile = loadImage("../pictures/pc_image.png");
  texEcran1 = loadImage("../pictures/pc_image1.png");
  texEcran2 = loadImage("../pictures/pc_image2.png");
  texEcran3 = loadImage("../pictures/pc_image3.png");
  texEcran4 = loadImage("../pictures/pc_image4.png");
  texEcran5 = loadImage("../pictures/pc_image5.png");
  texEcran6 = loadImage("../pictures/pc_image6.png");
  texEcran7 = loadImage("../pictures/pc_image7.png");
  texEcran8 = loadImage("../pictures/pc_image8.png");
  texEcran9 = loadImage("../pictures/pc_image9.png");
  texEcran10 = loadImage("../pictures/pc_image10.png");
  texEcran11 = loadImage("../pictures/pc_image11.png");
  texAfficheTableau = loadImage("../pictures/affiche3.jpg");
  texLogoDell = loadImage("../pictures/logodell.png");
  texLogoSpeechi = loadImage("../pictures/logospeechi.png");
  texAlimentation = loadImage("../pictures/alimentation.png");
  texEnceinte = loadImage("../pictures/enceinte.jpeg");
  texFenetre1 = loadImage("../pictures/fenetre1.png");
  texFenetre2 = loadImage("../pictures/fenetre2.png");
  texRadiateur = loadImage("../pictures/radiateur.png");
  texRideau = loadImage("../pictures/rideau.png");
  texLedSalle = loadImage("../pictures/led_salle.jpg");
  texLedTab = loadImage("../pictures/led_tableau.jpg");
  texLedSalleAllume = loadImage("../pictures/led_salle_allume.jpg");
  texTampon = loadImage("../pictures/tampon.jpg");
  texAfficheCouloir1 = loadImage("../pictures/affiche4.jpg");
  texAfficheCouloir2 = loadImage("../pictures/affiche5.jpg");
  texInterrupteur = loadImage("../pictures/interrupteur.jpg");
  texPrise = loadImage("../pictures/prise.jpg");
}

/* Function in which all the texts of room A106 are displayed */

void texts() {
  // We display the text of the name of the room on the entrance door
  pushMatrix();
  textFont(font1);
  translate(salleL+epaisseur+porteP+0.1, -37, -salleP+27+contourEpaisseur+porteL-14.5);
  rotateY(PI/2);
  fill(color(#F0D746));
  textSize(6);
  text("A106", 0, 0, 0);
  popMatrix();
  
  // We display the welcome text on the board
  pushMatrix();
  textFont(font2);
  translate(-salleL+135+tableauL/2, -40, -salleP+2);
  fill(color(255));
  textSize(25);
  textAlign(CENTER);
  text("Bienvenue dans la salle A106 !\nSalle des M1 IWOCS", 0, 0, 0);
  popMatrix();
 
  // The explanatory text is displayed on the board
  pushMatrix();
  textFont(font2);
  translate(-salleL+135+tableauL/2, 20, -salleP+2);
  fill(color(255));
  textSize(15);
  textAlign(CENTER);
  text("Déplacez la souris afin de modifier la vue\nPressez les flèches du clavier afin de vous déplacer dans l'espace et parcourir la salle\nEnfin, pressez la touche espace pour allumer la lumière", 0, 0, 0);
  popMatrix();
}

/* Function that will allow us to manage the lights of room A106 */

void lights() {
  for (int i=0; i<lightPos.length; i++) {
    if(i == lightPos.length -2){
      lightSpecular(70,70,70);
    }else{
      lightSpecular(100, 100, 100);
    }
    pointLight(lightColor[0].x, lightColor[0].y, lightColor[0].z, 
      lightPos[i].x, lightPos[i].y, lightPos[i].z);
  }
  
  emissive(0);
  shininess(5.0); 
  ambientLight(100, 100, 100);

  shader(shader);
}

/* Function that will allow us to turn the lights on or off when we press the space key */

void keyPressed() {
  if (key == ' ') {
    eclairage = !eclairage;
  }
}

/* Function that returns the drawing of the room by calling the other object construction classes */

PShape A106() {
  a106 = createShape(GROUP);

  a106.addChild(salle.creerSalle());
  a106.addChild(porte.creerLesPortes());
  a106.addChild(tableau.creerTableau());
  a106.addChild(bureau.creerRangeesBureaux());
  a106.addChild(bureau.creerLesBureauxFond());
  a106.addChild(bureauProf.creerLeBureauProf());
  a106.addChild(chaise.creerRangeesChaises());
  a106.addChild(chaise.creerChaiseProf());
  a106.addChild(blocpc.creerRangeesBlocPC());
  a106.addChild(ecranTactile.creerEcran());
  a106.addChild(enceinte.creerLesEnceintes());
  a106.addChild(blocPriseMur.creerBlocPriseMur());
  a106.addChild(fenetre.creerLesFenetres());
  a106.addChild(colonne.creerLesColonnes());
  a106.addChild(radiateur.creerLesRadiateurs());
  a106.addChild(rideau.creerLesRideaux());
  a106.addChild(details.creerDetails());
  a106.addChild(led.creerRangeesLeds());
  a106.addChild(led.creerLesLedsTableau());

  return a106;
}