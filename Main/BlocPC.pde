/****************************************************************
 * Fichier de la classe BlocPC, elle va nous permettre de créer *
 * les blocs de PC sur les bureaux. Un bloc de PC est composé   *
 * d'une tour, d'un clavier, d'une souris et d'un écran         *
 ****************************************************************/

class BlocPC {
  // Dessin pour les bloc de PC
  PShape lesBlocPC;

  /* Constructeur sans argument */

  BlocPC() {
    // Les bloc de PC sont un groupe de dessin
    lesBlocPC = createShape(GROUP);
  }

  /* Fonction qui va nous retourner le dessin des bloc de PC
    sur tous les bureaux de chaque rangées en utilisant les
    fonctions creerBlocPCPaire et creerBlocPCSolo de la classe */

  PShape creerRangeesBlocPC() {
    PShape rangeesBlocPC = createShape(GROUP);

    // On affiche les blocs de PC paire (2 blocs de PC) sur
      // les 4 rangées et les 2 bureaux qui ont un bloc de PC paire
    int k1=1;
    for (int i=0; i<nb_bureau-1; i++) {
      int k2=0;
      for (int j=0; j<nb_rangee; j++) {
        PShape blocPC = creerBlocPCPaire(i, j, k1, k2);
        rangeesBlocPC.addChild(blocPC);
        k2+=83;
      }
      k1+=1;
    }

    // On affiche les blocs de PC solo (1 seul bloc de PC) sur
      // les 4 rangées et les bureaux qui ont un bloc de PC solo
    int k3=0;
    for (int j=0; j<nb_rangee; j++) {
      if(j==0) {
        PShape blocPCSolo = creerBlocPCSolo(2, j, 3, k3);
        blocPCSolo.translate(-plateauL/2+15,0,0);
        rangeesBlocPC.addChild(blocPCSolo);
      } else {
        PShape blocPCSolo = creerBlocPCSolo(2, j, 3, k3);
        rangeesBlocPC.addChild(blocPCSolo);
      }
      k3+=83;
    }

    lesBlocPC.addChild(rangeesBlocPC);

    return lesBlocPC;
  }

  /* Fonction qui va nous retourner le dessin des bloc de PC
    paire en utilisant les fonctions des classes Tour, Clavier,
    Souris et Ecran pour la création de ces objets */

  PShape creerBlocPCPaire(int i, int j, int k1, int k2) {
    PShape groupeBlocPCPaire = createShape(GROUP);

    // Création des 2 tours, 2 claviers, 2 souris et 2 écrans qui
      // composent les blocs de PC paire

    Tour tour1, tour2;
    tour1 = new Tour();
    tour2 = new Tour();

    Clavier clavier1, clavier2;
    clavier1 = new Clavier();
    clavier2 = new Clavier();

    Souris souris1, souris2;
    souris1 = new Souris();
    souris2 = new Souris();
    
    Ecran ecran1, ecran2;
    ecran1 = new Ecran();
    ecran2 = new Ecran();

    PShape tourDroite = tour1.creerTour();
    tourDroite.translate(salleL-plateauL*i-7-k1, -piedH-plateauH, -salleP+plateauP*j+tourP+221+k2);

    PShape clavierDroit = clavier1.creerClavier();
    clavierDroit.translate(salleL-plateauL*i-sourisL-20-(k1+1), -piedH-plateauH, -salleP+plateauP*(j+1)+201+k2);

    PShape sourisDroite = souris1.creerSouris();
    sourisDroite.translate(salleL-plateauL*i-15-(k1+1), -piedH-plateauH, -salleP+plateauP*(j+1)+198.5+k2);
    
    PShape ecranDroit = ecran1.creerEcran();
    ecranDroit.translate(salleL-plateauL*i-tourL-12-k1, -piedH-plateauH, -salleP+plateauP*j+tourP/2+221+k2);

    PShape tourGauche = tour2.creerTour();
    tourGauche.translate(salleL-plateauL*(i+1)+tourL+4-(k1-1), -piedH-plateauH, -salleP+plateauP*j+tourP+221+k2);

    PShape clavierGauche = clavier2.creerClavier();
    clavierGauche.translate(salleL-plateauL*(i+1)+clavierL+15-(k1+1), -piedH-plateauH, -salleP+plateauP*(j+1)+201+k2);

    PShape sourisGauche = souris2.creerSouris();
    sourisGauche.translate(salleL-plateauL*(i+1)+clavierL+26-(k1+1), -piedH-plateauH, -salleP+plateauP*(j+1)+198.5+k2);
    
    PShape ecranGauche = ecran2.creerEcran();
    ecranGauche.translate(salleL-plateauL*(i+1)+tourL+ecranL+9-(k1-1), -piedH-plateauH, -salleP+plateauP*j+tourP/2+221+k2);

    groupeBlocPCPaire.addChild(tourDroite);
    groupeBlocPCPaire.addChild(clavierDroit);
    groupeBlocPCPaire.addChild(sourisDroite);
    groupeBlocPCPaire.addChild(ecranDroit);
    groupeBlocPCPaire.addChild(tourGauche);
    groupeBlocPCPaire.addChild(clavierGauche);
    groupeBlocPCPaire.addChild(sourisGauche);
    groupeBlocPCPaire.addChild(ecranGauche);

    return groupeBlocPCPaire;
  }

  /* Fonction qui va nous retourner le dessin des bloc de PC
    seul en utilisant les fonctions des classes Tour, Clavier,
    Souris et Ecran pour la création de ces objets */

  PShape creerBlocPCSolo(int i, int j, int k1, int k2) {
    PShape groupeBlocPCSolo = createShape(GROUP);

    // Création de la tour, du clavier, de la souris et de l'écran qui
      // composent les blocs de PC paire

    Tour tour1;
    tour1 = new Tour();

    Clavier clavier1;
    clavier1 = new Clavier();

    Souris souris1;
    souris1 = new Souris();
    
    Ecran ecran1;
    ecran1 = new Ecran();

    PShape tourDroite = tour1.creerTour();
    tourDroite.translate(salleL-plateauL*i-7-k1, -piedH-plateauH, -salleP+plateauP*j+tourP+221+k2);

    PShape clavierDroit = clavier1.creerClavier();
    clavierDroit.translate(salleL-plateauL*i-sourisL-20-(k1+1), -piedH-plateauH, -salleP+plateauP*(j+1)+201+k2);

    PShape sourisDroite = souris1.creerSouris();
    sourisDroite.translate(salleL-plateauL*i-15-(k1+1), -piedH-plateauH, -salleP+plateauP*(j+1)+198.5+k2);
    
    PShape ecranDroit = ecran1.creerEcran();
    ecranDroit.translate(salleL-plateauL*i-tourL-12-k1, -piedH-plateauH, -salleP+plateauP*j+tourP/2+221+k2);

    groupeBlocPCSolo.addChild(tourDroite);
    groupeBlocPCSolo.addChild(clavierDroit);
    groupeBlocPCSolo.addChild(sourisDroite);
    groupeBlocPCSolo.addChild(ecranDroit);

    return groupeBlocPCSolo;
  }
}
