/**********************************************************************
 * Fichier de la classe Porte, elle va nous permettre de réaliser les *
 * 4 portes de la salle A106 (porte d'entrée recto et verso, porte à  *
 * côté du tableau et porte du fond). Une porte est constituée de la  *
 * face de la porte, d'un contour et d'un poignée avec serrure (ou    *
 * non selon la porte). On ajoutera aussi pour le porte d'entrée que  *
 * ce soit pour le recto ou le verso, les détails (affiches, nom de   *
 * la salle, ...)                                                     * 
 **********************************************************************/

class Porte {
  // Dessin des portes
  PShape lesPortes;
  // Variables des 5 couleurs que l'on va utiliser pour les portes
  color couleurVert, couleurBleu, couleurGris, couleurGrisF, couleurBlanc;
  // Instances de la classe Cylindre
  Cylindre cylindre, cylindre1, cylindre2, cylindre3;

  /* Constructeur sans argument */

  Porte() {
    // Les portes sont un groupe de dessin
    lesPortes = createShape(GROUP);
    // Initialisation des couleurs
    couleurVert = color(#acc5b9);
    couleurBleu = color(#63a2bf);
    couleurGris = color(#7f7f7f);
    couleurGrisF = color(#666666);
    couleurBlanc = color(255);
    // Initialisation des cylindres qui vont nous servir pour les poignées et les serrures
    cylindre = new Cylindre(30, cylindrePorteR, cylindrePorteH);
    cylindre1 = new Cylindre(30, cylindrePoignee1R, cylindrePoignee1H);
    cylindre2 = new Cylindre(30, cylindrePoignee2R, cylindrePoignee2H);
    cylindre3 = new Cylindre(30, cylindrePoignee1R, cylindrePorteH/4);
  }

  /* Fonction qui va nous retourner le dessin des portes avec les poignées
    et les détails en utilisant les fonctions creationPorte, creerPoigneeGauche,
    creerDetailsPorteEntreeRecto, creerPoigneeDroite et creerDetailsPorteEntreeVerso */

  PShape creerLesPortes() {
    PShape porteEntreeRecto = creationPorte(couleurBleu, couleurGris, couleurBlanc, couleurGrisF);
    porteEntreeRecto.translate(-salleP+27+contourEpaisseur, 0, -salleL-epaisseur);
    porteEntreeRecto.rotateY(-PI/2);
    
    PShape poigneeRecto = creerPoigneeGauche(couleurBlanc, couleurBlanc, couleurGrisF);
    poigneeRecto.translate(-salleP+porteL+24, 0, -salleL-epaisseur-porteP-1);
    poigneeRecto.rotateY(-PI/2);
    
    PShape detailsRecto = creerDetailsPorteEntreeRecto();
    detailsRecto.translate(-salleP+27+contourEpaisseur, 0, -salleL-epaisseur);
    detailsRecto.rotateY(-PI/2);

    PShape porteEntreeVerso = creationPorte(couleurVert, couleurGris, couleurBlanc, couleurGrisF);
    porteEntreeVerso.translate(salleL+porteL-27-contourEpaisseur, 0, salleL);
    porteEntreeVerso.rotateY(PI/2);
    
    PShape poigneeVerso = creerPoigneeDroite(couleurBlanc, couleurBlanc, couleurGrisF);
    poigneeVerso.translate(salleL+porteL-24, 0, salleL-porteP-1);
    poigneeVerso.rotateY(PI/2);
    
    PShape detailsVerso = creerDetailsPorteEntreeVerso();
    detailsVerso.translate(salleL+porteL-27-contourEpaisseur, 0, salleL);
    detailsVerso.rotateY(PI/2);
   
    PShape porteFond = creationPorte(couleurVert, couleurGris, couleurBlanc, couleurGrisF);
    porteFond.translate(-salleL+27, 0, salleP);
    
    PShape poigneeFond = creerPoigneeGauche(couleurBlanc, couleurGris, couleurGrisF);
    poigneeFond.translate(-salleL+porteL-contourEpaisseur+24, 0, salleP-porteP-1);

    PShape porteTableau = creationPorte(couleurVert, couleurGris, couleurBlanc, couleurGrisF);
    porteTableau.translate(salleL-porteL-21-contourEpaisseur, 0, salleP);
    porteTableau.rotateY(PI);
    
    PShape poigneeTableau = creerPoigneeDroite(couleurBlanc, couleurGris, couleurGrisF);
    poigneeTableau.translate(salleL-porteL-18, 0, salleP-porteP-1);
    poigneeTableau.rotateY(PI);

    lesPortes.addChild(porteEntreeRecto);
    lesPortes.addChild(poigneeRecto);
    lesPortes.addChild(detailsRecto);
    lesPortes.addChild(porteEntreeVerso);
    lesPortes.addChild(poigneeVerso);
    lesPortes.addChild(detailsVerso);
    lesPortes.addChild(porteFond);
    lesPortes.addChild(poigneeFond);
    lesPortes.addChild(porteTableau);
    lesPortes.addChild(poigneeTableau);

    return lesPortes;
  }

  /* Fonction qui va nous retourner le dessin d'une porte (face + contour mais sans sa poignée)
    avec les couleurs en paramètres et en utilisant les fonctions creerPorte, creerContourVertical
    et creerContourHorizontal */

  PShape creationPorte(color couleur1, color couleur2, color couleur3, color couleur4) {
    // Création d'un dessin qui est un groupe
    PShape groupePorte = createShape(GROUP);

    // Création des formes qui composent la salle
    PShape porte = creerPorte(couleur1, couleur2, couleur4);
    
    PShape contourVertical1 = creerContourVertical(couleur3);
    
    PShape contourVertical2 = creerContourVertical(couleur3);
    contourVertical2.translate(-porteL-contourEpaisseur, 0, 0);
    
    PShape contourHorizontal = creerContourHorizontal(couleur3);

    // Ajout de ces formes au groupe 'groupePorte'
    groupePorte.addChild(porte);
    groupePorte.addChild(contourVertical1);
    groupePorte.addChild(contourVertical2);
    groupePorte.addChild(contourHorizontal);

    return groupePorte;
  }

  /* Fonction qui va nous retourner le dessin d'une face de porte */

  PShape creerPorte(color couleur1, color couleur2, color couleur3) {
    PShape porte = createShape(GROUP);

    PShape porteFrontVert = createShape();
    porteFrontVert.beginShape(QUADS);
    porteFrontVert.fill(couleur1);
    porteFrontVert.stroke(couleur1);
    porteFrontVert.vertex(0, salleH-porteHGris, -porteP);
    porteFrontVert.vertex(0, salleH-porteHGris-porteHVert, -porteP);
    porteFrontVert.vertex(porteL, salleH-porteHGris-porteHVert, -porteP);
    porteFrontVert.vertex(porteL, salleH-porteHGris, -porteP);
    porteFrontVert.endShape(CLOSE);

    PShape porteFrontGris = createShape();
    porteFrontGris.beginShape(QUADS);
    porteFrontGris.fill(couleur2);
    porteFrontGris.stroke(couleur3);
    porteFrontGris.vertex(0, salleH, -porteP);
    porteFrontGris.vertex(0, salleH-porteHGris, -porteP);
    porteFrontGris.vertex(porteL, salleH-porteHGris, -porteP);
    porteFrontGris.vertex(porteL, salleH, -porteP);
    porteFrontGris.endShape(CLOSE);

    PShape porteBack = createShape();
    porteBack.beginShape(QUADS);
    porteBack.fill(couleur1);
    porteBack.stroke(couleur1);
    porteBack.vertex(0, salleH, 0);
    porteBack.vertex(0, salleH-porteHGris-porteHVert, 0);
    porteBack.vertex(porteL, salleH-porteHGris-porteHVert, 0);
    porteBack.vertex(porteL, salleH, 0);
    porteBack.endShape(CLOSE);

    PShape porteTop = createShape();
    porteTop.beginShape(QUADS);
    porteTop.fill(couleur1);
    porteTop.stroke(couleur1);
    porteTop.vertex(0, salleH-porteHGris-porteHVert, -porteP);
    porteTop.vertex(0, salleH-porteHGris-porteHVert, 0);
    porteTop.vertex(porteL, salleH-porteHGris-porteHVert, 0);
    porteTop.vertex(porteL, salleH-porteHGris-porteHVert, -porteP);
    porteTop.endShape(CLOSE);

    PShape porteBottom = createShape();
    porteBottom.beginShape(QUADS);
    porteBottom.fill(couleur1);
    porteBottom.stroke(couleur1);
    porteBottom.vertex(0, salleH, -porteP);
    porteBottom.vertex(0, salleH, 0);
    porteBottom.vertex(porteL, salleH, 0);
    porteBottom.vertex(porteL, salleH, -porteP);
    porteBottom.endShape(CLOSE);

    PShape porteRight = createShape();
    porteRight.beginShape(QUADS);
    porteRight.fill(couleur1);
    porteRight.stroke(couleur1);
    porteRight.vertex(0, salleH, -porteP);
    porteRight.vertex(0, salleH-porteHGris-porteHVert, -porteP);
    porteRight.vertex(0, salleH-porteHGris-porteHVert, 0);
    porteRight.vertex(0, salleH, 0);
    porteRight.endShape(CLOSE);

    PShape porteLeft = createShape();
    porteLeft.beginShape(QUADS);
    porteLeft.fill(couleur1);
    porteLeft.stroke(couleur1);
    porteLeft.vertex(porteL, salleH, -porteP);
    porteLeft.vertex(porteL, salleH-porteHGris-porteHVert, -porteP);
    porteLeft.vertex(porteL, salleH-porteHGris-porteHVert, 0);
    porteLeft.vertex(porteL, salleH, 0);
    porteLeft.endShape(CLOSE);

    porte.addChild(porteFrontVert);
    porte.addChild(porteFrontGris);
    porte.addChild(porteBack);
    porte.addChild(porteTop);
    porte.addChild(porteBottom);
    porte.addChild(porteRight);
    porte.addChild(porteLeft);

    return porte;
  }

  /* Fonction qui va nous retourner le dessin d'un bloc poignée
    (un bloc poignée est constitué de 2 cylindre plat, d'une poignée
    et d'une serrure) pour une poignée qui se situe à droite en
    utilisant la fonction drawCylindre sur les instances de la
    classe Cylindre */

  PShape creerPoigneeDroite(color couleur1, color couleur2, color couleur3) {
    PShape poigneeDroite = createShape(GROUP);

    PShape cylindreHaut = cylindre.drawCylindre(couleur1);
    cylindreHaut.translate(0, salleH-106, cylindrePorteH/2);
    
    PShape poignee1 = cylindre1.drawCylindre(couleur1);
    poignee1.translate(0, salleH-106, -cylindrePorteH);
    
    PShape poignee2 = cylindre2.drawCylindre(couleur1);
    poignee2.translate(cylindrePoignee1H-1, salleH-106, cylindrePoignee2H/2-cylindrePoignee1R-0.05);
    poignee2.rotateY(PI/2);
    
    PShape cylindreBas = cylindre.drawCylindre(couleur2);
    cylindreBas.translate(0, salleH-98, cylindrePorteH/2);
    
    PShape serrure = cylindre3.drawCylindre(couleur3);
    serrure.translate(0, salleH-98, -cylindrePorteH/8);
    
    poigneeDroite.addChild(cylindreHaut);
    poigneeDroite.addChild(poignee1);
    poigneeDroite.addChild(poignee2);
    poigneeDroite.addChild(cylindreBas);
    poigneeDroite.addChild(serrure);

    return poigneeDroite;
  }

  /* Fonction qui va nous retourner le dessin d'un bloc poignée
    (un bloc poignée est constitué de 2 cylindre plat, d'une poignée
    et d'une serrure) pour une poignée qui se situe à gauche en
    utilisant la fonction drawCylindre sur les instances de la
    classe Cylindre */
  
  PShape creerPoigneeGauche(color couleur1, color couleur2, color couleur3) {
    PShape poigneeGauche = createShape(GROUP);

    PShape cylindreHaut = cylindre.drawCylindre(couleur1);
    cylindreHaut.translate(0, salleH-106, cylindrePorteH/2);
    
    PShape poignee1 = cylindre1.drawCylindre(couleur1);
    poignee1.translate(0, salleH-106, -cylindrePorteH);
    
    PShape poignee2 = cylindre2.drawCylindre(couleur1);
    poignee2.translate(cylindrePoignee1H-1, salleH-106, -cylindrePoignee2H/2+cylindrePoignee1R+0.05);
    poignee2.rotateY(PI/2);
    
    PShape cylindreBas = cylindre.drawCylindre(couleur2);
    cylindreBas.translate(0, salleH-98, cylindrePorteH/2);
    
    PShape serrure = cylindre3.drawCylindre(couleur3);
    serrure.translate(0, salleH-98, -cylindrePorteH/8);
    
    poigneeGauche.addChild(cylindreHaut);
    poigneeGauche.addChild(poignee1);
    poigneeGauche.addChild(poignee2);
    poigneeGauche.addChild(cylindreBas);
    poigneeGauche.addChild(serrure);

    return poigneeGauche;
  }

  /* Fonction qui va nous retourner le dessin d'un contour de
    porte vertical */

  PShape creerContourVertical(color couleur) {
    PShape contourV = createShape(GROUP);

    PShape contourVFront = createShape();
    contourVFront.beginShape(QUADS);
    contourVFront.fill(couleur);
    contourVFront.stroke(couleur);
    contourVFront.vertex(porteL, salleH, -contourP);
    contourVFront.vertex(porteL+contourEpaisseur, salleH, -contourP);
    contourVFront.vertex(porteL+contourEpaisseur, salleH-contourH, -contourP);
    contourVFront.vertex(porteL, salleH-contourH, -contourP);
    contourVFront.endShape(CLOSE);

    PShape contourVBack = createShape();
    contourVBack.beginShape(QUADS);
    contourVBack.fill(couleur);
    contourVBack.stroke(couleur);
    contourVBack.vertex(porteL, salleH, 0);
    contourVBack.vertex(porteL+contourEpaisseur, salleH, 0);
    contourVBack.vertex(porteL+contourEpaisseur, salleH-contourH, 0);
    contourVBack.vertex(porteL, salleH-contourH, 0);
    contourVBack.endShape(CLOSE);

    PShape contourVTop = createShape();
    contourVTop.beginShape(QUADS);
    contourVTop.fill(couleur);
    contourVTop.stroke(couleur);
    contourVTop.vertex(porteL, salleH-contourH, -contourP);
    contourVTop.vertex(porteL, salleH-contourH, 0);
    contourVTop.vertex(porteL+contourEpaisseur, salleH-contourH, 0);
    contourVTop.vertex(porteL+contourEpaisseur, salleH-contourH, -contourP);
    contourVTop.endShape(CLOSE);

    PShape contourVBottom = createShape();
    contourVBottom.beginShape(QUADS);
    contourVBottom.fill(couleur);
    contourVBottom.stroke(couleur);
    contourVBottom.vertex(porteL, salleH, -contourP);
    contourVBottom.vertex(porteL, salleH, 0);
    contourVBottom.vertex(porteL+contourEpaisseur, salleH, 0);
    contourVBottom.vertex(porteL+contourEpaisseur, salleH, -contourP);
    contourVBottom.endShape(CLOSE);

    PShape contourVRight = createShape();
    contourVRight.beginShape(QUADS);
    contourVRight.fill(couleur);
    contourVRight.stroke(couleur);
    contourVRight.vertex(porteL+contourEpaisseur, salleH, -contourP);
    contourVRight.vertex(porteL+contourEpaisseur, salleH-contourH, -contourP);
    contourVRight.vertex(porteL+contourEpaisseur, salleH-contourH, 0);
    contourVRight.vertex(porteL+contourEpaisseur, salleH, 0);
    contourVRight.endShape(CLOSE);

    PShape contourVLeft = createShape();
    contourVLeft.beginShape(QUADS);
    contourVLeft.fill(couleur);
    contourVLeft.stroke(couleur);
    contourVLeft.vertex(porteL, salleH, -contourP);
    contourVLeft.vertex(porteL, salleH-contourH, -contourP);
    contourVLeft.vertex(porteL, salleH-contourH, 0);
    contourVLeft.vertex(porteL, salleH, 0);
    contourVLeft.endShape(CLOSE);

    contourV.addChild(contourVFront);
    contourV.addChild(contourVBack);
    contourV.addChild(contourVTop);
    contourV.addChild(contourVBottom);
    contourV.addChild(contourVRight);
    contourV.addChild(contourVLeft);

    return contourV;
  }

  /* Fonction qui va nous retourner le dessin d'un contour de
    porte horizontal */

  PShape creerContourHorizontal(color couleur) {
    PShape contourH = createShape(GROUP);

    PShape contourHFront = createShape();
    contourHFront.beginShape(QUADS);
    contourHFront.fill(couleur);
    contourHFront.stroke(couleur);
    contourHFront.vertex(porteL+contourEpaisseur, salleH-porteHGris-porteHVert, -contourP);
    contourHFront.vertex(porteL+contourEpaisseur, salleH-porteHGris-porteHVert-contourEpaisseur, -contourP);
    contourHFront.vertex(0-contourEpaisseur, salleH-porteHGris-porteHVert-contourEpaisseur, -contourP);
    contourHFront.vertex(0-contourEpaisseur, salleH-porteHGris-porteHVert, -contourP);
    contourHFront.endShape(CLOSE);
    
    PShape contourHBack = createShape();
    contourHBack.beginShape(QUADS);
    contourHBack.fill(couleur);
    contourHBack.stroke(couleur);
    contourHBack.vertex(porteL+contourEpaisseur, salleH-porteHGris-porteHVert, 0);
    contourHBack.vertex(porteL+contourEpaisseur, salleH-porteHGris-porteHVert-contourEpaisseur, 0);
    contourHBack.vertex(0-contourEpaisseur, salleH-porteHGris-porteHVert-contourEpaisseur, 0);
    contourHBack.vertex(0-contourEpaisseur, salleH-porteHGris-porteHVert, 0);
    contourHBack.endShape(CLOSE);
    
    PShape contourHTop = createShape();
    contourHTop.beginShape(QUADS);
    contourHTop.fill(couleur);
    contourHTop.stroke(couleur);
    contourHTop.vertex(porteL+contourEpaisseur, salleH-porteHGris-porteHVert-contourEpaisseur, 0);
    contourHTop.vertex(porteL+contourEpaisseur, salleH-porteHGris-porteHVert-contourEpaisseur, -contourP);
    contourHTop.vertex(0-contourEpaisseur, salleH-porteHGris-porteHVert-contourEpaisseur, -contourP);
    contourHTop.vertex(0-contourEpaisseur, salleH-porteHGris-porteHVert-contourEpaisseur, 0);
    contourHTop.endShape(CLOSE);
    
    PShape contourHBottom = createShape();
    contourHBottom.beginShape(QUADS);
    contourHBottom.fill(couleur);
    contourHBottom.stroke(couleur);
    contourHBottom.vertex(porteL+contourEpaisseur, salleH-porteHGris-porteHVert, 0);
    contourHBottom.vertex(porteL+contourEpaisseur, salleH-porteHGris-porteHVert, -contourP);
    contourHBottom.vertex(0-contourEpaisseur, salleH-porteHGris-porteHVert, -contourP);
    contourHBottom.vertex(0-contourEpaisseur, salleH-porteHGris-porteHVert, 0);
    contourHBottom.endShape(CLOSE);

    contourH.addChild(contourHFront);
    contourH.addChild(contourHBack);
    contourH.addChild(contourHTop);
    contourH.addChild(contourHBottom);

    return contourH;
  }

  /* Fonction qui va nous retourner le dessin des détails
    qui se trouvent sur la porte d'entrée verso (affiche) */
  
  PShape creerDetailsPorteEntreeVerso() {
    PShape groupeDetailsVerso = createShape(GROUP);
    
    PShape affichePorteEntreeVerso = createShape();
    affichePorteEntreeVerso.beginShape(QUADS);
    affichePorteEntreeVerso.textureMode(NORMAL);
    affichePorteEntreeVerso.texture(texAfficheVerso);
    affichePorteEntreeVerso.shininess(200.0);
    affichePorteEntreeVerso.emissive(0, 0, 0);
    affichePorteEntreeVerso.normal(0, 0, 1);
    affichePorteEntreeVerso.noStroke();
    affichePorteEntreeVerso.vertex(11, salleH-140, -porteP-0.5, 1, 1);
    affichePorteEntreeVerso.vertex(11, salleH-170, -porteP-0.5, 1, 0);
    affichePorteEntreeVerso.vertex(porteL-15, salleH-170, -porteP-0.5, 0, 0);
    affichePorteEntreeVerso.vertex(porteL-15, salleH-140, -porteP-0.5, 0, 1);
    affichePorteEntreeVerso.endShape(CLOSE);
    
    groupeDetailsVerso.addChild(affichePorteEntreeVerso);
    
    return groupeDetailsVerso;
  }

  /* Fonction qui va nous retourner le dessin des détails
    qui se trouvent sur la porte d'entrée recto (affiche + nom de la salle) */
  
  PShape creerDetailsPorteEntreeRecto() {
    PShape groupeDetailsRecto = createShape(GROUP);
    
    PShape affichePorteEntreeRecto = createShape();
    affichePorteEntreeRecto.beginShape(QUADS);
    affichePorteEntreeRecto.textureMode(NORMAL);
    affichePorteEntreeRecto.texture(texAfficheRecto);
    affichePorteEntreeRecto.shininess(200.0);
    affichePorteEntreeRecto.emissive(0, 0, 0);
    affichePorteEntreeRecto.normal(0, 0, 1);
    affichePorteEntreeRecto.noStroke();
    affichePorteEntreeRecto.vertex(33, salleH-140, -porteP-0.5, 1, 1);
    affichePorteEntreeRecto.vertex(33, salleH-170, -porteP-0.5, 1, 0);
    affichePorteEntreeRecto.vertex(porteL-38, salleH-170, -porteP-0.5, 0, 0);
    affichePorteEntreeRecto.vertex(porteL-38, salleH-140, -porteP-0.5, 0, 1);
    affichePorteEntreeRecto.endShape(CLOSE);
    
    PShape nomDeSalle = createShape();
    nomDeSalle.beginShape(QUADS);
    nomDeSalle.textureMode(NORMAL);
    nomDeSalle.texture(texNomSalle);
    nomDeSalle.shininess(200.0);
    nomDeSalle.emissive(0, 0, 0);
    nomDeSalle.normal(0, 0, 1);
    nomDeSalle.noStroke();
    nomDeSalle.vertex(63, salleH-168, -porteP-0.5, 1, 1);
    nomDeSalle.vertex(63, salleH-175, -porteP-0.5, 1, 0);
    nomDeSalle.vertex(porteL-15, salleH-175, -porteP-0.5, 0, 0);
    nomDeSalle.vertex(porteL-15, salleH-168, -porteP-0.5, 0, 1);
    nomDeSalle.endShape(CLOSE);
    
    groupeDetailsRecto.addChild(affichePorteEntreeRecto);
    groupeDetailsRecto.addChild(nomDeSalle);
    
    return groupeDetailsRecto;
  }
}
