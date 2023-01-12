/****************************************************************
 * Fichier de la classe Chaise, elle va nous permettre de créer *
 * les chaises de la salle A106, c'est-à-dire les 6 chaises sur *
 * les 4 rangées. Une chaise est constitué de 4 pieds, d'un     *
 * dossier et d'une assise                                      *
 ****************************************************************/

class Chaise {
  // Dessin pour les chaises
  PShape lesChaises;
  // Variables des 3 couleurs que l'on va utiliser pour une chaise
  color couleurMarron, couleurJaune, couleurNoir;
  // Instances de la classe Cylindre pour les 4 pieds d'une chaise,
    // les 4 petits supports noirs et les 2 barres horizontales sous une chaise
  Cylindre cylindre, cylindreSupport, cylindreBarre;
  
  /* Constructeur sans argument */

  Chaise() {
    // Les chaises sont un groupe de dessin
    lesChaises = createShape(GROUP);
    // Initialisation des couleurs
    couleurMarron = color(#C37F30);
    couleurJaune = color(#ffd038);
    couleurNoir = color(0);
    // Initialisation des cylindres
    cylindre = new Cylindre(30, piedChaiseR, piedChaiseH);
    cylindreSupport = new Cylindre(30, piedChaiseR, 1);
    cylindreBarre = new Cylindre(30, piedChaiseR, 28);
  }

  /* Fonction qui va nous retourner le dessin des 6 chaises
    sur les 4 rangées de la salle en utilisant la fonction
    creerLesChaises de création des chaises celle-ci dépend
    de plusieurs arguments afin de mieux pouvoir faire le
    placement des chaises */
  
  PShape creerRangeesChaises() {
    PShape rangeesChaises = createShape(GROUP);
    
    // On affiche les chaises (au nombre de 6) sur les 4 rangées
    int k1=2;
    for (int i=0; i<nb_bureau; i++) {
      int k2=0;
      for (int j=0; j<nb_rangee; j++) {
        PShape chaises = creerLesChaises(i, j, k1, k2);
        rangeesChaises.addChild(chaises);
        k2+=83;
      }
      k1+=1;
    }
    
    lesChaises.addChild(rangeesChaises);
    
    return lesChaises;
  }

  /* Fonction qui va nous retourner le dessin des chaises
    en utilisant la fonction creerChaisesParBureau */
  
  PShape creerLesChaises(int i, int j, int k1, int k2) {
    PShape groupeChaises = createShape(GROUP);
    
    PShape chaises = creerChaisesParBureau();
    chaises.translate(-plateauL*i-k1,0, plateauP*j+k2);
    
    groupeChaises.addChild(chaises);

    return groupeChaises;
  }

  /* Fonction qui va nous retourner le dessin des 2 chaises
    pour 1 bureau en utilisant la fonction creerChaise */
  
  PShape creerChaisesParBureau() {
    PShape groupeChaisesParBureau = createShape(GROUP);
    
    PShape chaise1 = creerChaise(couleurMarron, couleurJaune);
    chaise1.translate(salleL-2-25,0,-plateauL-20);
    
    PShape chaise2 = creerChaise(couleurMarron, couleurJaune);
    chaise2.translate(salleL-plateauL+assiseL+25,0,-plateauL-20);
    
    groupeChaisesParBureau.addChild(chaise1);
    groupeChaisesParBureau.addChild(chaise2);
    
    return groupeChaisesParBureau;
  }

  /* Fonction qui va nous retourner le dessin de la chaise
    du prof en utilisant la fonction creerChaise avec sa
    bonne position dans la salle A106 */
  
  PShape creerChaiseProf() {
    PShape groupeChaiseProf = createShape(GROUP);
    
    PShape chaiseProf = creerChaise(couleurMarron, couleurJaune);
    chaiseProf.translate(-salleL+2+assiseL+240+plateauPL/3, 0, salleP-2-128);
    chaiseProf.rotateY(PI);
    
    groupeChaiseProf.addChild(chaiseProf);
     
    return groupeChaiseProf;
  }

  /* Fonction qui va nous retourner le dessin d'une chaise
    (qui est constitué d'une assise, d'un dossier, de 4 pieds)
    en utilisant les fonctions creerAssise, creerDossier et
    creerPieds (dans cette fonction creerPieds, on va créer les
    4 pieds avec les 4 pieds, les 4 petits supports noirs et
    mes 2 barres horizontales qui sont reliées à la chaise
    en dessous de l'assise) */
  
  PShape creerChaise(color couleur1, color couleur2) {
    PShape chaise = createShape(GROUP);
    
    PShape assise = creerAssise(couleur1);
    
    PShape dossier = creerDossier(couleur1);
    
    PShape pieds = creerPieds(couleur2);
    
    chaise.addChild(assise);
    chaise.addChild(dossier);
    chaise.addChild(pieds);
    
    return chaise;
  }
  
  /* Fonction qui va nous retourner le dessin de l'assise d'une
    chaise dont la texture est du bois clair */

  PShape creerAssise(color couleur) {
    PShape assise = createShape(GROUP);
    
    PShape assiseTop = createShape();
    assiseTop.beginShape(QUADS);
    assiseTop.textureMode(NORMAL);
    assiseTop.texture(texChaise);
    assiseTop.shininess(200.0);
    assiseTop.emissive(0, 0, 0);
    assiseTop.normal(0, 0, 1);
    assiseTop.stroke(couleur);
    assiseTop.vertex(0, salleH-piedChaiseSupportH-assiseH, -assiseP, 0, 0);
    assiseTop.vertex(0, salleH-piedChaiseSupportH-assiseH, -dossierP, 0, 1);
    assiseTop.vertex(-assiseL, salleH-piedChaiseSupportH-assiseH, -dossierP, 1, 1);
    assiseTop.vertex(-assiseL, salleH-piedChaiseSupportH-assiseH, -assiseP, 1, 0);
    assiseTop.endShape(CLOSE);
    
    PShape assiseBottom = createShape();
    assiseBottom.beginShape(QUADS);
    assiseBottom.textureMode(NORMAL);
    assiseBottom.texture(texChaise);
    assiseBottom.shininess(200.0);
    assiseBottom.emissive(0, 0, 0);
    assiseBottom.normal(0, 0, 1);
    assiseBottom.stroke(couleur);
    assiseBottom.vertex(0, salleH-piedChaiseSupportH, -assiseP, 0, 0);
    assiseBottom.vertex(0, salleH-piedChaiseSupportH, 0, 0, 1);
    assiseBottom.vertex(-assiseL, salleH-piedChaiseSupportH, 0, 1, 1);
    assiseBottom.vertex(-assiseL, salleH-piedChaiseSupportH, -assiseP, 1, 0);
    assiseBottom.endShape(CLOSE);
    
    PShape assiseFront = createShape();
    assiseFront.beginShape(QUADS);
    assiseFront.textureMode(NORMAL);
    assiseFront.texture(texChaise);
    assiseFront.shininess(200.0);
    assiseFront.emissive(0, 0, 0);
    assiseFront.normal(0, 0, 1);
    assiseFront.stroke(couleur);
    assiseFront.vertex(0, salleH-piedChaiseSupportH, -assiseP, 0, 0);
    assiseFront.vertex(0, salleH-piedChaiseSupportH-assiseH, -assiseP, 0, 1);
    assiseFront.vertex(-assiseL, salleH-piedChaiseSupportH-assiseH, -assiseP, 1, 1);
    assiseFront.vertex(-assiseL, salleH-piedChaiseSupportH, -assiseP, 1, 0);
    assiseFront.endShape(CLOSE);
    
    PShape assiseRight = createShape();
    assiseRight.beginShape(QUADS);
    assiseRight.fill(couleur);
    assiseRight.stroke(couleur);
    assiseRight.vertex(0, salleH-piedChaiseSupportH, 0);
    assiseRight.vertex(0, salleH-piedChaiseSupportH, -assiseP);
    assiseRight.vertex(0, salleH-piedChaiseSupportH-assiseH, -assiseP);
    assiseRight.vertex(0, salleH-piedChaiseSupportH-assiseH, 0);
    assiseRight.endShape(CLOSE);
    
    PShape assiseLeft = createShape();
    assiseLeft.beginShape(QUADS);
    assiseLeft.fill(couleur);
    assiseLeft.stroke(couleur);
    assiseLeft.vertex(-assiseL, salleH-piedChaiseSupportH, 0);
    assiseLeft.vertex(-assiseL, salleH-piedChaiseSupportH, -assiseP);
    assiseLeft.vertex(-assiseL, salleH-piedChaiseSupportH-assiseH, -assiseP);
    assiseLeft.vertex(-assiseL, salleH-piedChaiseSupportH-assiseH, 0);
    assiseLeft.endShape(CLOSE);
    
    assise.addChild(assiseTop);
    assise.addChild(assiseBottom);
    assise.addChild(assiseFront);
    assise.addChild(assiseRight);
    assise.addChild(assiseLeft);
    
    return assise;
  }

  /* Fonction qui va nous retourner le dessin du dossier d'une
    chaise dont la texture est du bois clair */
  
  PShape creerDossier(color couleur) {
    PShape dossier = createShape(GROUP);
    
    PShape dossierFront = createShape();
    dossierFront.beginShape(QUADS);
    dossierFront.textureMode(NORMAL);
    dossierFront.texture(texChaise);
    dossierFront.shininess(200.0);
    dossierFront.emissive(0, 0, 0);
    dossierFront.normal(0, 0, 1);
    dossierFront.stroke(couleur);
    dossierFront.vertex(0, salleH-piedChaiseSupportH-assiseH, -dossierP, 1, 1);
    dossierFront.vertex(0, salleH-piedChaiseSupportH-assiseH-dossierH, -dossierP, 1, 0);
    dossierFront.vertex(-dossierL, salleH-piedChaiseSupportH-assiseH-dossierH, -dossierP, 0, 0);
    dossierFront.vertex(-dossierL, salleH-piedChaiseSupportH-assiseH, -dossierP, 0, 1);
    dossierFront.endShape(CLOSE);
    
    PShape dossierBack = createShape();
    dossierBack.beginShape(QUADS);
    dossierBack.textureMode(NORMAL);
    dossierBack.texture(texChaise);
    dossierBack.shininess(200.0);
    dossierBack.emissive(0, 0, 0);
    dossierBack.normal(0, 0, 1);
    dossierBack.stroke(couleur);
    dossierBack.vertex(0, salleH-piedChaiseSupportH, 0, 1, 1);
    dossierBack.vertex(0, salleH-piedChaiseSupportH-assiseH-dossierH, 0, 1, 0);
    dossierBack.vertex(-dossierL, salleH-piedChaiseSupportH-assiseH-dossierH, 0, 0, 0);
    dossierBack.vertex(-dossierL, salleH-piedChaiseSupportH, 0, 0, 1);
    dossierBack.endShape(CLOSE);
    
    PShape dossierTop = createShape();
    dossierTop.beginShape(QUADS);
    dossierTop.textureMode(NORMAL);
    dossierTop.texture(texChaise);
    dossierTop.shininess(200.0);
    dossierTop.emissive(0, 0, 0);
    dossierTop.normal(0, 0, 1);
    dossierTop.stroke(couleur);
    dossierTop.vertex(0, salleH-piedChaiseSupportH-assiseH-dossierH, -dossierP, 0, 0);
    dossierTop.vertex(0, salleH-piedChaiseSupportH-assiseH-dossierH, 0, 0, 1);
    dossierTop.vertex(-dossierL, salleH-piedChaiseSupportH-assiseH-dossierH, 0, 1, 1);
    dossierTop.vertex(-dossierL, salleH-piedChaiseSupportH-assiseH-dossierH, -dossierP, 1, 0);
    dossierTop.endShape(CLOSE);
    
    PShape dossierRight = createShape();
    dossierRight.beginShape(QUADS);
    dossierRight.fill(couleur);
    dossierRight.stroke(couleur);
    dossierRight.vertex(0, salleH-piedChaiseSupportH-assiseH, 0);
    dossierRight.vertex(0, salleH-piedChaiseSupportH-assiseH, -dossierP);
    dossierRight.vertex(0, salleH-piedChaiseSupportH-assiseH-dossierH, -dossierP);
    dossierRight.vertex(0, salleH-piedChaiseSupportH-assiseH-dossierH, 0);
    dossierRight.endShape(CLOSE);
    
    PShape dossierLeft = createShape();
    dossierLeft.beginShape(QUADS);
    dossierLeft.fill(couleur);
    dossierLeft.stroke(couleur);
    dossierLeft.vertex(-dossierL, salleH-piedChaiseSupportH-assiseH, 0);
    dossierLeft.vertex(-dossierL, salleH-piedChaiseSupportH-assiseH, -dossierP);
    dossierLeft.vertex(-dossierL, salleH-piedChaiseSupportH-assiseH-dossierH, -dossierP);
    dossierLeft.vertex(-dossierL, salleH-piedChaiseSupportH-assiseH-dossierH, 0);
    dossierLeft.endShape(CLOSE);
    
    dossier.addChild(dossierFront);
    dossier.addChild(dossierBack);
    dossier.addChild(dossierTop);
    dossier.addChild(dossierRight);
    dossier.addChild(dossierLeft);
    
    return dossier;
  }

  /* Fonction qui va nous retourner le dessin des 4 pieds
    d'une chaise en utilisant la fonction drawCylindre sur
    les instances cylindre, cylindreSupport et cylindreBarre */
  
  PShape creerPieds(color couleur) {
    PShape lesPieds = createShape(GROUP);

    PShape pied1 = cylindre.drawCylindre(couleur);
    pied1.translate(-2.5, 2.5, salleH-piedChaiseH/2-1);
    pied1.rotateX(-PI/2);
    
    PShape pied1Support = cylindreSupport.drawCylindre(couleurNoir);
    pied1Support.translate(-2.5, 2.5, salleH-0.5);
    pied1Support.rotateX(-PI/2);

    PShape pied2 = cylindre.drawCylindre(couleur);
    pied2.translate(-assiseL+2.5, 2.5, salleH-piedChaiseH/2-1);
    pied2.rotateX(-PI/2);
    
    PShape pied2Support = cylindreSupport.drawCylindre(couleurNoir);
    pied2Support.translate(-assiseL+2.5, 2.5, salleH-0.5);
    pied2Support.rotateX(-PI/2);

    PShape pied3 = cylindre.drawCylindre(couleur);
    pied3.translate(-2.5, assiseP-2.5, salleH-piedChaiseH/2-1);
    pied3.rotateX(-PI/2);
    
    PShape pied3Support = cylindreSupport.drawCylindre(couleurNoir);
    pied3Support.translate(-2.5, assiseP-2.5, salleH-0.5);
    pied3Support.rotateX(-PI/2);

    PShape pied4 = cylindre.drawCylindre(couleur);
    pied4.translate(-assiseL+2.5, assiseP-2.5, salleH-piedChaiseH/2-1);
    pied4.rotateX(-PI/2);
    
    PShape pied4Support = cylindreSupport.drawCylindre(couleurNoir);
    pied4Support.translate(-assiseL+2.5, assiseP-2.5, salleH-0.5);
    pied4Support.rotateX(-PI/2);
    
    PShape barre1 = cylindreBarre.drawCylindre(couleur);
    barre1.translate(-assiseL+2.5, salleH-piedChaiseH, -assiseP/2);
    
    PShape barre2 = cylindreBarre.drawCylindre(couleur);
    barre2.translate(-2.5, salleH-piedChaiseH, -assiseP/2);

    lesPieds.addChild(pied1);
    lesPieds.addChild(pied1Support);
    lesPieds.addChild(pied2);
    lesPieds.addChild(pied2Support);
    lesPieds.addChild(pied3);
    lesPieds.addChild(pied3Support);
    lesPieds.addChild(pied4);
    lesPieds.addChild(pied4Support);
    lesPieds.addChild(barre1);
    lesPieds.addChild(barre2);

    return lesPieds;
  }
  
}
