import 'package:flutter/material.dart';
import 'dart:math';

//flutter build apk --build-name=1.0 --build-number=1 : pour compiler en mode production
//flutter pub run flutter_launcher_icons:main  : pour changer l'icone apres avoir mis la dependance et mis le chemin de licone dans pubspec

class pagejeux extends StatefulWidget {

  List NomJoueur=[

  ];

  var type;

  var nombrejoueur=0;

  var Monelementhasard;

  var Monelementhasardaction;

  var Monelementhasardverite;

  bool actionouveriteaafficher=true;

  pagejeux({required this.type,required this.nombrejoueur,required this.Monelementhasard,required this.Monelementhasardaction,required this.Monelementhasardverite,required this.actionouveriteaafficher,required this.NomJoueur});


  @override
  State<pagejeux> createState() => _pagejeuxState();
}

class _pagejeuxState extends State<pagejeux> {

  List Action=[
    "Faire le plus de pompes possible pendant 1 minute",
    "Ne pas regarder son téléphone pendant 2 heures ",
    "Draguer un inconnu ",
    "Imiter une scène de film ",
    "Imiter quelqu'un dans le groupe ",
    "Manger de l'ail cru ",
    "Appeler votre mère pour lui dire que vous l'aimez ",
    "Fermer les yeux et essayer de reconnaître quelqu'un à sa simple odeur. ",
    "Embrassez la personne que vous trouvez le/la plus beau/belle ",
    "Se mettre en sous-vêtements ",
    "Parler en verlan toute la soirée ",
    "Parler avec un accent, de votre choix, toute la soirée ",
    "Ne plus pouvoir dire ni oui ni non toute la soirée ",
    "Faire un cadeau à une autre personne du groupe ",
    "Se laisser maquiller ",
    "Faire une déclaration ",
    "Enlever votre soutien-gorge ",
    "Se mouiller le pantalon ",
    "Montrer une photo où vous êtes honteux.se ",
    "Twerker ",
    "Faire un bisou dans le cou à un.e membre du groupe ",
    "Embrasse la personne à ta gauche. ",
    " Laisse la personne à ta droite dessiner sur ton visage. ",
    "Donne ton téléphone à un autre joueur qui peut envoyer un texto disant ce qu’il veut à l’un de tes contacts. ",
    ". Verse de la glace dans ton pantalon. ",
    "Fais 20 pompes. ",
    " Vide ton sac à main, ton sac à dos ou tes poches et montre ce qu’il contient. ",
    "Décris la qualité la plus attirante de chaque personne du même sexe dans la pièce. ",
    "Passe cinq minutes sans cligner des yeux. ",
    "Approche-toi à moins d’un centimètre de l’autre personne, regarde-la droit dans les yeux et dis-lui ce que tu ressens pour elle pendant une minute. Ne la touche pas. ",
    " Laisse quelqu’un faire ce qu’il veut pendant deux minutes avec ton téléphone. ",
    " Écris un message secret pour ton partenaire sur son dos. S’il le devine, il reçoit une faveur spéciale de son choix. S’il se trompe, il doit faire quelque chose de spécial pour toi. ",
    " Tourne sur toi-même dix fois. Quand tu as fini, essaie de marcher en ligne droite. ",
    "Crie le premier mot qui te vient à l’esprit en ce moment. ",
    "Laisse un joueur au hasard te chatouiller pendant 30 secondes. ",
    "Laisse un joueur au hasard te chatouiller pendant 30 secondes. ",
    " Donne une fessée à la personne à ta droite. ",
    "Décris une autre personne du groupe et les autres doivent deviner de qui il s’agit. ",
    "Passe ton téléphone à la personne à ta droite et autorise-la à mettre n’importe quel statut sur l’un de tes comptes de réseau social. ",
    "Demande à quelqu’un de te bander les yeux. Ensuite, tous les membres du groupe t’embrassent sur la joue, et tu dois soit dire lequel est ton partenaire, puis l’embrasser sur les lèvres. OU, tu dois choisir une personne que tu veux embrasser sur les lèvres. ",
    "Demande à quelqu’un de parcourir ton historique YouTube et de le lire au groupe. ",
    "Enlève ton soutien-gorge sans enlever ta chemise. ",
    "Quelqu’un te fait un massage du dos pendant une minute pendant que tu as les yeux bandés. Si tu aimes son style, tu peux choisir de l’embrasser après, mais sans connaître son identité. ",
    "Embrassez la deuxième personne à votre gauche sur les lèvres. ",


  ];


  List Verite=[
    "Dans ce groupe, qui amènerais-tu avec toi sur une île déserte ?",
    "Raconte la plus grande honte que tu as vécue ?",
    "Quel est le rêve le plus étrange que tu aies fait ?",
    "Si aujourd’hui était le dernier jour de ta vie, que ferais-tu ?",
    "De 0 à 10. Quelle note donnerais-tu (choisir quelqu'un du groupe) en beauté, sympathie ou intelligence ?",
    "De 0 à 10. Quelle note te donnerais-tu à toi-même en beauté, sympathie ou intelligence ?",
    "Quel est le meilleur cadeau qu'on t'ait jamais fait ?",
    "Si c'était la fin du monde et que tu ne pouvais sauver qu'une seule personne, qui serait-elle ?",
    "As-tu déjà nagé nu dans l'eau ?",
    "Est-ce que quelqu'un t'a déjà trahi ?",
    "Est-ce que tu pourrais coucher avec quelqu'un pour beaucoup d'argent ?",
    "As-tu déjà embrassé plusieurs personnes le même jour ? Si oui, combien ?",
    "De quoi es-tu le/la plus fier.e ?",
    "Te crois-tu attirant.e ?",
    "Si tu pouvais voyager dans le temps, à quelle époque irais-tu ?",
    "As-tu menti en jouant à ce jeu ?",
    "Quelle est ta technique de séduction ?",
    "Quelle est la pire connerie que t'aies jamais faite ?",
    "Quel est ton plus gros remords ?",
    "Ton plus gros complexe ?",
    "T'as déjà été bourré.e ? Si oui, raconte-nous ce qu'il s'est passé pendant ta soirée la plus alcoolisée.",
    "Tas déjà fumé une clope ?",
    "C'est qui ton meilleur ami ?",
    "C'est qui ta meilleure amie ?",
    "T'as déjà commis un délit ?",
    "Ta destination rêvée pour partir en vacances ?",
    "Quel est le membre préféré de ta famille ?",
    "Quelle est la célébrité que tu trouves le plus beau ?",
    "Quelle est la célébrité que tu trouves la plus belle ?",
    "Tu t'es déjà fait pipi dessus, si oui, raconte-nous tout !",
    "T'as déjà été amoureux.se ?",
    "T'as déjà souhaité du mal de quelqu'un, si oui, de qui ?",
    "Avec quelle personne célèbre tu coucherais ?",
    "C'est quoi ton plat préféré ?",
    "T'as déjà entendu tes parents en train de le faire ?",
    "Tu ronfles ?",
    "Tu t'es déjà fait pipi dessus en dormant ?",
    "Est-ce que t'as une manie bizarre ?",
    "Tu crois au coup de foudre ? ",
    "Quelle est la pire chose qui pourrait t'arriver ? ",
    "Quel est l'âge de ton premier bisous ? ",
    "Lequel des 7 péchés capitaux dirige ta vie ? ",
    "T'es vierge ? ",
    "À quel âge as-tu perdu ta virginité ? ",
    "T'as déjà dormi dans la rue ? ",
    "T'as déjà volé quelque chose, si oui, c'était quoi ? ",
    "Tu fais pipi sous la douche ? ",
    "Quelle est la partie du corps que tu préfères chez ton amant.e ? ",
    "Quel est le dernier mensonge que tu aies dit ?",
    "Quelle est la chose la plus embarrassante que tu aies faite lors d’un rendez-vous ? ",
    "Nomme quelqu’un que tu as fait semblant d’aimer, mais que tu ne supportes pas. ",
    "Quel est ton surnom le plus bizarre ? ",
    "Que ferais-tu si tu rencontres un génie magique, quels seraient tes trois souhaits ? ",
    "Que ferais-tu que tu n’oses pas, si tu savais qu’il n’y aurait pas de conséquences ? ",
    "De qui es-tu le/la plus jaloux(se) ? ",
    "Est-ce que tu sortirais avec ton amour de lycée aujourd’hui ? ",
    "Quelle est la partie du corps que tu préfères chez quelqu’un du sexe opposé ? ",
    "Si tu étais sûr(e) de ne jamais te faire prendre, qui voudrais-tu assassiner sur Terre ? ",
    "Sur quelle application de ton Android passes-tu le plus de temps ? ",
    "Quel est l’âge le plus jeune d’un(e) partenaire avec qui tu pourrais sortir ? ",
    "As-tu déjà menti sur ton âge ? ",
    "Quel est ton plus grand regret dans la vie ? ",
    "Serais-tu prêt(e) à rompre avec ton/ta partenaire pour un million d’euros ? ",
    "Éprouves-tu encore des sentiments pour l’un(e) de tes ex ? ",
    "Si tu changeais de sexe pour une journée, que ferais-tu ? ",
    " Combien d’applications de retouche photo as-tu sur ton téléphone ? ",
    "Quelle est la chose dans ta vie que tu aimerais pouvoir changer ? ",
    "Si tu pouvais sortir avec deux personnes à la fois, le ferais-tu ? Si oui, avec qui ? ",
    "Avec combien de personnes as-tu fait l’amour ? ",
    "Qui, dans cette pièce, serait ton contact d’urgence ? ",
    "Épouserais-tu quelqu’un de riche sans être amoureux(se) ? ",
    "Quand et où as-tu eu ton premier baiser ? Avec qui était-il ? ",
    "Quelle est cette chose que tu ne ferais jamais même si quelqu’un t’offrait tout l’argent du monde ? ",
    "Quelle est la chose la plus embarrassante qui t’excite ? ",
    "De quoi es-tu le plus gêné ? ",
    " Si on te donnait un million de dollars, que ferais-tu avec ? ",
    "Si tu étais invisible, qu’est-ce que tu ferais ? ",
    "Tu préfèrerais ne plus boire ou ne plus manger ? ",
    " Quel prénom aurais-tu aimé avoir ? ",
    " Est-ce que tu préférais être hyper intelligent/e ou toujours heureux/se ? Pourquoi ?",
    "Est-ce que tu dors nu/e ? ",

  ];

  List Veritecouple=[
    "Tu m'as déjà menti ?",
    "Quelle partie de ton corps tu modifierais ? ",
    "C'est quoi le plus beau truc que t'as fait par amour ? ",
    "C'est quoi le truc le plus bizarre que t'as fait dans l'intimité ? ",
    "Tu penses que je porte quoi en dessous de mes vêtements ? ",
    "Avec quelle célébrité t'aimerais passer un moment intime ? ",
    "T'aimerais essayer avec une personne du même sexe ? ",
    "T'es cap de me raconter un truc embarrassant que t'as déjà fait ? ",
    "Qui est-ce que tu n'aimerais pas voir tout.e nu.e ? ",
    "On t'a déjà chopé en train de faire un truc pas très catholique ? ",
    "Tu penses quoi des relations à longue distance ? ",
    "Tu penses qu'une relation sans jalousie, c'est possible ? ",
    "T'aimerais te marier ? ",
    "Tu penses que tu serais un bon papa ? ",
    "Tu tombes facilement amoureux ? ",
    "Tu tombes facilement amoureux ? ",

  ];

  List Veritehot=[
    "Voudrais-tu avoir des relations sexuelles avec une personne de ce groupe ? ",
    "As-tu déjà eu des relations sexuelles avec une personne de ce groupe ? ",
    "Quelle est la personne la plus sexy ici ? ",
    "As-tu déjà pensé à tromper un petit copain/petite copine ? ",
    "Quelle est ta position sexuelle préférée ? ",
    "Qui, parmi les personnes de ce groupe, a le plus beau corps ? ",
    "As-tu déjà eu des relations sexuelles avec un inconnu/e ? ",
    "As-tu déjà eu des relations sexuelles dans la rue ? ",
    "As-tu déjà été surpris pendant des relations sexuelles ? ",
    "As-tu déjà eu des relations sexuelles avec une personne de votre sexe ? ",
    "Avez-vous déjà mis en doute votre orientation sexuelle ? ",
    "As-tu déjà été avec quelqu'un rencontré en ligne ? ",
    "T'as déjà fait un trio ? ",
    "Quelle a été ta pire expérience sexuelle ? ",
    "Quelle est ta plus grosse honte sexuelle ? ",
    "Selon toi, le plus important, c'est le sexe ou l'amour ? ",
    "À quel âge t'as fait ta première fois ? ",
    "Quelle est ta position sexuelle préférée ? ",
    "Te considères-tu comme un bon coup ?",
    "Combien d'aventures d'un soir t'as déjà eu ? ",
    "Quel est l'endroit le plus fou où tu as fait des trucs ? ",
    "Si tu devais te faire tatouer sur le pubis, tu ferais quoi ? ",
    "Avec combien de personnes t'as déjà couché ? ",
    "T'as déjà couché avec un.e ami.e ? ",
    "T'as déjà eu des rapports non protégés ? ",
    "Tu aimes parler quand tu fais l'amour ? ",
    "Tu cries quand tu jouis ? ",
    "Qu'est-ce que tu préfères dans les préliminaires ? ",
    "Tu as déjà simulé un orgasme ? ",
    "Quel est ton fantasme sexuel ? ",
    "Tu es plutôt fesses ou seins ? ",
    "T'as déjà fantasmé sur quelqu'un de ta famille ? ",
    "Qu'est-ce qui t'excite le plus ? ",
    "Tu as déjà vu des gens en train de faire des trucs ? ",
    "Avec quelle célébrité aimerais-tu passer une nuit endiablée ? ",
    "Simules-tu l’orgasme en regardant de côté ou en regardant la personne droit dans les yeux ? ",
    " As-tu des photos ou des vidéos épicées enregistrées sur ton téléphone ",
    "Si tu avais la possibilité de faire un plan à trois avec les personnes présentes dans cette pièce, avec qui le ferais-tu et pourquoi ? ",
    "Il est totalement illégal de séduire ses professeurs mais si c’était le cas, lequel choisirais-tu ? ",
    " Quelle est la chose la plus aventureuse sexuellement que tu voudrais que quelqu’un te fasse ? ",
    "Quelle culotte portes-tu ? ",
    "Qu’est-ce qui serait le plus excitant : l’acte en étant en colère ou l’acte de réconciliation ? ",
    "Quel est le plus grand nombre de fois où tu l’as fait en une journée ? ",
    " Quelle est ta partie du corps préférée sur une fille ? ",
    "Quand as-tu été tellement excitée que tu n’as pas pu le supporter ? ",
    "Avec qui as-tu le plus envie de coucher, parmi toutes les personnes présentes ? ",
    " ",
    " ",
    " ",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),


        body: Center(

          child: Column(

            children: <Widget>[

              Container(height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.black87,
                      spreadRadius:4,
                      blurRadius: 8,
                    )],
                    borderRadius:BorderRadius.only(bottomLeft: Radius.circular(100)) ,
                    gradient: LinearGradient(
                        colors: [
                          //Theme.of(context).colorScheme.inversePrimary,
                          Colors.deepOrange,
                          Colors.orangeAccent.shade200
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    )
                ),

                child:Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [

                          IconButton(
                              onPressed: () {
                                //Navigator.popUntil permet de reculer d'un certain nombre de pas donné
                                Navigator.of(context).pop();
                              },
                              icon:Icon(Icons.arrow_circle_left_outlined,color: Colors.black,size: 35,)
                          ),

                          IconButton(onPressed: () {
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(

                                title: Text("Dévéloppeur",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                                content:Container(height: 100,
                                  child: Column(
                                    children: [
                                      Icon(Icons.account_tree_outlined,color: Colors.orange,size: 55,),
                                      Text("01WARRIOR",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(onPressed: () {
                                    Navigator.of(context).pop();
                                  }, child: Text("Daccord super !"))
                                ],
                              );
                            },);
                          },
                              icon: Icon(Icons.info_outline,color: Colors.black,size: 35,)
                          ),
                        ],
                      ),

                      Text("Game fight...",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300),),

                      Center(
                        child: Container(
                            height: 70,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.all(Radius.circular(10))

                            ),
                            child: Icon(Icons.sunny_snowing,size: 50,color:Theme.of(context).colorScheme.inversePrimary)
                        ),
                      ),

                      SizedBox(height: 25,),

                      Text("Nombre de Joueur: ${widget.nombrejoueur}",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),
                      )
                    ],
                  ),
                ),

              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                ],
              ),

              //le containeur pour afficher les action ou verité
              Container(
                padding: EdgeInsets.all(50),
                height: 400,
                width: double.infinity,
                //si actionouveriteaafficher a true cest quil a cliquer sur action si non il a cliquer sur verité
                child: widget.actionouveriteaafficher==true?Column(
                  children: [Text("Action",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Text("${widget.Monelementhasardaction}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                  ],
                )
                    :
                Column(
                  children: [
                    Text("Verité",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Text("${widget.Monelementhasardverite}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                  ],
                ),
              ),

              Container(margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [

                    ElevatedButton.icon(
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.orange),minimumSize:MaterialStatePropertyAll(Size(300,70))),
                        onPressed: () {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              contentPadding: EdgeInsets.only(top: 30,bottom: 30),
                              title:Text("${widget.Monelementhasard}",textAlign:TextAlign.center,) ,
                              content: Container(height: 100,
                                  padding: EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text("Action ou verité ?",style: TextStyle(fontSize: 23),),
                                      Icon(Icons.emoji_emotions_outlined,color: Colors.orange,size: 25,)
                                    ],
                                  )
                              ),

                              actions:<Widget> [
                                ButtonBar(
                                  alignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    ElevatedButton(onPressed: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        //si action on actionouveriteaafficher est true
                                        //je donne a actionouveriteaafficher true pour pouvoir savoir sil a pris action ou verité : action cest true et verité false en fonction de ca je pourai envoyer une action ou une verité a lecran
                                        widget.actionouveriteaafficher=true;

                                        //en fontion du type de cadre je tire lelement hasard dans la bonne liste de action
                                        var indexhasardaction=Random().nextInt(Action.length);
                                        widget.Monelementhasardaction=Action[indexhasardaction];

                                        //en fontion du type de cadre je tire lelement hasard dans la bonne liste de verité
                                        if(widget.type=="Entre amie")
                                        {
                                          var indexhasardverite=Random().nextInt(Verite.length);
                                          widget.Monelementhasardverite=Verite[indexhasardverite];
                                        }
                                        else if(widget.type=="Hot")
                                        {
                                          var indexhasardverite=Random().nextInt(Veritehot.length);
                                          widget.Monelementhasardverite=Veritehot[indexhasardverite];
                                        }
                                        else if(widget.type=="Couple")
                                        {
                                          var indexhasardverite=Random().nextInt(Veritecouple.length);
                                          widget.Monelementhasardverite=Veritecouple[indexhasardverite];
                                        };

                                      });


                                    }, child:Text("Action")),

                                    ElevatedButton(onPressed: () {
                                      //augmenter la variable qui vas compter le nombre de fois rechargé
                                      Navigator.of(context).pop();
                                      setState(() {
                                        //si verité on actionouveriteaafficher est false
                                        //sil clique sur verité je donne a actionouveriteaafficher false pour pouvoir savoir sil a pris action ou verité : action cest true et verité false en fonction de ca je pourai envoyer une action ou une verité a lecran
                                        widget.actionouveriteaafficher=false;

                                        //en fontion du type de cadre je tire lelement hasard dans la bonne liste de action
                                        var indexhasardaction=Random().nextInt(Action.length);
                                        widget.Monelementhasardaction=Action[indexhasardaction];

                                        //en fontion du type de cadre je tire lelement hasard dans la bonne liste de verité
                                        if(widget.type=="Entre amie")
                                        {
                                          var indexhasardverite=Random().nextInt(Verite.length);
                                          widget.Monelementhasardverite=Verite[indexhasardverite];
                                        }
                                        else if(widget.type=="Hot")
                                        {
                                          var indexhasardverite=Random().nextInt(Veritehot.length);
                                          widget.Monelementhasardverite=Veritehot[indexhasardverite];
                                        }
                                        else if(widget.type=="Couple")
                                        {
                                          var indexhasardverite=Random().nextInt(Veritecouple.length);
                                          widget.Monelementhasardverite=Veritecouple[indexhasardverite];
                                        };

                                      });

                                      //reactualiser la page jeu pour afficher le choix action ou verité
                                      /*Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                            return PageJeu();
                                          },)
                                      );*/

                                    }, child:Text("Verité")),

                                  ],
                                ),

                              ],
                            );
                          },);


                          setState(() {
                            // quand utilisateur clique sur jouer choisir un joueur au hasard et mettre dans mon elementhasard
                            var indexhasard=Random().nextInt(widget.NomJoueur.length);
                            widget.Monelementhasard=widget.NomJoueur[indexhasard];

                          });


                        },
                        icon: Icon(Icons.games_rounded,size: 35,color: Colors.black87,),
                        label: Text("Lancer",style:TextStyle(color: Colors.black87,fontSize: 16),)),


                  ],

                ),
              ),

            ],
          ),
        ),
      );
  }
}
