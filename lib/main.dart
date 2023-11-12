
import 'package:ActionVerite/pageenregistrement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jeu action ou verité',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Jeu Action ou verité'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  List NomJoueur=[

  ];

  var type;

  var nombrejoueur=0;

  var Monelementhasard;

  var Monelementhasardaction;

  var Monelementhasardverite;

  bool actionouveriteaafficher=true;



  //Les clé de mes 4  formulaire
  final _cleForm1=GlobalKey<FormState>();

  //mes controleur ici
  final _ecouteurdecequisepassenom1=TextEditingController();
  final _ecouteurdecequisepassenom2=TextEditingController();
  final _ecouteurdecequisepassenom3=TextEditingController();
  final _ecouteurdecequisepassenom4=TextEditingController();
  final _ecouteurdecequisepassenom5=TextEditingController();

  //libérer des espace ou annuler des abonnement dans ce cas liberé la memoire
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _ecouteurdecequisepassenom1.dispose();
    _ecouteurdecequisepassenom2.dispose();
    _ecouteurdecequisepassenom3.dispose();
    _ecouteurdecequisepassenom4.dispose();
    _ecouteurdecequisepassenom5.dispose();
  }



  //------------------------------------Override------------------------------------------

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

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.black87,
                      spreadRadius:4,
                      blurRadius: 8,
                    )],
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
                      Text("Jeux action ou vérité",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),),

                      Container(padding: EdgeInsets.all(20),
                          child: Lottie.asset("assets/anim1.json",width:300)),



                      SizedBox(height: 100,),

                      SizedBox(width: 250,height: 60,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(4),
                            minimumSize: MaterialStatePropertyAll(Size(100,60)),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                return Commencer();
                              },
                              ),
                            );
                          },
                          label:Text("Commencer"),
                          icon:Icon(Icons.arrow_forward_ios_sharp) ,
                        ),
                      )
                    ],
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget Commencer()
  {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      //title: Text(widget.title),

      body: Center(

        child: Column(

          children: <Widget>[

            Container(height: 400,
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

                    Text("Jeux action ou vérité",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300),),

                    Center(
                      child: Container(
                          height: 70,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.all(Radius.circular(10))

                          ),
                          child: Icon(Icons.add_reaction_outlined,size: 50,color:Theme.of(context).colorScheme.inversePrimary)
                      ),
                    ),
                  ],
                ),
              ),

            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        DropdownMenu(
                          width: 320,
                          selectedTrailingIcon:Icon(Icons.arrow_drop_up,color: Colors.orange,size: 25,),
                          hintText: "Choisissez le Nombre de joueurs",
                          menuStyle:MenuStyle(
                            shadowColor:MaterialStatePropertyAll(Colors.black87 ),
                          ),

                          dropdownMenuEntries:[

                            DropdownMenuEntry(value: "Deux Joueurs", label:"Deux Joueurs"),
                            DropdownMenuEntry(value: "Trois Joueurs", label:"Trois Joueurs"),
                            DropdownMenuEntry(value: "Quatres Joueurs", label:"Quatres Joueurs"),
                            DropdownMenuEntry(value: "Cinq Joueurs", label:"Cinq Joueurs"),

                          ],
                          onSelected: (value) {
                            if(value=="Deux Joueurs")
                            {
                              setState(() {
                                nombrejoueur=2;
                              });
                            }
                            else if(value=="Trois Joueurs")
                            {
                              setState(() {
                                nombrejoueur=3;
                              });
                            }
                            else if(value=="Quatres Joueurs")
                            {
                              setState(() {
                                nombrejoueur=4;
                              });
                            }
                            else if(value=="Cinq Joueurs")
                            {
                              setState(() {
                                nombrejoueur=5;
                              });
                            };

                          },
                        ),

                        SizedBox(height: 20,),

                        DropdownMenu(
                          width: 320,
                          selectedTrailingIcon:Icon(Icons.arrow_drop_up,color: Colors.orange,size: 25,),

                          hintText: "Choisissez le type",
                          menuStyle:MenuStyle(
                            shadowColor:MaterialStatePropertyAll(Colors.black87 ),
                          ),

                          dropdownMenuEntries:[

                            DropdownMenuEntry(value: "Entre amie", label:"Entre amie"),
                            DropdownMenuEntry(value: "Hot", label:"Hot"),
                            DropdownMenuEntry(value: "Couple", label:"Couple"),
                          ],
                          onSelected: (value) {

                            if(value=="Entre amie")
                            {
                              setState(() {
                                type="Entre amie";
                              });
                            }
                            else if(value=="Hot")
                            {
                              setState(() {
                                type="Hot";
                              });
                            }
                            else if(value=="Couple")
                            {
                              setState(() {
                                type="Couple";
                              });
                            };

                          },
                        ),
                      ],
                    ),
                  ),

                ),
              ],
            ),

            Container(
              child: Column(
                children: [

                  SizedBox(
                    height: 120,
                  ),


                  ElevatedButton.icon(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.orange),minimumSize:MaterialStatePropertyAll(Size(300,60))),
                      onPressed: () {

                        //verifier si le champ Nombre joueur es vide ou pas si vide envoyer un alert de remplir si non continuer
                        if(nombrejoueur!=0)
                        {
                          //verifier si le champ type es vide ou pas si vide envoyer un alert de remplir si non continuer
                          if(type!=null)
                          {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {

//------------------------------------Methode Page denregistrement ---------------------------------------------------------------
                                  return MaPageEnregistrement();
                                },)
                            );
                          }
                          else
                            showDialog(context: context, builder: (context) {

                              return AlertDialog(
                                title: Text("Oups !"),
                                content: Text("Veillez entrez le type de cadre dans lequel vous souhetez jouer "),
                                actions: [
                                  TextButton(onPressed: () {
                                    Navigator.of(context).pop();

                                  }, child: Text(" ah Daccord "))
                                ],
                              );

                            },);
                        }
                        else
                          showDialog(context: context, builder: (context) {

                            return AlertDialog(
                              title: Text("Oups !"),
                              content: Text("Veillez entrez le nombre de joueur "),
                              actions: [
                                TextButton(onPressed: () {
                                  Navigator.of(context).pop();

                                }, child: Text(" ah Daccord "))
                              ],
                            );

                          },);


                      }, icon: Icon(Icons.add_circle_outline,size: 30,color: Colors.black87,),
                      label: Text("Suivant",style:TextStyle(color: Colors.black87,fontSize: 16),)),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }




  //--------------------------------Mes methode--------------------------------

  Widget formulaire1()
  {
    return Form(
      //avoir acces a une variable present dans un widget parent : le nom de la classe suivi du nom de variable
        key:_cleForm1 ,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 1")
              ),
              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom1 ,
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 2")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups veillez bien saisir les donneé";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom2 ,
            ),

          ],
        )
    );
  }


  Widget formulaire2()
  {
    return Form(
        key:_cleForm1 ,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 1")
              ),
              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom1 ,
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 2")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom2 ,

            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 3")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom3 ,

            ),

          ],
        )
    );
  }


  Widget formulaire3()
  {
    return Form(
        key:_cleForm1 ,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 1")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom1 ,
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 2")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom2 ,
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 3")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom3 ,
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 4")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom4 ,
            ),

          ],
        )
    );
  }


  Widget formulaire4()
  {
    return Form(
        key:_cleForm1 ,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 1")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom1 ,
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 2")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom2 ,
            ),

            SizedBox(height: 10,),


            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 3")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom3 ,
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 4")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom4 ,
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange,width: 2),borderRadius: BorderRadius.circular(20)),
                  icon: Icon(Icons.person),
                  label: Text("Nom joueur 5")
              ),

              //validator peu retourner quelquechose ou null
              validator: (value) {
                if( value==null || value.isEmpty )
                {
                  return "Oups saisissez le nom svp";
                };
                return null;
              },

              controller:_ecouteurdecequisepassenom5 ,
            ),

          ],
        )
    );
  }

  Widget MaPageEnregistrement()
  {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      //title: Text(widget.title),

      body: Center(

        child: Column(

          children: <Widget>[

            Container(height: 100,
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

            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: double.infinity,
                    height: 420,
                    margin: EdgeInsets.only(top: 0),
                    padding: EdgeInsets.only(left: 40,right: 40,top: 20),
                    child:nombrejoueur==2?formulaire1():nombrejoueur==3?formulaire2():nombrejoueur==4?formulaire3():nombrejoueur==5?formulaire4():null
                ),
              ],
            ),



            SizedBox(height: 50,),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.black87,
                      spreadRadius:4,
                      blurRadius: 8,
                    )],
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)) ,
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

                child: Container(margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [

                      SizedBox(height: 90,),

                      ElevatedButton.icon(

                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),minimumSize:MaterialStatePropertyAll(Size(300,70))),
                          onPressed: () {

                            if(_cleForm1.currentState!.validate())
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Validation en cours "))
                              );


                              setState(() {

                                // rempli ma liste de nom de joueur en fonction du nombre de joueur
                                if(nombrejoueur==2)
                                {
                                  NomJoueur.add(_ecouteurdecequisepassenom1.text);
                                  NomJoueur.add(_ecouteurdecequisepassenom2.text);
                                }
                                else if(nombrejoueur==3)
                                {
                                  NomJoueur.add(_ecouteurdecequisepassenom1.text);
                                  NomJoueur.add(_ecouteurdecequisepassenom2.text);
                                  NomJoueur.add(_ecouteurdecequisepassenom3.text);
                                }
                                else if(nombrejoueur==4)
                                {
                                  NomJoueur.add(_ecouteurdecequisepassenom1.text);
                                  NomJoueur.add(_ecouteurdecequisepassenom2.text);
                                  NomJoueur.add(_ecouteurdecequisepassenom3.text);
                                  NomJoueur.add(_ecouteurdecequisepassenom4.text);
                                }
                                else if(nombrejoueur==5)
                                {
                                  NomJoueur.add(_ecouteurdecequisepassenom1.text);
                                  NomJoueur.add(_ecouteurdecequisepassenom2.text);
                                  NomJoueur.add(_ecouteurdecequisepassenom3.text);
                                  NomJoueur.add(_ecouteurdecequisepassenom4.text);
                                  NomJoueur.add(_ecouteurdecequisepassenom5.text);
                                };

                              });

                              //Si validation OK je change de page a la page jeu
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return pagejeux(type:type,nombrejoueur:nombrejoueur,Monelementhasard:Monelementhasard,Monelementhasardaction:Monelementhasardaction,Monelementhasardverite:Monelementhasardverite,actionouveriteaafficher:actionouveriteaafficher,NomJoueur:NomJoueur);
                                  },)

                              );

                            }
                          },
                          icon: Icon(Icons.games_outlined,size: 30,color: Colors.black87,),
                          label: Text("Commencer l'aventure",style:TextStyle(color: Colors.black87,fontSize: 16),)
                      ),
                    ],
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }



}
