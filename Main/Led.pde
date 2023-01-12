/*************************************************************
 * Fichier de la classe Led, elle va nous permettre de créer *
 * les leds qui se trouvent au plafond de la salle A106. Il  *
 * y a 2 rangées de 4 leds pour éclairer la salle et 2 leds  *
 * collés pour éclairer le tableau. Un des 8 leds qui        *
 * éclairent la salle est non fonctionnel.                   *
 *************************************************************/

class Led {
  // Dessin pour les leds
  PShape lesLeds;
  // Variables des 2 couleurs que l'on va utiliser pour les leds
  color couleurBlanc, couleurGris;

  /* Constructeur sans argument */

  Led() {
    // Les leds sont un groupe de dessin
    lesLeds = createShape(GROUP);
    // Initialisation des couleurs
    couleurBlanc = color(#d3d4d5);
    couleurGris = color(#a19892);
  }

  /* Fonction qui va nous retourner le dessin des rangées de leds de la salle,
    on va appeler la fonction creerLesLedsSalle */

  PShape creerRangeesLeds() {
    PShape rangeesLeds = createShape(GROUP);

    // On dessine les deux rangées de 4 leds
      // avec pour la rangée près de la fenêtre, le deuxième led non allumé car non fonctionnel
    for (int i=1; i<=nb_leds; i++) {
      PImage texture;
      if(i==2) {
        texture = texLedSalle;
      } else {
        texture = texLedSalleAllume;
      }
      PShape leds = creerLesLedsSalle(i, texture);
      rangeesLeds.addChild(leds);
    }

    lesLeds.addChild(rangeesLeds);

    return lesLeds;
  }

  /* Fonction qui va nous retourner le dessin de deux rangées de leds
    pour la création de deux rangées de 4 leds de la salle,
    on va appeler la fonction creerLed de création d'une led */

  PShape creerLesLedsSalle(int i, PImage texture) {
    PShape groupeLedsSalle = createShape(GROUP);

    PShape leds1 = creerLed(ledSalleL, ledSalleH, ledSalleP, couleurBlanc, couleurGris, texLedSalleAllume);
    leds1.translate(salleL-125, -2*salleH+ledSalleH, -salleP+ledSalleP*i+100*i);

    PShape leds2 = creerLed(ledSalleL, ledSalleH, ledSalleP, couleurBlanc, couleurGris, texture);
    leds2.translate(-salleL+ledSalleL+125, -2*salleH+ledSalleH, -salleP+ledSalleP*i+100*i);

    groupeLedsSalle.addChild(leds1);
    groupeLedsSalle.addChild(leds2);

    return groupeLedsSalle;
  }

  /* Fonction qui va nous retourner le dessin des 2 leds du tableau,
    on va appeler la fonction creerLed */
  
  PShape creerLesLedsTableau() {
    PShape groupeLedsTab = createShape(GROUP);

    PShape leds1 = creerLed(ledTabL, ledTabH, ledTabP, couleurBlanc, couleurGris, texLedTab);
    leds1.translate(salleP-75, -2*salleH+ledTabH, -salleL+137+tableauL/2-0.5);
    leds1.rotateY(PI/2);

    PShape leds2 = creerLed(ledTabL, ledTabH, ledTabP, couleurBlanc, couleurGris, texLedTab);
    leds2.translate(salleP-75, -2*salleH+ledTabH, -salleL+137+tableauL/2+ledTabP+0.5);
    leds2.rotateY(PI/2);

    groupeLedsTab.addChild(leds1);
    groupeLedsTab.addChild(leds2);

    return groupeLedsTab;
  }

  /* Fonction qui va nous retourner le dessin d'une led */

  PShape creerLed(float largeur, float hauteur, float profondeur, color couleur1, color couleur2, PImage texture) {
    PShape led = createShape(GROUP);

    PShape ledFront = createShape();
    ledFront.beginShape(QUADS);
    ledFront.fill(couleur1);
    ledFront.stroke(couleur2);
    ledFront.vertex(0, salleH, 0);
    ledFront.vertex(0, salleH-hauteur, 0);
    ledFront.vertex(-largeur, salleH-hauteur, 0);
    ledFront.vertex(-largeur, salleH, 0);
    ledFront.endShape(CLOSE);

    PShape ledBack = createShape();
    ledBack.beginShape(QUADS);
    ledBack.fill(couleur1);
    ledBack.stroke(couleur2);
    ledBack.vertex(0, salleH, -profondeur);
    ledBack.vertex(0, salleH-hauteur, -profondeur);
    ledBack.vertex(-largeur, salleH-hauteur, -profondeur);
    ledBack.vertex(-largeur, salleH, -profondeur);
    ledBack.endShape(CLOSE);

    PShape ledTop = createShape();
    ledTop.beginShape(QUADS);
    ledTop.fill(couleur1);
    ledTop.stroke(couleur2);
    ledTop.vertex(0, salleH-hauteur, -profondeur);
    ledTop.vertex(0, salleH-hauteur, 0);
    ledTop.vertex(-largeur, salleH-hauteur, 0);
    ledTop.vertex(-largeur, salleH-hauteur, -profondeur);
    ledTop.endShape(CLOSE);

    PShape ledBottom = createShape();
    ledBottom.beginShape(QUADS);
    ledBottom.textureMode(NORMAL);
    ledBottom.texture(texture);
    ledBottom.shininess(200.0);
    ledBottom.emissive(0, 0, 0);
    ledBottom.normal(0, 0, 1);
    ledBottom.stroke(couleur2);
    ledBottom.vertex(0, salleH, -profondeur, 0, 0);
    ledBottom.vertex(0, salleH, 0, 0, 1);
    ledBottom.vertex(-largeur, salleH, 0, 1, 1);
    ledBottom.vertex(-largeur, salleH, -profondeur, 1, 0);
    ledBottom.endShape(CLOSE);

    PShape ledLeft = createShape();
    ledLeft.beginShape(QUADS);
    ledLeft.fill(couleur1);
    ledLeft.stroke(couleur2);
    ledLeft.vertex(-largeur, salleH, 0);
    ledLeft.vertex(-largeur, salleH-hauteur, 0);
    ledLeft.vertex(-largeur, salleH-hauteur, -profondeur);
    ledLeft.vertex(-largeur, salleH, -profondeur);
    ledLeft.endShape(CLOSE);

    PShape ledRight = createShape();
    ledRight.beginShape(QUADS);
    ledRight.fill(couleur1);
    ledRight.stroke(couleur2);
    ledRight.vertex(0, salleH, 0);
    ledRight.vertex(0, salleH-hauteur, 0);
    ledRight.vertex(0, salleH-hauteur, -profondeur);
    ledRight.vertex(0, salleH, -profondeur);
    ledRight.endShape(CLOSE);

    led.addChild(ledFront);
    led.addChild(ledBack);
    led.addChild(ledTop);
    led.addChild(ledBottom);
    led.addChild(ledLeft);
    led.addChild(ledRight);

    return led;
  }
}
