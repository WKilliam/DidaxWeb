import 'package:didax/Page/Home.dart';
import 'package:didax/Page/HomeConnect.dart';
import 'package:didax/Page/Testmove.dart';
import 'package:didax/services/firebase.dart';
import 'package:didax/models/user.dart';
import 'package:didax/services/firebaseSociete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:didax/models/userEntrepreneur.dart';

class InscriptionPageCandidats extends StatefulWidget {
  @override
  _InscriptionPageStateC createState() => _InscriptionPageStateC();
}

class _InscriptionPageStateC extends State<InscriptionPageCandidats> {

  @override
  void initState() {
    super.initState();
  }

  Firebase _firebase = Firebase();
  List<User> _users;
  bool problem = false;
  String problemeWrite='je test ici';
  bool _checkID;
  bool goodvalide = true;
  User finalUser=User();

  String lastName='';
  String firstName='';
  String dayBorn='0';
  String mouthBorn='0';
  String yearBorn='0';
  String city='';
  String mail='';
  String idConnection='';
  String passWordConnection='';
  String certifpassConnection='';

  String siretvalue='';
  String expvalue='0';

  String dayBornActivity='0';
  String mouthBornActivity='0';
  String yearBornActivity='0000';
  String mailActivity='';


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
          ),),
      ),
      body:
      Center(
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
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.1,
                        height: MediaQuery.of(context).size.height/1.1,
                        //color: Colors.red,
                        margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Color.fromRGBO(165, 183, 192, 0.5),
                          child: Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                //color: Colors.red,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/1.5,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: Color.fromRGBO(135, 159, 171, 0.5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                                'Informations Personnels',
                                                textAlign: TextAlign.center,
                                                textScaleFactor: 1.7,
                                                style: new TextStyle(
                                                    color: const Color(0xffffffcc),
                                                    fontSize: 20.0,
                                                    fontStyle: FontStyle.normal
                                                )
                                            ),
                                          )
                                        ),
                                      )
                                    ],
                                  ),//affiche imformation personnels
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/3.5,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: Color.fromRGBO(135, 159, 171, 0.5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                                'Nom',
                                                textAlign: TextAlign.center,
                                                textScaleFactor: 1.7,
                                                style: new TextStyle(
                                                    color: const Color(0xffffffcc),
                                                    fontSize: 20.0,
                                                    fontStyle: FontStyle.normal
                                                )
                                            ),
                                          )
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/3.5,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: Color.fromRGBO(135, 159, 171, 0.5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: TextField(
                                              onSubmitted: (String string){
                                                setState(() {
                                                  lastName =string.toLowerCase();
                                                });
                                              },
                                              onChanged: (String string){
                                                setState(() {
                                                  lastName =string.toLowerCase();
                                                });
                                              },
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                              style: new TextStyle(
                                                  color: const Color(0xffffffcc),
                                                  fontSize: 20.0,
                                                  fontStyle: FontStyle.normal
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),// Nom + TextInput
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/3.5,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  'Prenom',
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: 1.7,
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/3.5,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: Color.fromRGBO(135, 159, 171, 0.5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: TextField(
                                              onSubmitted: (String string){
                                                setState(() {
                                                  firstName =string.toLowerCase();
                                                });
                                              },
                                              onChanged: (String string){
                                                setState(() {
                                                  firstName =string.toLowerCase();
                                                });
                                              },
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                              style: new TextStyle(
                                                  color: const Color(0xffffffcc),
                                                  fontSize: 20.0,
                                                  fontStyle: FontStyle.normal
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),//Prenom + TextInput
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/4,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  'Jour',
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: 1.7,
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/4,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  'Mois',
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: 1.7,
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/4,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  'Année',
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: 1.7,
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                    ],
                                  ),// jour /Mois /Anne
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/4,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: Color.fromRGBO(135, 159, 171, 0.5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(2)],
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                              style: new TextStyle(
                                                  color: const Color(0xffffffcc),
                                                  fontSize: 20.0,
                                                  fontStyle: FontStyle.normal
                                              ),
                                              onFieldSubmitted: (String string){
                                                setState(() {
                                                  dayBorn =string;
                                                });
                                              },
                                              onChanged: (String string){
                                                setState(() {
                                                  dayBorn =string;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/4,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: Color.fromRGBO(135, 159, 171, 0.5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(2)],
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                              style: new TextStyle(
                                                  color: const Color(0xffffffcc),
                                                  fontSize: 20.0,
                                                  fontStyle: FontStyle.normal
                                              ),
                                              onFieldSubmitted: (String string){
                                                setState(() {
                                                  mouthBorn =string;
                                                });
                                              },
                                              onChanged: (String string){
                                                setState(() {
                                                  mouthBorn =string;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/4,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: Color.fromRGBO(135, 159, 171, 0.5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(4)],
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                              style: new TextStyle(
                                                  color: const Color(0xffffffcc),
                                                  fontSize: 20.0,
                                                  fontStyle: FontStyle.normal
                                              ),
                                              onFieldSubmitted: (String string){
                                                setState(() {
                                                  yearBorn =string;
                                                });
                                              },
                                              onChanged: (String string){
                                                setState(() {
                                                  yearBorn =string;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),// JInput / MInput / AInput
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/2.5,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  'Adresse mail',
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: 1.7,
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/2.5,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  'Ville Actuelle',
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: 1.7,
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  )
                                              ),
                                            )
                                        ),
                                      )
                                    ],
                                  ),//Adresse mail + Ville actuelle
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/2.5,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: Color.fromRGBO(135, 159, 171, 0.5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: TextField(
                                              onSubmitted: (String string){
                                                setState(() {
                                                  mail=string;
                                                });
                                              },
                                              onChanged: (String string){
                                                setState(() {
                                                  mail=string;
                                                });
                                              },
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                              style: new TextStyle(
                                                  color: const Color(0xffffffcc),
                                                  fontSize: 20.0,
                                                  fontStyle: FontStyle.normal
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),Container(
                                        width: MediaQuery.of(context).size.width/2.5,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          color: Color.fromRGBO(135, 159, 171, 0.5),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: TextField(
                                              onSubmitted: (String string){
                                                setState(() {
                                                  city=string;
                                                });
                                              },
                                              onChanged: (String string){
                                                setState(() {
                                                  city=string;
                                                });
                                              },
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                              style: new TextStyle(
                                                  color: const Color(0xffffffcc),
                                                  fontSize: 20.0,
                                                  fontStyle: FontStyle.normal
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),// AMInput / Ville
                                  //RaisedButton(onPressed: (){print('this name,fistname  => '+lastName +' / '+firstName+' Number check'+dayBorn+' / '+mouthBorn+' / '+yearBorn );},)
                                ],
                              )
                            ),
                          )
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/1.1,
                        height: MediaQuery.of(context).size.height/1.1,
                        //color: Colors.red,
                        margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                        child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Color.fromRGBO(165, 183, 192, 0.5),
                            child: Center(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  //color: Colors.red,
                                  child: Column(

                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Informations Optionnel',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          )
                                        ],
                                      ),//imformation optionnel
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Informations Proffessionnel',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          )
                                        ],
                                      ),// information professionnel
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Numéro Siret',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      siretvalue =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      siretvalue =string;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),//Numéro de siret
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Expérience',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/4,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextFormField(
                                                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(2)],
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  onFieldSubmitted: (String string){
                                                    setState(() {
                                                      expvalue =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      expvalue =string;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),//Expérience
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Date du début de votre activité',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          )
                                        ],
                                      ),//Date activité
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/4,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextFormField(
                                                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(2)],
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  onFieldSubmitted: (String string){
                                                    setState(() {
                                                      dayBornActivity =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      dayBornActivity =string;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/4,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextFormField(
                                                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(2)],
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  onFieldSubmitted: (String string){
                                                    setState(() {
                                                      mouthBornActivity =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      mouthBornActivity =string;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/4,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextFormField(
                                                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(4)],
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                  onFieldSubmitted: (String string){
                                                    setState(() {
                                                      yearBornActivity =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      yearBornActivity =string;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),//valeur date activité
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Mail de votre Entreprise',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          )
                                        ],
                                      ),//mail entreprise
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: TextField(
                                                      keyboardType: TextInputType.number,
                                                      onSubmitted: (String string){
                                                        setState(() {
                                                          mailActivity=string;
                                                        });
                                                      },
                                                      onChanged: (String string){
                                                        setState(() {
                                                          mailActivity =string;
                                                        });
                                                      },
                                                      textAlign: TextAlign.center,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                      ),
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ),
                                          )
                                        ],
                                      ),//valeur mail entreprise
                                      //RaisedButton(onPressed: (){print(' siret => '+siretvalue+' exp '+expvalue+' dayvalue '+dayBornActivity+' mont '+mouthBornActivity+' year '+yearBornActivity+' mail '+mailActivity);},)
                                    ],
                                  )
                              ),
                            )
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width/1.1,
                          height: MediaQuery.of(context).size.height/2.2,
                          //color: Colors.red,
                          margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Color.fromRGBO(165, 183, 192, 0.5),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                //color: Colors.red,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.5,
                                          height: MediaQuery.of(context).size.height/15,
                                          //color: Colors.red,
                                          margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                          child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Compte',
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),
                                              )
                                          ),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/3.5,
                                          height: MediaQuery.of(context).size.height/15,
                                          //color: Colors.red,
                                          margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                          child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Pseudo',
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),
                                              )
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width/3.5,
                                          height: MediaQuery.of(context).size.height/15,
                                          //color: Colors.red,
                                          margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                          child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: TextField(
                                                onSubmitted: (String string){
                                                  setState(() {
                                                    idConnection =string;
                                                  });
                                                },
                                                onChanged: (String string){
                                                  setState(() {
                                                    idConnection =string;
                                                  });
                                                },
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                ),
                                                style: new TextStyle(
                                                    color: const Color(0xffffffcc),
                                                    fontSize: 20.0,
                                                    fontStyle: FontStyle.normal
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/3.5,
                                          height: MediaQuery.of(context).size.height/15,
                                          //color: Colors.red,
                                          margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                          child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Mot de passe',
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),
                                              )
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width/3.5,
                                          height: MediaQuery.of(context).size.height/15,
                                          //color: Colors.red,
                                          margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                          child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: TextField(
                                                obscureText: true,
                                                onSubmitted: (String string){
                                                  setState(() {
                                                    passWordConnection =string;
                                                  });
                                                },
                                                onChanged: (String string){
                                                  setState(() {
                                                    passWordConnection =string;
                                                  });
                                                },
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                ),
                                                style: new TextStyle(
                                                    color: const Color(0xffffffcc),
                                                    fontSize: 20.0,
                                                    fontStyle: FontStyle.normal
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/3.5,
                                          height: MediaQuery.of(context).size.height/15,
                                          //color: Colors.red,
                                          margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                          child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Confirmation du mot de passe',
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),
                                              )
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width/3.5,
                                          height: MediaQuery.of(context).size.height/15,
                                          //color: Colors.red,
                                          margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                          child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: TextField(
                                                obscureText: true,
                                                onSubmitted: (String string){
                                                  setState(() {
                                                    certifpassConnection =string;
                                                  });
                                                },
                                                onChanged: (String string){
                                                  setState(() {
                                                    certifpassConnection =string;
                                                  });
                                                },
                                                textAlign: TextAlign.center,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                ),
                                                style: new TextStyle(
                                                    color: const Color(0xffffffcc),
                                                    fontSize: 20.0,
                                                    fontStyle: FontStyle.normal
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ),
                      Container(
                          child: problem == true ?
                          Container(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height,
                            //color: Colors.red,
                              margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Color.fromRGBO(165, 183, 192, 0.5),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Information de Creation Compte',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),

                                        ],
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/1.2,
                                        height: MediaQuery.of(context).size.height/1.2,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  problemeWrite,
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: 1.7,
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                              )
                          ):null
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/1.1,
                        height: MediaQuery.of(context).size.height/8,
                        //color: Colors.red,
                        margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Color.fromRGBO(165, 183, 192, 0.5),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              //color: Colors.red,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/1.5,
                                        height: MediaQuery.of(context).size.height/15,
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                        child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: goodvalide == true ? RaisedButton(
                                              onPressed: (){finalityInscription();},
                                              color: Color.fromRGBO(135, 171, 144, 1),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Validation',
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),
                                              ),
                                            ):RaisedButton(
                                              onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user:finalUser,userE:new UserEntrepreneur())));},
                                              color: Color.fromRGBO(135, 171, 144, 1),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Continuer',
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),
                                              ),
                                            ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  void finalityInscription(){



    int yesorno = allValueVidecheked();

    switch(yesorno){
      case 0:
        validInscription(true);
        print('case 0');

        // manque info importante info perso id co
        break;
      case 1:
        validInscription(false);
        print('case 1');
        // manque info pas rempli tous info activité si un element mis
        break;
      case 2:
        setState(() {
          problem = true;
          problemeWrite='Il vous manque des informations';
        });
        print('case 2');
        // manque info perso co + activité si un element mis
        break;
      case 3:
        setState(() {
          problem = true;
          problemeWrite='Vous devez compléter toutes les informations Optionnel ou laissez les champs vide.';
        });
        print('case 3');
        //tous les elements important son bon
        break;
    }

  }

  int allValueVidecheked() {


    var videfirstname=checkVide(firstName, true);
    var videlastname=checkVide(lastName, true);
    var videmail=checkVide(mail, true);
    var videcity=checkVide(city, true);
    var videID=checkVide(idConnection, true);
    var videMDP=checkVide(passWordConnection, true);
    var videMDPC=checkVide(certifpassConnection, true);
    var videdayB=checkVide(dayBorn, false);
    var videmouB=checkVide(mouthBorn, false);
    var videyearB=checkVide(yearBorn, false);

    var videsiret=checkVide(siretvalue, true);
    var videEXP=checkVide(expvalue, false);
    var videmailactivity=checkVide(mailActivity, true);
    var videdayBA=checkVide(dayBornActivity, false);
    var videmouBA=checkVide(mouthBornActivity, false);
    var videyearBA=checkVide(yearBornActivity, false);

    if(videfirstname && videlastname && videmail && videcity && videID && videMDP && videMDPC && videdayB && videmouB && videyearB
        && !videsiret && !videEXP && !videmailactivity && !videdayBA && !videmouBA && !videyearBA){
      return 0;
    }
    else if(videfirstname && videlastname && videmail && videcity && videID && videMDP && videMDPC && videdayB && videmouB && videyearB
        && videsiret && videEXP && videmailactivity && videdayBA && videmouBA && videyearBA){
      return 1;
    }
    else if(!videfirstname || !videlastname || !videmail || !videcity || !videID || !videMDP || !videMDPC || !videdayB || !videmouB || !videyearB
         && !videsiret && !videEXP && !videmailactivity && !videdayBA && !videmouBA && !videyearBA){
      return 2;
    }
    else if
    ( videfirstname && videlastname && videmail && videcity && videID && videMDP && videMDPC && videdayB && videmouB && videyearB &&
        videsiret || videEXP || videmailactivity || videdayBA || videmouBA || videyearBA ){
      return 3;
    }

  }

  void validAll(){


    final User usr = User();
    usr.firstName = firstName;
    usr.lastName = lastName;
    usr.city = city;
    usr.dayBorn = int.parse(dayBorn);
    usr.mouthBorn = int.parse(mouthBorn);
    usr.yearBorn = int.parse(yearBorn);
    usr.dayBornActivity= int.parse(dayBornActivity);
    usr.mouthBornActivity=int.parse(mouthBornActivity);
    usr.yearBornActivity=int.parse(yearBornActivity);
    usr.siretvalue = siretvalue;
    usr.expvalue = int.parse(expvalue);
    usr.mail = mail;
    usr.mailActivity = mailActivity;
    usr.id=idConnection;
    usr.passWord=passWordConnection;
    usr.confirmPW=certifpassConnection;
    _firebase.addUser(usr.toMap());
    setState(() {
      finalUser=usr;
    });
  }

  void validInscription(bool notwithActivity) async{


    var validmail = checkmail(mail);
    var validmailActivity = checkmail(mailActivity);
    Future<bool> check = checkidUser(idConnection);
    await check.then((value) => handValueID(value)).catchError((error) => handleErrorID(error));
    bool pass = checkConfirmation(passWordConnection,certifpassConnection);
    var dayB = checkFormatday(int.parse(dayBorn));
    var mouB = checkFormatmouth(int.parse(mouthBorn));
    var yearB = checkFormatyear(int.parse(yearBorn));
    var dayA = checkFormatday(int.parse(dayBornActivity));
    var mouA = checkFormatmouth(int.parse(mouthBornActivity));
    var yearA = checkFormatyearA(int.parse(yearBornActivity));


    switch(notwithActivity){
      case true:
        if(validmail && _checkID && pass && dayB && mouB && yearB){
          setState(() {
            problem = true;
            problemeWrite='Bienvenu sur DIDAX';
            goodvalide=false;
          });
          validAll();
        }else{
          var word='Votre Mail n\'est pas valide';
          var word1='Cette identifiant existe déja';
          var word2='Vous avez fais une erreur au niveau de votre date de naissance ou nous n\'étez pas majeur';
          var word3= 'Votre mot de passe n\'est pas le même';
          if(!validmail){
            setState(() {
              problem = true;
              problemeWrite=word+'\n';
            });
          }else if (!_checkID){
            setState(() {
              problem = true;
              problemeWrite=word1+'\n';
            });
          }else if(!pass){
            setState(() {
              problem = true;
              problemeWrite=word3+'\n';
            });
          }else if(!dayB || !mouB || !yearB){
            setState(() {
              problem = true;
              problemeWrite=word2+'\n';
            });
          }
        }
        break;
      case false:
        if(validmail && _checkID && pass && dayB && mouB && yearB && validmailActivity && dayA && mouA && yearA){
          setState(() {
            problem = true;
            problemeWrite='Felicitation vous etez inscrit un code d\'identification vous a etez envoyé '+'\n'+'appuyé sur continuer pour finaliser l\'inscription';
            goodvalide=false;
          });
          validAll();
        }else{
          var word='Votre Mail n\'est pas valide';
          var word1='Cette identifiant existe déja';
          var word2='Vous avez fais une erreur au niveau de votre date de naissance ou nous n\'étez pas majeur';
          var word3= 'Votre mot de passe n\'est pas le même';
          var word4= 'Votre adresse Professionnel n\'est pas valide';
          var word5='Votre date de création d\'entreprise n\'est pas valide';
          if(!validmail){
            setState(() {
              problem = true;
              problemeWrite=word+'\n';
            });
          }else if (!_checkID){
            setState(() {
              problem = true;
              problemeWrite=word1+'\n';
            });
          }else if(!pass){
            setState(() {
              problem = true;
              problemeWrite=word3+'\n';
            });
          }else if(!dayB || !mouB || !yearB){
            setState(() {
              problem = true;
              problemeWrite=word2+'\n';
            });
          }else if(!dayA || !mouA || !yearA){
            setState(() {
              problem = true;
              problemeWrite=word5+'\n';
            });
          }else if(!validmailActivity){
            setState(() {
              problem = true;
              problemeWrite=word4+'\n';
            });
          }

        }
        break;
    }
  }

  void handValue(List<User> value)async{
    _users = value;
  }

  handleError(error) {
    print(error);
  }

  Future<bool> checkidUser(String id)async{

    Future<List<User>> future = _firebase.getAllUsers();
    await future.then((value) => handValue(value));

    bool position =true;

    for(int i=0;i<_users.length;i++){
      if(_users[i].id==id){
        position=false;
      }
    }
    return position;
  }

  void handValueID(bool value)async{
    _checkID = value ;
  }

  handleErrorID(error) {
    print(error);
  }

  bool checkConfirmation(String passWord,String confimpassWord){
    if(passWord == confimpassWord){
      return true;
    }else{
      return false;
    }
  }

  bool checkFormatday(int day){

    if(day<=0||day>=32){
      return false;
    }else{
      return true;
    }
  }

  bool checkVide(String caract,bool typecheck){

    //print('test'+caract);
    var vide ='';
    var zero ='0';
    var zeros ='0000';
    var moinUn ='-1';

    switch(typecheck){
      case true:
        if(caract == vide){
          return false;
        }else{
          return true;
        }
        break;
      case false:
        if(caract == zero||caract==zeros){
          return false;
        }else{
          return true;
        }
        break;
    }
  }

  bool checkFormatmouth(int mouth){

    if(mouth>0 && mouth <13){
      return true;
    }else{
      return false;
    }
  }

  bool checkFormatyear(int year){

    var now = new DateTime.now();
    var yearActuel = now.year;


    if ((yearActuel - year) < 18 || year >= yearActuel) {
        return false;
    } else {
        return true;
    }

  }

  bool checkFormatyearA(int year){

    var now = new DateTime.now();
    var yearActuel = now.year;


    if (year <= yearActuel) {
      return true;
    } else {
      return false;
    }

  }

  bool checkmail(String email){

    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }


}



class InscriptionPageEntrepreneur extends StatefulWidget {
  @override
  _InscriptionPageEntrepreneurState createState() => _InscriptionPageEntrepreneurState();
}

class _InscriptionPageEntrepreneurState extends State<InscriptionPageEntrepreneur> {


  FirebaseSociety _firebaseSociety = FirebaseSociety();
  List<UserEntrepreneur> _users;
  String nomSociete='';
  String siret='';
  String matricule='';
  String mail='';
  String city='';
  String secteurActiviter='';
  String passWord='';
  String passWordConfirm='';
  bool goodvalide=true;
  String problemeWrite='';
  bool problem=false;
  bool _checkID;
  UserEntrepreneur entrepreneur=UserEntrepreneur();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('DIDAX',
          textAlign: TextAlign.center,
          textScaleFactor: 2.0,
          style: new TextStyle(
              color: Colors.black,
              fontSize: 10.0,
              fontStyle: FontStyle.italic
          ),),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff1b202b),
          child: Stack(
            children: [
              Center(
                child: Container(
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
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.1,
                        height: MediaQuery.of(context).size.height+(MediaQuery.of(context).size.height/12),
                        //color: Colors.red,
                        margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                        child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Color.fromRGBO(165, 183, 192, 0.5),
                            child: Center(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  //color: Colors.red,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Informations Entreprise',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Nom de la Société',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/2,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      nomSociete =string.toLowerCase();
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      nomSociete =string.toLowerCase();
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Matricule',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/2,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      matricule =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      matricule =string;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Numéro Siret',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/2,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      siret =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      siret =string;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Mail',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/2,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      mail =string.toLowerCase();
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      mail =string.toLowerCase();
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Ville',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/2,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      city =string.toLowerCase();
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      city =string.toLowerCase();
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Secteur d\'activité',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/2,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      secteurActiviter =string.toLowerCase();
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      secteurActiviter =string.toLowerCase();
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Mot de Passe',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/2,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  obscureText: true,
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      passWord =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      passWord =string;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Confirmation du Mot de Passe',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 15.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/2,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  obscureText: true,
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      passWordConfirm =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      passWordConfirm =string;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            )
                        ),
                      ),
                      Container(
                          child: problem == true ? Container(
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height,
                              //color: Colors.red,
                              margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Color.fromRGBO(165, 183, 192, 0.5),
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/1.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Information de Creation du profil',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            ),

                                          ],
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.2,
                                          height: MediaQuery.of(context).size.height/1.2,
                                          //color: Colors.red,
                                          margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                          child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    problemeWrite,
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),
                                              )
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              )
                          ):null
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width/1.1,
                          height: MediaQuery.of(context).size.height/8,
                          //color: Colors.red,
                          margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Color.fromRGBO(165, 183, 192, 0.5),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                //color: Colors.red,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.5,
                                          height: MediaQuery.of(context).size.height/15,
                                          //color: Colors.red,
                                          margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                          child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.5),
                                            child: goodvalide == true ? RaisedButton(
                                              onPressed: (){finalityInscription();},
                                              color: Color.fromRGBO(135, 171, 144, 1),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Valider votre inscription',
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),
                                              ),
                                            ):RaisedButton(
                                              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user:new User(),userE:entrepreneur)));},
                                              color: Color.fromRGBO(135, 171, 144, 1),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    'Continuer',
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void finalityInscription() {


    print('nom societe : '+nomSociete);
    print('nom siret : '+siret);
    print('nom matricule : '+matricule);
    print('nom mail : '+mail);
    print('nom ville : '+city);
    print('nom secteur : '+secteurActiviter);
    print('nom MDP : '+passWord);
    print('nom MDPC : '+passWordConfirm);


    int yesorno = allValueVidecheked();

    print(yesorno);

    switch(yesorno){
      case 1:
        print('PAS OK !!!!');

        validInscription();

        break;
      case 0:
        print('PAS Case 1 !!!!');
        setState(() {
          problem = true;
          problemeWrite='Veuiller remplir tous les champs';
        });
        break;

    }


  }
  int allValueVidecheked() {


    var videNomSociete=checkVide(nomSociete, true);
    var videMatricule=checkVide(matricule, true);
    var videSiret=checkVide(siret, true);
    var videMail=checkVide(mail, true);
    var videCity=checkVide(city, true);
    var videSecteurActiviter=checkVide(secteurActiviter, true);
    var videpassWord=checkVide(passWord, true);
    var videpassWordConfirm=checkVide(passWordConfirm, true);


    if(videNomSociete && videMatricule && videSiret && videSecteurActiviter
        && videpassWord && videpassWordConfirm && videCity && videMail ){
      return 1;
    }else{
      return 0;
    }


  }
  bool checkVide(String caract,bool typecheck){

    //print('test'+caract);
    var vide ='';
    var zero ='0';
    var zeros ='0000';


    switch(typecheck){
      case true:
        if(caract == vide){
          return false;
        }else{
          return true;
        }
        break;
      case false:
        if(caract == zero||caract==zeros){
          return false;
        }else{
          return true;
        }
        break;
    }
  }

  void validInscription() async{

    print('je suis entrer');
    var validmail = checkmail(mail);

    Future<bool> check = checkidUser(matricule);
    await check.then((value) => handValueID(value)).catchError((error) => handleErrorID(error));
    bool pass = checkConfirmation(passWord,passWordConfirm);

    print(validmail);
    print(_checkID);
    print(pass);

    if(validmail && _checkID && pass){
      print('tous vert');
      setState(() {
        problem = true;
        problemeWrite='Felicitation vous etez inscris faite continuer pour vous connecter';
        goodvalide=false;
      });
      validAll();
    }else{

      if(!validmail){
        setState(() {
          problem = true;
          problemeWrite='Adresse mail incorrect';
        });
      }else if(!_checkID){
        setState(() {
          problem = true;
          problemeWrite='Ce matricule existe déja';
        });
      }else if(!pass){
        setState(() {
          problem = true;
          problemeWrite='Mot de passe ne correspond pas';
        });
      }
    }



  }

  bool checkConfirmation(String passWord,String confimpassWord){
    if(passWord == confimpassWord){
      return true;
    }else{
      return false;
    }
  }

  bool checkmail(String email){

    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }

  Future<bool> checkidUser(String id)async{

    Future<List<UserEntrepreneur>> future = _firebaseSociety.getAllUsers();

    await future.then((value) => handValue(value));

    bool position =true;

    for(int i=0;i<_users.length;i++){
      if(_users[i].matricule==id){
        print(_users[i].matricule);
        position=false;
      }
    }
    return position;
  }

  void handValue(List<UserEntrepreneur> value)async{
    _users = value;
  }

  handleError(error) {
    print(error);
  }

  void handValueID(bool value)async{
    _checkID = value ;
  }

  handleErrorID(error) {
    print(error);
  }

  void validAll(){


    final UserEntrepreneur usr = UserEntrepreneur();
    usr.matricule=matricule;
    usr.nomSociete=nomSociete;
    usr.passWordConfirm=passWordConfirm;
    usr.passWord=passWord;
    usr.city=city;
    usr.secteurActiviter=secteurActiviter;
    usr.siret=siret;
    usr.mail=mail;
    _firebaseSociety.addUser(usr.toMap());
    setState(() {
      entrepreneur=usr;
    });

  }
}




class InscriptionPageHunter extends StatefulWidget {
  @override
  _InscriptionPageStateH createState() => _InscriptionPageStateH();
}

class _InscriptionPageStateH extends State<InscriptionPageHunter> {

  @override
  void initState() {
    super.initState();
  }

  Firebase _firebase = Firebase();
  List<User> _users;
  bool problem = false;
  String problemeWrite='je test ici';
  bool _checkID;
  bool goodvalide = true;
  User finalUser=User();

  String lastName='';
  String firstName='';
  String dayBorn='0';
  String mouthBorn='0';
  String yearBorn='0';
  String city='';
  String mail='';
  String idConnection='';
  String passWordConnection='';
  String certifpassConnection='';

  String siretvalue='';
  String expvalue='0';

  String dayBornActivity='0';
  String mouthBornActivity='0';
  String yearBornActivity='0000';
  String mailActivity='';

  bool _checkSiret;


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
            ),),
        ),
        body:
        Center(
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
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/1.1,
                          height: MediaQuery.of(context).size.height/1.3,
                          //color: Colors.red,
                          margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color.fromRGBO(165, 183, 192, 0.5),
                              child: Center(
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    //color: Colors.red,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/1.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Informations Personnels',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            )
                                          ],
                                        ),//affiche imformation personnels
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/3.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Nom',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/3.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextField(
                                                    onSubmitted: (String string){
                                                      setState(() {
                                                        lastName =string.toLowerCase();
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        lastName =string.toLowerCase();
                                                      });
                                                    },
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),// Nom + TextInput
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/3.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Prenom',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/3.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextField(
                                                    onSubmitted: (String string){
                                                      setState(() {
                                                        firstName =string.toLowerCase();
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        firstName =string.toLowerCase();
                                                      });
                                                    },
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),//Prenom + TextInput
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/4,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Jour',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/4,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Mois',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/4,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Année',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),// jour /Mois /Anne
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/4,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextFormField(
                                                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(2)],
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    onFieldSubmitted: (String string){
                                                      setState(() {
                                                        dayBorn =string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        dayBorn =string;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/4,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextFormField(
                                                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(2)],
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    onFieldSubmitted: (String string){
                                                      setState(() {
                                                        mouthBorn =string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        mouthBorn =string;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/4,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextFormField(
                                                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(4)],
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    onFieldSubmitted: (String string){
                                                      setState(() {
                                                        yearBorn =string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        yearBorn =string;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),// JInput / MInput / AInput
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/2.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Adresse mail',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/2.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Ville Actuelle',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            )
                                          ],
                                        ),//Adresse mail + Ville actuelle
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/2.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextField(
                                                    onSubmitted: (String string){
                                                      setState(() {
                                                        mail=string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        mail=string;
                                                      });
                                                    },
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),Container(
                                              width: MediaQuery.of(context).size.width/2.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextField(
                                                    onSubmitted: (String string){
                                                      setState(() {
                                                        city=string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        city=string;
                                                      });
                                                    },
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),// AMInput / Ville
                                        //RaisedButton(onPressed: (){print('this name,fistname  => '+lastName +' / '+firstName+' Number check'+dayBorn+' / '+mouthBorn+' / '+yearBorn );},)
                                      ],
                                    )
                                ),
                              )
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/1.1,
                          height: MediaQuery.of(context).size.height/1.3,
                          //color: Colors.red,
                          margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color.fromRGBO(165, 183, 192, 0.5),
                              child: Center(
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    //color: Colors.red,
                                    child: Column(

                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/1.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Informations Optionnel',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            )
                                          ],
                                        ),//imformation optionnel
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/1.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Informations Proffessionnel',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            )
                                          ],
                                        ),// information professionnel//Numéro de siret
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/3.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Expérience',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/4,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextFormField(
                                                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(2)],
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    onFieldSubmitted: (String string){
                                                      setState(() {
                                                        expvalue =string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        expvalue =string;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),//Expérience
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/1.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Date du début de votre activité',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            )
                                          ],
                                        ),//Date activité
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/4,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextFormField(
                                                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(2)],
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    onFieldSubmitted: (String string){
                                                      setState(() {
                                                        dayBornActivity =string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        dayBornActivity =string;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/4,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextFormField(
                                                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(2)],
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    onFieldSubmitted: (String string){
                                                      setState(() {
                                                        mouthBornActivity =string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        mouthBornActivity =string;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/4,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextFormField(
                                                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,new LengthLimitingTextInputFormatter(4)],
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: 20.0,
                                                        fontStyle: FontStyle.normal
                                                    ),
                                                    onFieldSubmitted: (String string){
                                                      setState(() {
                                                        yearBornActivity =string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        yearBornActivity =string;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),//valeur date activité
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/1.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Mail de votre Entreprise',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              ),
                                            )
                                          ],
                                        ),//mail entreprise
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width/1.5,
                                              height: MediaQuery.of(context).size.height/15,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                              child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  color: Color.fromRGBO(135, 159, 171, 0.5),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: TextField(
                                                        keyboardType: TextInputType.number,
                                                        onSubmitted: (String string){
                                                          setState(() {
                                                            mailActivity=string;
                                                          });
                                                        },
                                                        onChanged: (String string){
                                                          setState(() {
                                                            mailActivity =string;
                                                          });
                                                        },
                                                        textAlign: TextAlign.center,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                        ),
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: 20.0,
                                                            fontStyle: FontStyle.normal
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                              ),
                                            )
                                          ],
                                        ),//valeur mail entreprise
                                        //RaisedButton(onPressed: (){print(' siret => '+siretvalue+' exp '+expvalue+' dayvalue '+dayBornActivity+' mont '+mouthBornActivity+' year '+yearBornActivity+' mail '+mailActivity);},)
                                      ],
                                    )
                                ),
                              )
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height/1.8,
                            //color: Colors.red,
                            margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color.fromRGBO(165, 183, 192, 0.5),
                              child: Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  //color: Colors.red,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Compte',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Identifiant de connection',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      idConnection =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      idConnection =string;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Numéro Siret',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      siretvalue =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      siretvalue =string;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Mot de passe',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  obscureText: true,
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      passWordConnection =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      passWordConnection =string;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Confirmation du mot de passe',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/3.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: TextField(
                                                  obscureText: true,
                                                  onSubmitted: (String string){
                                                    setState(() {
                                                      certifpassConnection =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      certifpassConnection =string;
                                                    });
                                                  },
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: 20.0,
                                                      fontStyle: FontStyle.normal
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ),
                        Container(
                            child: problem == true ? Container(
                                width: MediaQuery.of(context).size.width/1.1,
                                height: MediaQuery.of(context).size.height,
                                //color: Colors.red,
                                margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  color: Color.fromRGBO(165, 183, 192, 0.5),
                                  child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width/1.5,
                                                height: MediaQuery.of(context).size.height/15,
                                                //color: Colors.red,
                                                margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                                child: Card(
                                                    elevation: 10,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                    color: Color.fromRGBO(135, 159, 171, 0.5),
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                          'Information de Creation du profil',
                                                          textAlign: TextAlign.center,
                                                          textScaleFactor: 1.7,
                                                          style: new TextStyle(
                                                              color: const Color(0xffffffcc),
                                                              fontSize: 20.0,
                                                              fontStyle: FontStyle.normal
                                                          )
                                                      ),
                                                    )
                                                ),
                                              ),

                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.2,
                                            height: MediaQuery.of(context).size.height/1.2,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      problemeWrite,
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                )
                            ):null
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height/8,
                            //color: Colors.red,
                            margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color.fromRGBO(165, 183, 192, 0.5),
                              child: Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  //color: Colors.red,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.5),
                                              child: goodvalide == true ? RaisedButton(
                                                onPressed: (){finalityInscription();},
                                                color: Color.fromRGBO(135, 171, 144, 1),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Valider votre inscription',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                ),
                                              ):RaisedButton(
                                                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user:finalUser,userE:new UserEntrepreneur())));},
                                                color: Color.fromRGBO(135, 171, 144, 1),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Continuer',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: 20.0,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  void finalityInscription(){



    int yesorno = allValueVidecheked();

    switch(yesorno){
      case 0:
        validInscription(true);
        print('case 0');

        // manque info importante info perso id co
        break;
      case 1:
        validInscription(false);
        print('case 1');
        // manque info pas rempli tous info activité si un element mis
        break;
      case 2:
        setState(() {
          problem = true;
          problemeWrite='Il vous manque des informations';
        });
        print('case 2');
        // manque info perso co + activité si un element mis
        break;
      case 3:
        setState(() {
          problem = true;
          problemeWrite='Vous devais completer toute les informations Optionnel ou laissez les champs vide';
        });
        print('case 3');
        //tous les elements important son bon
        break;
    }

  }

  int allValueVidecheked() {


    var videfirstname=checkVide(firstName, true);
    var videlastname=checkVide(lastName, true);
    var videmail=checkVide(mail, true);
    var videcity=checkVide(city, true);
    var videID=checkVide(idConnection, true);
    var videMDP=checkVide(passWordConnection, true);
    var videMDPC=checkVide(certifpassConnection, true);
    var videdayB=checkVide(dayBorn, false);
    var videmouB=checkVide(mouthBorn, false);
    var videyearB=checkVide(yearBorn, false);

    var videsiret=checkVide(siretvalue, true);
    var videEXP=checkVide(expvalue, false);
    var videmailactivity=checkVide(mailActivity, true);
    var videdayBA=checkVide(dayBornActivity, false);
    var videmouBA=checkVide(mouthBornActivity, false);
    var videyearBA=checkVide(yearBornActivity, false);

    if(videfirstname && videlastname && videmail && videcity && videID && videMDP && videMDPC && videdayB && videmouB && videyearB
        && videsiret && !videEXP && !videmailactivity && !videdayBA && !videmouBA && !videyearBA){
      return 0;
    }
    else if(videfirstname && videlastname && videmail && videcity && videID && videMDP && videMDPC && videdayB && videmouB && videyearB
        && videsiret && videEXP && videmailactivity && videdayBA && videmouBA && videyearBA){
      return 1;
    }
    else if(!videfirstname || !videlastname || !videmail || !videcity || !videID || !videMDP || !videMDPC || !videdayB || !videmouB || !videyearB
        || !videsiret && !videEXP && !videmailactivity && !videdayBA && !videmouBA && !videyearBA){
      return 2;
    }
    else if
    ( videfirstname && videlastname && videmail && videcity && videID && videMDP && videMDPC && videdayB && videmouB && videyearB &&
        videsiret && videEXP || videmailactivity || videdayBA || videmouBA || videyearBA ){
      return 3;
    }

  }

  void validAll(){


    final User usr = User();
    usr.firstName = firstName;
    usr.lastName = lastName;
    usr.city = city;
    usr.dayBorn = int.parse(dayBorn);
    usr.mouthBorn = int.parse(mouthBorn);
    usr.yearBorn = int.parse(yearBorn);
    usr.dayBornActivity= int.parse(dayBornActivity);
    usr.mouthBornActivity=int.parse(mouthBornActivity);
    usr.yearBornActivity=int.parse(yearBornActivity);
    usr.siretvalue = siretvalue;
    usr.expvalue = int.parse(expvalue);
    usr.mail = mail;
    usr.mailActivity = mailActivity;
    usr.id=idConnection;
    usr.passWord=passWordConnection;
    usr.confirmPW=certifpassConnection;
    _firebase.addUser(usr.toMap());
    setState(() {
      finalUser=usr;
    });
  }

  void validInscription(bool notwithActivity) async{


    var validmail = checkmail(mail);
    var validmailActivity = checkmail(mailActivity);
    Future<bool> check = checkidUser(idConnection);
    await check.then((value) => handValueID(value)).catchError((error) => handleErrorID(error));
    Future<bool> check2 = checkidUser(siretvalue);
    await check2.then((value) => handValueSiret(value)).catchError((error) => handleErrorSiret(error));
    bool pass = checkConfirmation(passWordConnection,certifpassConnection);
    var dayB = checkFormatday(int.parse(dayBorn));
    var mouB = checkFormatmouth(int.parse(mouthBorn));
    var yearB = checkFormatyear(int.parse(yearBorn));
    var dayA = checkFormatday(int.parse(dayBornActivity));
    var mouA = checkFormatmouth(int.parse(mouthBornActivity));
    var yearA = checkFormatyearA(int.parse(yearBornActivity));

    print(_checkSiret);

    switch(notwithActivity){
      case true:
        if(validmail && _checkID && pass && dayB && mouB && yearB && _checkSiret){
          setState(() {
            problem = true;
            problemeWrite='Felicitation vous etez inscrit un code d\'identification vous a etez envoyé '+'\n'+'appuyé sur continuer pour finaliser l\'inscription';
            goodvalide=false;
          });
          validAll();
        }else{
          var word='Votre Mail n\'est pas valide';
          var word1='Cette identifiant existe déja';
          var word2='Vous avez fais une erreur au niveau de votre date de naissance ou nous n\'étez pas majeur';
          var word3= 'Votre mot de passe n\'est pas le même';
          if(!validmail){
            setState(() {
              problem = true;
              problemeWrite=word+'\n';
            });
          }else if (!_checkID){
            setState(() {
              problem = true;
              problemeWrite=word1+'\n';
            });
          }else if(!pass){
            setState(() {
              problem = true;
              problemeWrite=word3+'\n';
            });
          }else if(!dayB || !mouB || !yearB){
            setState(() {
              problem = true;
              problemeWrite=word2+'\n';
            });
          }else if(!_checkSiret){
            setState(() {
              problem = true;
              problemeWrite='ce siret existe déja';
            });
          }
        }
        break;
      case false:
        if(validmail && _checkID && pass && dayB && mouB && yearB && validmailActivity && dayA && mouA && yearA && _checkSiret){
          setState(() {
            problem = true;
            problemeWrite='Felicitation vous etez inscrit un code d\'identification vous a etez envoyé '+'\n'+'appuyé sur continuer pour finaliser l\'inscription';
            goodvalide=false;
          });
          validAll();
        }else{
          var word='Votre Mail n\'est pas valide';
          var word1='Cette identifiant existe déja';
          var word2='Vous avez fais une erreur au niveau de votre date de naissance ou nous n\'étez pas majeur';
          var word3= 'Votre mot de passe n\'est pas le même';
          var word4= 'Votre adresse Professionnel n\'est pas valide';
          var word5='Votre date de création d\'entreprise n\'est pas valide';
          if(!validmail){
            setState(() {
              problem = true;
              problemeWrite=word+'\n';
            });
          }else if (!_checkID){
            setState(() {
              problem = true;
              problemeWrite=word1+'\n';
            });
          }else if(!pass){
            setState(() {
              problem = true;
              problemeWrite=word3+'\n';
            });
          }else if(!dayB || !mouB || !yearB){
            setState(() {
              problem = true;
              problemeWrite=word2+'\n';
            });
          }else if(!dayA || !mouA || !yearA){
            setState(() {
              problem = true;
              problemeWrite=word5+'\n';
            });
          }else if(!validmailActivity){
            setState(() {
              problem = true;
              problemeWrite=word4+'\n';
            });
          }else if(!_checkSiret){
            setState(() {
              problem = true;
              problemeWrite='ce siret existe déja';
            });
          }

        }
        break;
    }
  }

  void handValue(List<User> value)async{
    _users = value;
  }

  handleError(error) {
    print(error);
  }

  Future<bool> checkidUser(String id)async{

    Future<List<User>> future = _firebase.getAllUsers();
    await future.then((value) => handValue(value));

    bool position =true;

    for(int i=0;i<_users.length;i++){
      if(_users[i].id==id){
        position=false;
      }
    }
    return position;
  }

  void handValueID(bool value)async{
    _checkID = value ;
  }

  handleErrorID(error) {
    print(error);
  }

  Future<bool> checkidUserSiret(String id)async{

    Future<List<User>> future = _firebase.getAllUsers();
    await future.then((value) => handValue(value));

    bool position =true;

    for(int i=0;i<_users.length;i++){
      if(_users[i].siretvalue==id){
        position=false;
      }
    }
    return position;
  }

  void handValueSiret(bool value)async{
    _checkSiret = value ;
  }

  handleErrorSiret(error) {
    print(error);
  }

  bool checkConfirmation(String passWord,String confimpassWord){
    if(passWord == confimpassWord){
      return true;
    }else{
      return false;
    }
  }

  bool checkFormatday(int day){

    if(day<=0||day>=32){
      return false;
    }else{
      return true;
    }
  }

  bool checkVide(String caract,bool typecheck){

    //print('test'+caract);
    var vide ='';
    var zero ='0';
    var zeros ='0000';
    var moinUn ='-1';

    switch(typecheck){
      case true:
        if(caract == vide){
          return false;
        }else{
          return true;
        }
        break;
      case false:
        if(caract == zero||caract==zeros){
          return false;
        }else{
          return true;
        }
        break;
    }
  }

  bool checkFormatmouth(int mouth){

    if(mouth>0 && mouth <13){
      return true;
    }else{
      return false;
    }
  }

  bool checkFormatyear(int year){

    var now = new DateTime.now();
    var yearActuel = now.year;


    if ((yearActuel - year) < 18 || year >= yearActuel) {
      return false;
    } else {
      return true;
    }

  }

  bool checkFormatyearA(int year){

    var now = new DateTime.now();
    var yearActuel = now.year;


    if (year <= yearActuel) {
      return true;
    } else {
      return false;
    }

  }

  bool checkmail(String email){

    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }


}
