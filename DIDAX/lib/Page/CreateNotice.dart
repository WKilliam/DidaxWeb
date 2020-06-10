import 'package:date_format/date_format.dart';
import 'package:didax/models/BodyBuild.dart';
import 'package:didax/models/Notice.dart';
import 'package:didax/models/Questionnaire.dart';
import 'package:didax/models/user.dart';
import 'package:didax/models/userEntrepreneur.dart';
import 'package:didax/services/NoticeStock.dart';
import 'package:didax/services/QuestionData.dart';
import 'package:didax/services/firebaseSociete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'ReadNotice.dart';

class CreateNotice extends StatefulWidget {

  UserEntrepreneur value;
  CreateNotice({this.value});

  @override
  _CreateNoticeState createState() => _CreateNoticeState(value);
}

class _CreateNoticeState extends State<CreateNotice> {

  UserEntrepreneur _value;

  _CreateNoticeState(this._value);

  FirebaseSociety _society = FirebaseSociety();
  List<UserEntrepreneur> _UserE = List();
  UserEntrepreneur _usr =UserEntrepreneur();

  QuestionDataRef _questionDataRef = QuestionDataRef();
  List _istcheckall=List();
  NoticeStock _noticeStock = NoticeStock();

  String message='';
  String title='@null';
  String typeContrat='@null';
  String text='@null';

  String idSender='@null';
  String mail='@null';

  String nomCreateurQuestion='@null';
  String nombreQuestion='@null';
  String ref='@null';
  String category='@null';


  String _writeMessage='@';
  bool goodvalide=true;
  bool notvalid=true;

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
        body:Center(
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
                                borderRadius: BorderRadius.circular(20.0),),
                              color: Color.fromRGBO(165, 183, 192, 0.5),
                              margin: EdgeInsets.only(left:10,right:10,top: 5,bottom: 5),
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
                                                        'Descriptif de l\'annonce',
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
                                                        'Titre de l\'annonce',
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
                                                        title =string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        title =string;
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
                                                        'Type de contrat',
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
                                                        typeContrat =string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        typeContrat =string;
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
                                        Column(
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
                                                        'Descriptif',
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
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height/2.5,
                                              //color: Colors.red,
                                              margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
                                              child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.5),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: TextField(
                                                    keyboardType: TextInputType.multiline,
                                                    maxLines: null,
                                                    maxLength: null,

                                                    onSubmitted: (String string){
                                                      setState(() {
                                                        text =string;
                                                      });
                                                    },
                                                    onChanged: (String string){
                                                      setState(() {
                                                        text =string;
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
                                    ]
                                  )
                                )
                              ),
                            )
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height/1.1,
                            //color: Colors.red,
                            margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),),
                              color: Color.fromRGBO(165, 183, 192, 0.5),
                              margin: EdgeInsets.only(left:10,right:10,top: 5,bottom: 5),
                              child: Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    //color: Colors.red,
                                    margin: EdgeInsets.only(left:10,right:10,top: 15.0,bottom: 15.0),
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius
                                              .circular(20.0)),
                                      color: Color.fromRGBO(
                                          179, 179, 179, 0.1),
                                      child: FutureBuilder<List>(
                                          future: _questionDataRef
                                              .getAllUsers(),
                                          initialData: List(),
                                          builder: (context, snapshot) {
                                            return snapshot.hasData ?
                                            new ListView.builder(
                                              padding: const EdgeInsets
                                                  .all(25.0),
                                              itemCount: snapshot.data
                                                  .length,
                                              itemBuilder: (context, i) {
                                                //takeNotice(snapshot.data[i]);
                                                return buildRow(
                                                    snapshot.data[i]);
                                              },
                                            ) : Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                      ),
                                    ),
                                  ),
                              ),
                            )
                        ),
                        Container(child:notvalid==false ? Container(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height/1.1,
                            //color: Colors.red,
                            margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),),
                              color: Color.fromRGBO(165, 183, 192, 0.5),
                              margin: EdgeInsets.only(left:10,right:10,top: 5,bottom: 5),
                              child: Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                          _writeMessage,
                                          textAlign: TextAlign.center,
                                          textScaleFactor: 1.7,
                                          style: new TextStyle(
                                              color: const Color(0xffffffcc),
                                              fontSize: 20.0,
                                              fontStyle: FontStyle.normal
                                          )
                                      ),
                                    ),
                                    //color: Colors.red,
                                  )
                              ),
                            )
                        ):null,),
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
                                                onPressed: (){ createNoticeFinish();//notvalid=false;//createNoticeFinish();
                                                setState(() {
                                                  goodvalide=false;
                                                });},
                                                color: Color.fromRGBO(135, 171, 144, 1),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Valider votre annonce',
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
                                                onPressed: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => new Home(user:new User(),userE:_value)));
                                                },/*Navigator.push(context, MaterialPageRoute(builder: (context) => HomeConnect()));*/
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
                ),
              ],
            ),
          ),
        )
    );
  }




  checkidUser()async{

    Future<List<UserEntrepreneur>> future = _society.getAllUsers();
    await future.then((value) => handUser(value));

    //print(_UserE[0]);
  }

  takeUser(){

    for(int i =0;i<_UserE.length;i++){

      if(_value.matricule==_UserE[i].matricule){
        _usr = _UserE[i];
      }
    }
  }


  void createNoticeFinish()async{
    await checkidUser();
    takeUser();
    Notice finNotice = finishData();
    bool v = checkvalid();//analyse final
    _noticeStock.addNotice(finNotice.toMap());
  }


  Widget buildRow(QuestionList notice) {
    return new InkWell(
        onTap: () {
          setState(() {
            choiceTestQuestion(notice);
          });
        },
        child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 5,
            height: MediaQuery
                .of(context)
                .size
                .height / 5,
            //color: const Color(0xff1b202b),
            child:
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                color: Color.fromRGBO(77, 90, 128, 0.6),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2.5,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 10,
                      //color: Colors.red,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          color: Color.fromRGBO(10, 101, 137, 1),
                          elevation: 20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                notice.nombreQuestion,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.7,
                                style: new TextStyle(
                                    color: const Color(0xffffffcc),
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 125,
                                    fontStyle: FontStyle.normal
                                )
                            ),
                          )
                      ),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 5,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 10,
                      //color: Colors.red,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          color: Color.fromRGBO(10, 101, 137, 1),
                          elevation: 20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                notice.ref,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.7,
                                style: new TextStyle(
                                    color: const Color(0xffffffcc),
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 125,
                                    fontStyle: FontStyle.normal
                                )
                            ),
                          )
                      ),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 5,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 10,
                      //color: Colors.red,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          color: Color.fromRGBO(10, 101, 137, 1),
                          elevation: 20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                notice.nomCreateur,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.7,
                                style: new TextStyle(
                                    color: const Color(0xffffffcc),
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 100,
                                    fontStyle: FontStyle.normal
                                )
                            ),
                          )
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }

  handUser(List<UserEntrepreneur> value) {
    _UserE=value;
  }

  choiceTestQuestion(QuestionList notice){
    nomCreateurQuestion=notice.nomCreateur;
    nombreQuestion=notice.nombreQuestion;
    ref=notice.ref;
    category=notice.category;
  }

  finishData(){

    setState(() {
      idSender=_usr.matricule;
      mail=_usr.mail;
    });

    Notice notice = Notice();

    notice.title=title;
    notice.typeContrat=typeContrat;
    notice.idSender=idSender;
    notice.mail=mail;
    notice.text=text;

    notice.nomCreateurQuestion=nomCreateurQuestion;
    notice.nombreQuestion=nombreQuestion;
    notice.ref=ref;
    notice.category=category;

    return notice;

    //
  }

  checkvalid(){

    _istcheckall.add(title);
    _istcheckall.add(typeContrat);
    _istcheckall.add(text);

    _istcheckall.add(idSender);
    _istcheckall.add(mail);
    _istcheckall.add(nomCreateurQuestion);
    _istcheckall.add(nombreQuestion);
    _istcheckall.add(ref);
    _istcheckall.add(category);

    for(int i =0;i<_istcheckall.length;i++){

      if(_istcheckall[i]=='@null') {
        setState(() {
          notvalid=false;
          _writeMessage='Des informations sont manquantes';
        });
        return false;
      }else{
        setState(() {
          notvalid=false;
          _writeMessage='Votre annonce a été crée avec succée';
        });
        return true;
      }

    }
  }

}
