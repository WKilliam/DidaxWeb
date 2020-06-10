import 'dart:html';

import 'package:didax/Page/CreateNotice.dart';
import 'package:didax/Page/Createquestions.dart';
import 'package:didax/Page/Home.dart';
import 'package:didax/Page/HomeConnect.dart';
import 'package:didax/Page/ReadNotice.dart';
import 'package:didax/Page/StartTest.dart';
import 'package:didax/Page/Testmove.dart';
import 'package:didax/Page/testData.dart';
import 'package:didax/generated_plugin_registrant.dart';
import 'package:didax/models/Notice.dart';
import 'package:didax/models/Questionnaire.dart';
import 'package:didax/services/NoticeStock.dart';
import 'package:didax/models/Notice.dart';
import 'package:didax/services/QuestionData.dart';

import 'package:didax/services/firebase.dart';
import 'package:didax/services/firebaseSociete.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';
import 'package:didax/Page/InscriptionPage.dart';

import 'models/userEntrepreneur.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  User user;
  Notice notice = Notice();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: //ReadNotice(value:notice)
      MyHomePage()
        //new Createquestions(value : new UserEntrepreneur())
        //StartTest(refData:new QuestionList(),userTested:new User())
        //new Home(user:new User(),userE:new UserEntrepreneur())
        //new InscriptionPageEntrepreneur()
      //new InscriptionPageHunter()
        //new CreateNotice(value: new UserEntrepreneur())
        //new InscriptionPageCandidats()
        //new Testmove()
      //TestData()
      //new HomeConnect()

    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}


class _MyHomePageState extends State<MyHomePage>{

  Firebase _firebase = Firebase();
  List<User> _users;
  FirebaseSociety _firebaseSociety = FirebaseSociety();
  List<UserEntrepreneur> _usersE;
  UserEntrepreneur _usrE;
  User _usr;
  bool Candidat=false;
  bool Entrepreneur = false;
  String writeId='Identifiant/Matricule';
  String writePass='Mot de passe';

  String id;
  String pass;

    @override
    Widget build(BuildContext context) {


      return new Scaffold(
          appBar: new AppBar(
            title: new Text('DIDAX',
              textAlign: TextAlign.center,
              textScaleFactor: 2.0,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                  fontStyle: FontStyle.italic
              ),
            ),// place le titre de la app  barre
            actions: [
              new Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/2,
                //color: Colors.greenAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/8,
                      height: MediaQuery.of(context).size.height/8,
                      alignment: Alignment.topLeft,
                      //color: Colors.red,
                      child: Card(
                        color: Colors.white12,
                        elevation: 5,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(border: InputBorder.none, hintText: writeId),
                          onSubmitted: (String string){
                            setState(() {
                              id =string;
                            });
                          },
                          onChanged: (String string){
                            setState(() {
                              id =string;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/8,
                      height: MediaQuery.of(context).size.height/8,
                      alignment: Alignment.topLeft,
                      //color: Colors.red,
                      child: Card(
                        color: Colors.white12,
                        elevation: 5,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(border: InputBorder.none, hintText: writePass),
                          onSubmitted: (String string){
                            setState(() {
                              pass =string;
                            });
                          },
                          onChanged: (String string){
                            setState(() {
                              pass =string;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/10,
                      height: MediaQuery.of(context).size.height/10,
                      //alignment: Alignment.topLeft,
                      //color: Colors.red,
                      child: Card(
                        color: Colors.white12,
                        elevation: 5,
                        child: new RaisedButton(
                          color: Colors.white10,
                            child: new Text('Connection',
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.5,
                              style: new TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10.0,
                                  fontStyle: FontStyle.normal
                              ),),
                            onPressed: (){checkId();
                            })
                      ),
                    ),
                  ],
                ),

              ),
              //new Container(width: 10, height: 10, color: Colors.red,),
              //new IconButton(icon: new Icon(Icons.account_circle), onPressed: (){inscriptionPageRoute();}),

            ],//place une icon
            elevation: 10.0,//met de l'ombre
            centerTitle: true, //centre le titre
          ),
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xff1b202b),
              child: Stack(
                children: [
                  Center(
                    child: new Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Opacity(
                        opacity: 0.2,
                        child: new Image.network('image/mycode.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      new Container(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width/4,
                        height: MediaQuery.of(context).size.height/1.3,
                        margin: EdgeInsets.only(top: 10.0,bottom: 15.0),
                        child: new RaisedButton(
                          onPressed: () => inscriptionPageRouteCandidat(), // handle your onTap here
                          child: Container(
                            color: const Color(0xff1b202b),
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 10.0,bottom: 15.0),
                            child: new Image.network('image/codeur.jpg',fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                      new Container(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width/4,
                        height: MediaQuery.of(context).size.height/1.3,
                        margin: EdgeInsets.only(top: 10.0,bottom: 15.0),
                        child: new RaisedButton(
                          onPressed: () => inscriptionPageRouteHunter(), // handle your onTap here
                          child: Container(
                            color: const Color(0xff1b202b),
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 10.0,bottom: 15.0),
                            child: new Image.network('image/hunter.png',fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                      new Container(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width/4,
                        height: MediaQuery.of(context).size.height/1.3,
                        margin: EdgeInsets.only(top: 10.0,bottom: 15.0),
                        child: new RaisedButton(
                          onPressed: () => inscriptionPageRouteEntrepreneur(), // handle your onTap here
                          child: Container(
                            color: const Color(0xff1b202b),
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                            child: new Image.network('image/entreprise.png',fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Container(
                          width: MediaQuery.of(context).size.width/4,
                          height: MediaQuery.of(context).size.height/1.5,
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.2,bottom: 15.0),
                          //color: Colors.blue,
                          child:  new Center(
                            child: new Text('Inscription pour :'+'\n'+'les Demandeurs D\'emploi',
                              textAlign: TextAlign.center,
                              textScaleFactor: 2.0,
                              style: new TextStyle(
                                  color: const Color(0xffffffcc),
                                  fontSize: 10.0,
                                  fontStyle: FontStyle.italic
                              ),),
                          ),
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width/4,
                          height: MediaQuery.of(context).size.height/1.5,
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.2,bottom: 15.0),
                          //color: Colors.blue,
                          child:  new Center(
                            child: new Text('Inscription pour :'+'\n'+'Recruteurs / Recrutrices',
                              textAlign: TextAlign.center,
                              textScaleFactor: 2.0,
                              style: new TextStyle(
                                  color: const Color(0xffffffcc),
                                  fontSize: 10.0,
                                  fontStyle: FontStyle.italic
                              ),),
                          ),
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width/4,
                          height: MediaQuery.of(context).size.height/1.5,
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.2,bottom: 15.0),
                          //color: Colors.blue,
                          child:  new Center(
                            child: new Text('Inscription pour :'+'\n'+'Les entreprises',
                              textAlign: TextAlign.center,
                              textScaleFactor: 2.0,
                              style: new TextStyle(
                                  color: const Color(0xffffffcc),
                                  fontSize: 10.0,
                                  fontStyle: FontStyle.italic
                              ),),
                          ),
                        ),
                      ])
                ],
              ),
            ),
          ),
      );
    }

    checkId() async{

      await checkidUser();
      await checkidUserE();


      for(int i =0;i<_users.length;i++){
        if(id==_users[i].id){
          setState(() {
            Candidat=true;
            _usr=_users[i];
          });
        }
      }




      for(int i =0;i<_usersE.length;i++){
        if(id==_usersE[i].matricule){
          print(_usersE[i]);
          setState(() {
            Entrepreneur=true;

            _usrE=_usersE[i];
            print(_usrE.matricule);
          });
        }
      }


      if(Candidat){
        if(pass==_usr.passWord){
          print(_usr.id);
          Navigator.push(context, MaterialPageRoute(builder: (context) => new Home(user:_usr,userE:new UserEntrepreneur())));
        }else{
          setState(() {
            writePass='Mauvais mot de pass';
          });
        }
      }


      if(Entrepreneur){
        print('entré');
        if(pass==_usrE.passWord){
          Navigator.push(context, MaterialPageRoute(builder: (context) => new Home(user:new User(),userE:_usrE)));
        }else if(pass == null){
          setState(() {
            writePass='Mauvais mot de pass';
          });
        }
      }
    }

    checkidUser()async{

      Future<List<User>> future = _firebase.getAllUsers();
      

      await future.then((value) => handUser(value));
      

    }

    checkidUserE()async{
      Future<List<UserEntrepreneur>> futureE =_firebaseSociety.getAllUsers();
      await futureE.then((value) => handUserSociety(value));
    }
    

    handUser(List<User> value) {_users=value;}
    handUserSociety(List<UserEntrepreneur> value) {_usersE=value;}

    void inscriptionPageRouteHunter(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new InscriptionPageHunter()));
    }

    void inscriptionPageRouteEntrepreneur(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new InscriptionPageEntrepreneur()));
    }

    void inscriptionPageRouteCandidat(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new InscriptionPageCandidats()));
    }




}

