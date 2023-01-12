/*************************************************************
 * Fichier de la classe BlocPriseMur, elle va nous permettre *
 * de créer le bloc de prise positionné sur le mur de la    *
 * porte dans la salle A106                                  *
 *************************************************************/

class BlocPriseMur {
  // Dessin pour le bloc de prise
  PShape blocprise;
  // Variable pour la couleur du bloc
  color couleurBlanc;

  /* Constructeur sans argument */

  BlocPriseMur() {
    // Le bloc de prise est un groupe de dessin
    blocprise = createShape(GROUP);
    // Initialisation de la couleur
    couleurBlanc = color(#f2f2f2);
  }

  /* Fonction qui va nous retourner le dessin des blocs
    qui se trouvent sur le mur de la porte d'entrée */

  PShape creerBlocPriseMur() {
    PShape blocpriseH = creerBlocHV(825, 18, 4, couleurBlanc);
    blocpriseH.translate(salleP-155, -80, salleL);
    blocpriseH.rotateY(PI/2);

    PShape blocpriseV = creerBlocHV(23, 200-18, 4, couleurBlanc);
    blocpriseV.translate(salleP-155, -98, salleL);
    blocpriseV.rotateY(PI/2);

    blocprise.addChild(blocpriseH);
    blocprise.addChild(blocpriseV);

    return blocprise;
  }

  /* Fonction qui va nous retourner le dessin d'un bloc */

  PShape creerBlocHV(float largeur, float hauteur, float profondeur, color couleur) {
    PShape bloc = createShape(GROUP);
    
    PShape blocFront = createShape();
    blocFront.beginShape(QUADS);
    blocFront.fill(couleur);
    blocFront.stroke(couleur);
    blocFront.vertex(0, salleH, 0);
    blocFront.vertex(0, salleH-hauteur, 0);
    blocFront.vertex(-largeur, salleH-hauteur, 0);
    blocFront.vertex(-largeur, salleH, 0);
    blocFront.endShape(CLOSE);
    
    PShape blocBack= createShape();
    blocBack.beginShape(QUADS);
    blocBack.fill(couleur);
    blocBack.stroke(couleur);
    blocBack.vertex(0, salleH, -profondeur);
    blocBack.vertex(0, salleH-hauteur, -profondeur);
    blocBack.vertex(-largeur, salleH-hauteur, -profondeur);
    blocBack.vertex(-largeur, salleH, -profondeur);
    blocBack.endShape(CLOSE);
    
    PShape blocTop = createShape();
    blocTop.beginShape(QUADS);
    blocTop.fill(couleur);
    blocTop.stroke(couleur);
    blocTop.vertex(0, salleH-hauteur, -profondeur);
    blocTop.vertex(0, salleH-hauteur, 0);
    blocTop.vertex(-largeur, salleH-hauteur, 0);
    blocTop.vertex(-largeur, salleH-hauteur, -profondeur);
    blocTop.endShape(CLOSE);
    
    PShape blocBottom = createShape();
    blocBottom.beginShape(QUADS);
    blocBottom.fill(couleur);
    blocBottom.stroke(couleur);
    blocBottom.vertex(0, salleH, -profondeur);
    blocBottom.vertex(0, salleH, 0);
    blocBottom.vertex(-largeur, salleH, 0);
    blocBottom.vertex(-largeur, salleH, -profondeur);
    blocBottom.endShape(CLOSE);
    
    PShape blocLeft = createShape();
    blocLeft.beginShape(QUADS);
    blocLeft.fill(couleur);
    blocLeft.stroke(couleur);
    blocLeft.vertex(-largeur, salleH, 0);
    blocLeft.vertex(-largeur, salleH-hauteur, 0);
    blocLeft.vertex(-largeur, salleH-hauteur, -profondeur);
    blocLeft.vertex(-largeur, salleH, -profondeur);
    blocLeft.endShape(CLOSE);
    
    PShape blocRight = createShape();
    blocRight.beginShape(QUADS);
    blocRight.fill(couleur);
    blocRight.stroke(couleur);
    blocRight.vertex(0, salleH, 0);
    blocRight.vertex(0, salleH-hauteur, 0);
    blocRight.vertex(0, salleH-hauteur, -profondeur);
    blocRight.vertex(0, salleH, -profondeur);
    blocRight.endShape(CLOSE);
    
    bloc.addChild(blocFront);
    bloc.addChild(blocBack);
    bloc.addChild(blocTop);
    bloc.addChild(blocBottom);
    bloc.addChild(blocLeft);
    bloc.addChild(blocRight);

    return bloc;
  }
}
