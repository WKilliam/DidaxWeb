import 'package:didax/Page/Home.dart';
import 'package:didax/models/Questionnaire.dart';
import 'package:didax/models/userEntrepreneur.dart';
import 'package:didax/services/QuestionData.dart';
import 'package:didax/services/firebaseSociete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import'package:didax/services/NoticeStock.dart';

class Createquestions extends StatefulWidget {

  UserEntrepreneur value;
  Createquestions({this.value});
  @override
  _CreatequestionsState createState() => _CreatequestionsState(value);
}

class _CreatequestionsState extends State<Createquestions> {

  UserEntrepreneur _value;
  _CreatequestionsState(_value);

  bool goodvalide=true;
  bool _continue=false;
  String question='@';
  String good='@';
  String bad='@';
  String bad1='@';
  String bad2='@';
  String category='@';
  String ref='@';
  String nombreQuestion='0';
  static DateTime now = new DateTime.now();
  static DateTime berlinWallFell = new DateTime.utc(now.year,now.month,now.day,now.hour,now.minute,now.second);
  final timing=berlinWallFell.toString();
  bool controle=true;
  var _controllerQ = TextEditingController();
  var _controllerG = TextEditingController();
  var _controllerB = TextEditingController();
  var _controllerB1 = TextEditingController();
  var _controllerB2 = TextEditingController();

  FirebaseSociety _society = FirebaseSociety();



  QuestionData _questionData = QuestionData();
  List<UserEntrepreneur> _UserE = List();

  QuestionDataRef _questionDataRef = QuestionDataRef();
  QuestionList _questionListData = QuestionList();

  UserEntrepreneur _usr =UserEntrepreneur();
  bool _num=false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    bool c = ifchecked();
    if(c==true){
      _num=true;
    }

    return Scaffold(
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
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.1,
                        height: MediaQuery.of(context).size.height+100,
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
                                  height: MediaQuery.of(context).size.height*1.5,
                                  //color: Colors.red,
                                  child: _continue == false ? Column(
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
                                                      'Créateur de Test',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: MediaQuery.of(context).size.width/70,
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
                                                      'Nombre de question voulu pour le test',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: MediaQuery.of(context).size.width/120,
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
                                                  keyboardType: TextInputType.number,
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
                                                      nombreQuestion =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                       nombreQuestion=string;
                                                    });
                                                  },
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
                                                      'Language Utiliser pour le Test ( Unique )',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: MediaQuery.of(context).size.width/120,
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
                                                  inputFormatters: [new LengthLimitingTextInputFormatter(6)],
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
                                                      category =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      category =string;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                                  'Explication :',
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: 1.7,
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: MediaQuery.of(context).size.width/70,
                                                      fontStyle: FontStyle.normal
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/1.5,
                                        height: MediaQuery.of(context).size.height/2,
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
                                                  messageSend(),
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: 1.7,
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: MediaQuery.of(context).size.width/70,
                                                      fontStyle: FontStyle.normal
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/8,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 171, 144, 1),
                                                child: InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      _continue=true;
                                                    });
                                                  },
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Debut de création',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: MediaQuery.of(context).size.width/180,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                      //affiche imformation personnels// AMInput / Ville
                                      //RaisedButton(onPressed: (){print('this name,fistname  => '+lastName +' / '+firstName+' Number check'+dayBorn+' / '+mouthBorn+' / '+yearBorn );},)
                                    ],
                                  ):Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/8,
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
                                                  'Votre question : ',
                                                  textAlign: TextAlign.center,
                                                  textScaleFactor: 1.7,
                                                  style: new TextStyle(
                                                      color: const Color(0xffffffcc),
                                                      fontSize: MediaQuery.of(context).size.width/120,
                                                      fontStyle: FontStyle.normal
                                                  )
                                              ),
                                            )
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/8,
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
                                                      'Votre question : ',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: MediaQuery.of(context).size.width/150,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
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
                                                child: TextFormField(
                                                  controller: _controllerQ,
                                                  inputFormatters: [new LengthLimitingTextInputFormatter(80)],
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
                                                      question =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      question =string;
                                                    });
                                                  },
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
                                            width: MediaQuery.of(context).size.width/8,
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
                                                      'Le Bon Résultat: ',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: MediaQuery.of(context).size.width/150,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
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
                                                child: TextFormField(
                                                  controller: _controllerG,
                                                  inputFormatters: [new LengthLimitingTextInputFormatter(80)],
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
                                                      good =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      good =string;
                                                    });
                                                  },
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
                                            width: MediaQuery.of(context).size.width/8,
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
                                                      'Mauvaise Réponse :',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: MediaQuery.of(context).size.width/180,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
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
                                                child: TextFormField(
                                                  controller: _controllerB,
                                                  inputFormatters: [new LengthLimitingTextInputFormatter(80)],
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
                                                      bad =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      bad =string;
                                                    });
                                                  },
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
                                            width: MediaQuery.of(context).size.width/8,
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
                                                      'Mauvaise Réponse :',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: MediaQuery.of(context).size.width/180,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
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
                                                child: TextFormField(
                                                  controller: _controllerB1,
                                                  inputFormatters: [new LengthLimitingTextInputFormatter(80)],
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
                                                      bad1 =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      bad1 =string;
                                                    });
                                                  },
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
                                            width: MediaQuery.of(context).size.width/8,
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
                                                      'Mauvaise Réponse :',
                                                      textAlign: TextAlign.center,
                                                      textScaleFactor: 1.7,
                                                      style: new TextStyle(
                                                          color: const Color(0xffffffcc),
                                                          fontSize: MediaQuery.of(context).size.width/180,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
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
                                                child: TextFormField(
                                                  inputFormatters: [new LengthLimitingTextInputFormatter(80)],
                                                  //controller: new TextEditingController(),
                                                  textAlign: TextAlign.center,
                                                  controller: _controllerB2,
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
                                                      bad2 =string;
                                                    });
                                                  },
                                                  onChanged: (String string){
                                                    setState(() {
                                                      bad2 =string;
                                                    });
                                                  },
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
                                            width: MediaQuery.of(context).size.width/8,
                                            height: MediaQuery.of(context).size.height/15,
                                            //color: Colors.red,
                                            margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 171, 144, 1),
                                                child: _num == false ? InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      //print(berlinWallFell.toString());
                                                      pushQuestion();//_continue=true;
                                                      count++;
                                                    });
                                                    _controllerQ.clear();
                                                    _controllerG.clear();
                                                    _controllerB.clear();
                                                    _controllerB1.clear();
                                                    _controllerB2.clear();
                                                  },
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Debut de création',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: MediaQuery.of(context).size.width/180,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  ),
                                                ):InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      pushQuestion();
                                                    });
                                                    _questionListData.nombreQuestion=nombreQuestion;
                                                    _questionListData.nomCreateur=_usr.matricule;
                                                    _questionListData.ref='@ref'+_usr.mail+timing;
                                                    _questionListData.category=category;
                                                    _questionDataRef.addUser(_questionListData.toMap());
                                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                                                  },
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        'Terminer !',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: MediaQuery.of(context).size.width/180,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                              ),
                            )
                        ),
                      ),
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

  ifchecked(){

    int t =int.parse(nombreQuestion);

    if(count==t){
      return true;
    }else{
      return false;
    }
  }


  pushQuestion()async{

    Question questionList = Question();
    questionList.category=category;
    questionList.ref='@ref'+_usr.mail+timing;
    questionList.good=good;
    questionList.bad=bad;
    questionList.bad1=bad1;
    questionList.bad2=bad2;
    questionList.question=question;

    _questionData.addUser(questionList.toMap());


  }

  takeUser(){

    for(int i =0;i<_UserE.length;i++){

      if(_value.matricule==_UserE[i].matricule){
        _usr = _UserE[i];
      }
    }
  }

  checkidUser()async{

    Future<List<UserEntrepreneur>> future = _society.getAllUsers();
    await future.then((value) => handUser(value));

    //print(_UserE[0]);
  }

  handUser(List<UserEntrepreneur> value) {
    _UserE=value;
  }

  messageSend(){
    return "Vous allez crée un questionnaire";
  }
}
