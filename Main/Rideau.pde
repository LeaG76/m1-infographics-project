/***********************************************************
 * Fichier de la classe Rideau, elle va nous permettre de  *
 * créer les rideaux qui se trouvent sur les fenêtres de   *
 * la salle A106. Un rideau est une simple face avec juste *
 * la texture d'un rideau. On va aussi créer la tringle à  *
 * rideau.                                                 *
 ***********************************************************/

class Rideau {
  // Dessin pour les rideaux
  PShape lesRideaux;
  // Variables des 2 couleurs que l'on va utiliser pour un rideau et la tringle à rideau
  color couleurRose, couleurBlanc;
  // Instance de la classe Cylindre pour la tringle à rideau
  Cylindre cylindre;

  /* Constructeur sans argument */
  
  Rideau() {
    // Les rideaux sont un groupe de dessin
    lesRideaux = createShape(GROUP);
    // Initialisation des couleurs
    couleurRose = color(#c89d8c);
    couleurBlanc = color(#f2f2f2);
    // Initialisation du cylindre
    cylindre = new Cylindre(30, 1, 980);
  }

  /* Fonction qui va nous retourner le dessin des rideaux et
    de la tringle à rideau en utilisant les fonctions creerRideau
    (pour les rideaux) et drawCylindre sur l'instance cylindre
    (pour la tringle) */
  
  PShape creerLesRideaux() {
    PShape rideau1 = creerRideau(60, fenetreH+10, couleurRose);
    rideau1.translate(-salleP+75,-90,-salleL+fenetreP+1);
    rideau1.rotateY(PI/2);
    
    PShape rideau2 = creerRideau(100, fenetreH+10, couleurRose);
    rideau2.translate(-salleP+fenetre1L+195,-90,-salleL+fenetreP+1);
    rideau2.rotateY(PI/2);
    
    PShape rideau3 = creerRideau(100, fenetreH+10, couleurRose);
    rideau3.translate(-salleP+fenetre1L+505,-90,-salleL+fenetreP+1);
    rideau3.rotateY(PI/2);
    
    PShape rideau4 = creerRideau(170, fenetreH+10, couleurRose);
    rideau4.translate(salleP-19,-90,-salleL+fenetreP+1);
    rideau4.rotateY(PI/2);
    
    PShape barreRideau = cylindre.drawCylindre(couleurBlanc);
    barreRideau.translate(-salleL+fenetreP+1,-salleH+10,0);
    
    lesRideaux.addChild(rideau1);
    lesRideaux.addChild(rideau2);
    lesRideaux.addChild(rideau3);
    lesRideaux.addChild(rideau4);
    lesRideaux.addChild(barreRideau);
    
    return lesRideaux;
  }
  
  /* Fonction qui va nous retourner le dessin d'un rideau */

  PShape creerRideau(float largeur, float hauteur, color couleur) {
    PShape rideau = createShape(GROUP);
    
    PShape rideauFront = createShape();
    rideauFront.beginShape(QUADS);
    rideauFront.textureMode(NORMAL);
    rideauFront.texture(texRideau);
    rideauFront.shininess(200.0);
    rideauFront.emissive(0, 0, 0);
    rideauFront.normal(0, 0, 1);
    rideauFront.stroke(couleur);
    rideauFront.vertex(0, salleH, 0, 1, 1);
    rideauFront.vertex(0, salleH-hauteur, 0, 1, 0);
    rideauFront.vertex(-largeur, salleH-hauteur, 0, 0, 0);
    rideauFront.vertex(-largeur, salleH, 0, 0, 1);
    rideauFront.endShape(CLOSE);
    
    rideau.addChild(rideauFront);
    
    return rideau;
  }
}
