/**************************************************************************
 * Ce fichier est le fichier de la classe principale de notre programme   *
 * Dans ce fichier, nous allons créer le dessin de la salle A106, créer   *
 * toutes les instances des différentes classes qui vont nous permettrent *
 * de créer tous les objets que composent la salle. Nous allons également *
 * de ce fichier, créer toutes les variables pour les shaders, les        *
 * textures et bien évidemment les dimensions des objets (la salle, les   *
 * ordinateurs, bureaux, chaises, ...). De plus, nous allons créer les    *
 * variables pour la caméra, pour les lights et d'autres variables commme *
 * des polices de caractère ou même une variable boolean pour gérer les    *
 * lumières de la salle.                                                  *
 **************************************************************************/

// Dessin (Shape) principal de la salle A106
PShape a106;

// Instances des classes
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

// Variable pour les shaders
PShader shader;

// Variables pour les textures
PImage texSol, texMur, texMurBrique, texMurCouloir, texPlafond, texAfficheVerso, texAfficheRecto, texNomSalle, texTableau, texBureau;
PImage texBureauProf, texChaise, texChaiseBarre, texTour, texClavier, texSouris, texEcran1, texEcran2, texEcran3, texEcran4, texEcran5;
PImage texEcran6, texEcran7, texEcran8, texEcran9, texEcran10, texEcran11, texEcranTactile, texAfficheTableau, texLogoDell, texLogoSpeechi;
PImage texAlimentation, texEnceinte, texFenetre1, texFenetre2, texRadiateur, texRideau, texLedSalle, texLedSalleAllume, texLedTab;
PImage texTampon, texAfficheCouloir1, texAfficheCouloir2, texInterrupteur, texPrise;

// L'échelle : 1cm = 1px

// Variables pour la construction de la salle
// Dimension de la salle
final float salleL = 620/2, salleH = 280/2, salleP = 980/2;
// Epaisseur des murs de la salle
final int epaisseur = 5;
// Dimension des plinthes
final float plintheH = 10, plintheP = 1;

// Variables pour la construction des portes
// Dimension d'une porte
final float porteL = 92, porteHVert = 189, porteHGris = 16, porteP = 2;
// Dimension d'un contour de porte
final float contourEpaisseur = 3, contourH = 208, contourP = 3;
final float cylindrePorteH = 1, cylindrePorteR = 2.5;
final float cylindrePoignee1H = 4.5, cylindrePoignee1R = 1;
final float cylindrePoignee2H = 12.5, cylindrePoignee2R = 1;

// Variables pour la construction du tableau
// Dimension du tableau
final float tableauL = 400, tableauH = 126, tableauP = 1.5;
// Dimension de la tablette verticale
final float tablette1L = 402, tablette1H = 3.5, tablette1P = 1;
// Dimension de la tablette horizontale
final float tablette2L = 402, tablette2H = 1, tablette2P = 7;

// Dimension d'un bureau
final float plateauL = 160, plateauH = 2, plateauP = 80;
final float piedH = 73, piedR = 2.5;
final float bordure1L = 148, bordure1H = 5, bordure1P = 2;
final float bordure2L = 2, bordure2H = 5, bordure2P = 68;

// Dimension du bureau du prof
final float plateauPL = 130, plateauPH = 2, plateauPP = 65;
final float piedPH = 70, piedPR = 1.5;
final float bordureP1L = 120, bordureP1H = 4, bordureP1P = 2.5;
final float bordureP2L = 2.5, bordureP2H = 4, bordureP2P = 54;
final float planche1L = 120, planche1H = 30, planche1P = 2.5;
final float planche2L = 2.5, planche2H = 30, planche2P = 54;

// Dimension d'une chaise
final float assiseL = 40, assiseH = 2, assiseP = 35;
final float dossierL = 40, dossierH = 43, dossierP = 2;
final float piedChaiseH = 43, piedChaiseSupportH = 44, piedChaiseR = 1.5;

// Données sur le nombre de bureau et de rangée (pour le placement des bureaux et des chaises), ainsi que le nombre de leds
final int nb_bureau = 3, nb_rangee = 4, nb_leds = 4;

// Dimension d'une tour d'ordinateur
final float tourL = 9.5, tourH = 29, tourP = 29;

// Dimension d'un clavier d'ordinateur
final float clavierL = 44, clavierH = 1.5, clavierP = 12.5;

// Dimension d'une souris d'ordinateur
final float sourisL = 6, sourisH = 2, sourisP = 8;

// Dimension d'un écran d'ordinateur
final float ecranL = 54, ecranH = 32, ecranP = 2;
final float supportL = 20, supportH = 2, supportP = 16.5;
final float piedEH = 34, piedER = 2;

// Dimension de l'écran tactile
final float ecranTL = 170, ecranTH = 98, ecranTP = 9;
final float supportETL = 90, supportETH = 15, supportETP = 60;
final float piedETL = 20, piedETH = 140, piedETP = 15;

// Dimension d'une enceinte
final float enceinteL = 15, enceinteH = 22, enceinteP = 13;

// Dimension du rideau projecteur
final float rideauPR = 4, rideauPH = 225;

// Dimension des fenetres
final float fenetre1L = 221.75, fenetre2L = 665.25, fenetreH = 170, fenetreP = 1;

// Dimension d'un radiateur
final float radiateurL = 180, radiateurH = 60, radiateurP = 10;

// Dimension de la poubelle
final float poubelleR = 15, poubelleH = 30;

// Dimension du projecteur
final float projecteurL = 30, projecteurH = 10, projecteurP = 30;
final float piedProjecteurR = 2.5, piedProjecteurH = 10;

// Dimension des leds de la salle
final float ledSalleL = 20, ledSalleH = 1, ledSalleP = 120;

// Dimension des leds du tableau
final float ledTabL = 10, ledTabH = 5, ledTabP = 120;

// Dimension du tampon du tableau
final float tamponL = 10, tamponH = 1.5, tamponP = 3;

// Dimension des interrupteurs/prises électriques
final float blocElecL = 8.5, blocElecH = 7, blocElecP = 1;

// Variable pour la création d'une caméra
// Position x, y et z de la caméra de base
float camX = salleL-salleL/2;
float camY = -salleH/2;
float camZ = salleP-salleP/4;

// Variables pour les positions des lights
PVector[] lightPos = {
  // Lumières du plafond
  new PVector(10*salleL,-salleH,10*salleP),
  new PVector(10*salleL,-salleH,-10*salleP),
  
  // Lumière des fenêtres
  new PVector(-salleL,-20*salleH,0),
  
  new PVector(10*salleL,salleH,10*salleP),
  new PVector(10*salleL,salleH,-10*salleP),
  
  new PVector(-10*salleL,0,0)
};

// Variables pour les couleurs des lights
PVector[] lightColor = {
  new PVector(100,100,100)
};

// Polices de caractère pour le texte
PFont font1, font2;

// Variable boolean pour l'éclairage de la salle A106 
boolean eclairage = false;

/* Setup : Ici, nous allons définir les informations générales, comme la taille de la fenêtre (ici de taille 800)
  le nom de la fenêtre ("Salle A106"), le chargement des shaders et des textures (pour les textures
  cela va se faire via une fonction "textures"), le chargement des polices de caractère, l'initialisation
  des instances des classes avec les constructeurs et enfin la création de la salle A106 par appel de la
  fonction A106() */

void setup() {
  // Taille de la fenêtre en 3 dimensions
  size(800, 800, P3D);
  
  // Application du titre "Salle A106" à la fenêtre
  surface.setTitle("A106 Room Simulator");
  
  // Chargement des shaders
  shader = loadShader("LightShaderTexFrag.glsl", "LightShaderTexVert.glsl");
  // Appel de la fonction qui charge et génère toutes les textures
  textures();

  // Chargement des polices de caractère
  font1 = loadFont("Roboto-Black-50.vlw");
  font2 = loadFont("Karumbi-Regular-50.vlw");

  // Initialisation des instances avec les constructeurs
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

  // Appel de la méthode A106() afin de créer la salle A106
  a106 = A106();
}

/* Draw : */

void draw() {
  // Couleur de fond (noir)
  background(0);
  
  // Pour éclairer la pièce ou non en fonction de la variable boolean
  if(eclairage==true) {
    lights();
  }
  
  // On dessine la salle
  shape(a106);
  resetShader();

  // On affiche les textes dans le dessin de la salle A106
  texts();

  // Déplacement dans l'espace
  camera.deplacementEspace();
  // Mouvement de la caméra
  camera.deplacementCamera();
  // Mise à jour de la caméra
  camera.miseAJourCamera();
}

/* Fonction dans laquelle on génère toutes les textures que l'on va utiliser dans les différentes classes */

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

/* Fonction dans laquelle on affiche tous les textes de la salle A106 */

void texts() {
  // On affiche le texte du nom de la salle sur la porte d'entrée
  pushMatrix();
  textFont(font1);
  translate(salleL+epaisseur+porteP+0.1, -37, -salleP+27+contourEpaisseur+porteL-14.5);
  rotateY(PI/2);
  fill(color(#F0D746));
  textSize(6);
  text("A106", 0, 0, 0);
  popMatrix();
  
  // On affiche le texte de bienvenue sur le tableau
  pushMatrix();
  textFont(font2);
  translate(-salleL+135+tableauL/2, -40, -salleP+2);
  fill(color(255));
  textSize(25);
  textAlign(CENTER);
  text("Bienvenue dans la salle A106 !\nSalle des M1 IWOCS", 0, 0, 0);
  popMatrix();
 
  // On affiche le texte explicatif sur le tableau
  pushMatrix();
  textFont(font2);
  translate(-salleL+135+tableauL/2, 20, -salleP+2);
  fill(color(255));
  textSize(15);
  textAlign(CENTER);
  text("Déplacez la souris afin de modifier la vue\nPressez les flèches du clavier afin de vous déplacer dans l'espace et parcourir la salle\nEnfin, pressez la touche espace pour allumer la lumière", 0, 0, 0);
  popMatrix();
}

/* Fonction qui va nous permettre de gérer les lumières de la salle A106 */

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

/* Fonction qui va nous permettre d'allumer ou éteindre les lumières lorsque l'on touche sur la touche espace */

void keyPressed() {
  if (key == ' ') {
    eclairage = !eclairage;
  }
}

/* Fonction qui renvoie le dessin de la salle en appelant les autres classes de construction d'objets */

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