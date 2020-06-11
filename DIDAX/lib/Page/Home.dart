import 'package:didax/Page/HomeConnect.dart';
import 'package:didax/Page/ReadNotice.dart';
import 'package:didax/models/Message.dart';
import 'package:didax/models/user.dart';
import 'package:didax/models/userEntrepreneur.dart';
import 'package:didax/services/MessageBase.dart';
import 'package:didax/services/firebase.dart';
import 'package:didax/services/firebaseSociete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:didax/models/Notice.dart';
import 'package:didax/services/NoticeStock.dart';
import 'package:flutter/services.dart';

import 'CreateNotice.dart';
import 'Createquestions.dart';

class Home extends StatefulWidget {

  User user;
  UserEntrepreneur userE;
  Home({this.user,this.userE});
  
  @override
  _HomeState createState() => _HomeState(this.user,this.userE);
}

class _HomeState extends State<Home> {

  User user;
  UserEntrepreneur userE;
  bool myProfilC=false;
  bool myProfilE=false;

  _HomeState(this.user,this.userE);
  bool problem = true;
  List<Notice> _notice = List();
  NoticeStock _noticeStock = NoticeStock();
  Messagebase _messagebase = Messagebase();
  List<Message> _listMessage = List();
  List<Message> _MylistMessage = List();
  int _contelist;
  String myMessageText;

  bool _change=true;

  String title;
  String description;
  String type;
  int numberCount = 10;
  Notice _DataSnap;
  bool looker=false;
  bool readMessage=false;

  bool connectUser=false;
  bool connectUserE=false;

  String _messagesend;

  Message _messageThis;


  Firebase _firebase = Firebase();
  FirebaseSociety _society = FirebaseSociety();
  List<User> _userList = List();
  List<UserEntrepreneur> _userSocityList = List();
  User _user = User();
  UserEntrepreneur _entrepreneur = UserEntrepreneur();

  List<String> _listTest = List();
  var _controllerG = TextEditingController();

  @override
  void initState() {
    print(user.id);
    print(userE.nomSociete);
    if(user.id == '@'){
      setState(() {
        connectUserE=true;
        print('je suis entrepreneur');
        myMessage();
      });
    }else if (userE.matricule == '@'){
      setState(() {
        _listTest.add('test');
        _listTest.add('test');
        connectUser=true;
        print('je suis utilisateur');
        myMessage();
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'DIDAX',
                textAlign: TextAlign.center,
                textScaleFactor: 1.7,
                style: new TextStyle(
                    color: const Color(0xffffffcc),
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .width / 125, fontStyle: FontStyle.normal
                ),
              ),
            )
        ),
        drawer:
        connectUserE==true ?
        Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(77, 90, 128, 1),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [

                    Container(width: MediaQuery.of(context).size.width/4.5,
                        height: MediaQuery.of(context).size.height/4.5,
                        //color: Colors.blue,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => new Createquestions(entrepreneur : userE)));
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: Color.fromRGBO(135, 159, 171, 0.1),
                            child: Image.network('image/questionnaire.png'),
                          ),
                        )
                    ),
                    Container(width: MediaQuery.of(context).size.width/4.5,
                      height: MediaQuery.of(context).size.height/4.5,
                      //color: Colors.blue,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        color: Color.fromRGBO(135, 159, 171, 0.1),
                        child: Image.network('image/person.png'),
                      ),
                    ),
                    Container(width: MediaQuery.of(context).size.width/4.5,
                        height: MediaQuery.of(context).size.height/4.5,
                        //color: Colors.blue,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => new CreateNotice(value: userE)));
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: Color.fromRGBO(135, 159, 171, 0.1),
                            child: Image.network('image/executive.png'),
                          ),
                        )
                    ),

                  ],
                ),
                Row(
                  children: [
                    Container(width: MediaQuery.of(context).size.width/4.5,
                        height: MediaQuery.of(context).size.height/15,
                        //color: Colors.blue,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Créer Test',
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.7,
                              style: new TextStyle(
                                  color: const Color(0xffffffcc),
                                  fontSize: MediaQuery.of(context).size.width/100,
                                  fontStyle: FontStyle.normal
                              )
                          ),
                        )
                    ),
                    Container(width: MediaQuery.of(context).size.width/4.5,
                        height: MediaQuery.of(context).size.height/15,
                        //color: Colors.blue,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(userE.nomSociete,
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.7,
                              style: new TextStyle(
                                  color: const Color(0xffffffcc),
                                  fontSize: MediaQuery.of(context).size.width/100,
                                  fontStyle: FontStyle.normal
                              )
                          ),
                        )
                    ),
                    Container(width: MediaQuery.of(context).size.width/4.5,
                        height: MediaQuery.of(context).size.height/15,
                        //color: Colors.blue,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Créer Annonce',
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.7,
                              style: new TextStyle(
                                  color: const Color(0xffffffcc),
                                  fontSize: MediaQuery.of(context).size.width/100,
                                  fontStyle: FontStyle.normal
                              )
                          ),
                        )
                    ),
                  ],

                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.5,
                  //color: Colors.red,
                    child :Container(
                      width: MediaQuery.of(context).size.width/10,
                      height: MediaQuery.of(context).size.height/1.6,
                      //color: Colors.blue,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Color.fromRGBO(135, 159, 171, 0.1),
                        child:  readMessage ==false ?
                        ListView.builder(
                            itemBuilder: (context, position) {
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    _messageThis=_MylistMessage[position];
                                    readMessage=true;
                                  });
                                },
                                  child:
                                  Container(
                                      width: MediaQuery.of(context).size.width/20,
                                      height: MediaQuery.of(context).size.height/10,
                                      color: Color.fromRGBO(9, 46, 69, 0.1),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Message de : '+_MylistMessage[position].to+' '+messageread(_MylistMessage[position]),
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
                                      
                                    ),
                                  )
                              );
                            },
                          itemCount: _MylistMessage.length,
                        ):
                        Container(
                          width: MediaQuery.of(context).size.width/10,
                          height: MediaQuery.of(context).size.height/1.6,
                          //color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/1.5,
                                height: MediaQuery.of(context).size.height/2,
                                margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                //color: Colors.green,
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  color: Color.fromRGBO(135, 159, 171, 0.1),
                                  child: ListView.builder(itemBuilder: (context, position) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/10,
                                          height: MediaQuery.of(context).size.width/10,
                                          //color: Colors.yellow,
                                          child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.1),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                _MylistMessage[position].to,
                                                textAlign: TextAlign.center,
                                                textScaleFactor: 1.7,
                                                style: new TextStyle(
                                                    color: const Color(0xffffffcc),
                                                    fontSize: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width / 125, fontStyle: FontStyle.normal
                                                ),
                                              ),
                                            )
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width/2.5,
                                          height: MediaQuery.of(context).size.width/10,
                                          //color: Colors.black,
                                          child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.1),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  _MylistMessage[position].message,
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
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width/10,
                                          height: MediaQuery.of(context).size.width/10,
                                          //color: Colors.yellow,
                                          child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            color: Color.fromRGBO(135, 159, 171, 0.1),
                                            child: Image.network('image/person.png'),
                                          ),
                                        ),

                                      ],
                                    );
                                  },
                                    itemCount: _MylistMessage.length,
                                    ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width/2.5,
                                    height: MediaQuery.of(context).size.height/10,
                                    //color: Colors.black,
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      color: Color.fromRGBO(135, 159, 171, 0.1),
                                      child: TextFormField(
                                        maxLines: 2,
                                        controller: _controllerG,
                                        inputFormatters: [new LengthLimitingTextInputFormatter(30)],
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
                                            _messagesend =string;
                                          });
                                        },
                                        onChanged: (String string){
                                          setState(() {
                                            _messagesend =string;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width/10,
                                    height: MediaQuery.of(context).size.height/10,
                                    //color: Colors.purple,
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      color: Color.fromRGBO(135, 159, 171, 0.1),
                                      child: Stack(
                                        children: [
                                          Image.network('image/send.png'),
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                createMessage(_messageThis);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width/10,
                                    height: MediaQuery.of(context).size.height/10,
                                    //color: Colors.purple,
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      color: Color.fromRGBO(135, 159, 171, 0.1),
                                      child: Stack(
                                        children: [
                                          Image.network('image/return.png'),
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                readMessage=false;
                                              });
                                            },
                                          )
                                        ],
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
          )
        ):
        Container(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height,
            color: Color.fromRGBO(77, 90, 128, 1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: MediaQuery.of(context).size.width/4.5,
                        height: MediaQuery.of(context).size.height/4.5,
                        //color: Colors.blue,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Color.fromRGBO(135, 159, 171, 0.1),
                          child: Image.network('image/person.png'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: MediaQuery.of(context).size.width/4.5,
                          height: MediaQuery.of(context).size.height/15,
                          //color: Colors.blue,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(user.lastName,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.7,
                                style: new TextStyle(
                                    color: const Color(0xffffffcc),
                                    fontSize: MediaQuery.of(context).size.width/100,
                                    fontStyle: FontStyle.normal
                                )
                            ),
                          )
                      ),
                    ],

                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.5,
                      //color: Colors.red,
                      child :Container(
                        width: MediaQuery.of(context).size.width/10,
                        height: MediaQuery.of(context).size.height/1.6,
                        //color: Colors.blue,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Color.fromRGBO(135, 159, 171, 0.1),
                          child:  readMessage ==false ?
                          ListView.builder(
                            itemBuilder: (context, position) {
                              return InkWell(
                                  onTap: (){
                                    setState(() {
                                      _messageThis=_MylistMessage[position];
                                      readMessage=true;
                                    });
                                  },
                                  child:
                                  Container(
                                    width: MediaQuery.of(context).size.width/20,
                                    height: MediaQuery.of(context).size.height/10,
                                    color: Color.fromRGBO(9, 46, 69, 0.1),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Message de : '+_MylistMessage[position].to+' '+messageread(_MylistMessage[position]),
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

                                    ),
                                  )
                              );
                            },
                            itemCount: _MylistMessage.length,
                          ):
                          Container(
                            width: MediaQuery.of(context).size.width/10,
                            height: MediaQuery.of(context).size.height/1.6,
                            //color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width/1.5,
                                  height: MediaQuery.of(context).size.height/2,
                                  margin: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                  //color: Colors.green,
                                  child: Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    color: Color.fromRGBO(135, 159, 171, 0.1),
                                    child:
                                    ListView.builder(itemBuilder: (context, position) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/10,
                                            height: MediaQuery.of(context).size.width/10,
                                            //color: Colors.yellow,
                                            child: Card(
                                                elevation: 10,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20.0),
                                                ),
                                                color: Color.fromRGBO(135, 159, 171, 0.1),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    _MylistMessage[position].to,
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width / 125, fontStyle: FontStyle.normal
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/2.5,
                                            height: MediaQuery.of(context).size.width/10,
                                            //color: Colors.black,
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.1),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    _MylistMessage[position].message,
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
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width/10,
                                            height: MediaQuery.of(context).size.width/10,
                                            //color: Colors.yellow,
                                            child: Card(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                              color: Color.fromRGBO(135, 159, 171, 0.1),
                                              child: Image.network('image/person.png'),
                                            ),
                                          ),

                                        ],
                                      );
                                    },
                                      itemCount: _MylistMessage.length,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width/2.5,
                                      height: MediaQuery.of(context).size.height/10,
                                      //color: Colors.black,
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        color: Color.fromRGBO(135, 159, 171, 0.1),
                                        child: TextFormField(
                                          maxLines: 2,
                                          controller: _controllerG,
                                          inputFormatters: [new LengthLimitingTextInputFormatter(30)],
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
                                              _messagesend =string;
                                            });
                                          },
                                          onChanged: (String string){
                                            setState(() {
                                              _messagesend =string;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width/10,
                                      height: MediaQuery.of(context).size.height/10,
                                      //color: Colors.purple,
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        color: Color.fromRGBO(135, 159, 171, 0.1),
                                        child: Stack(
                                          children: [
                                            Image.network('image/send.png'),
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  createMessage(_messageThis);
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width/10,
                                      height: MediaQuery.of(context).size.height/10,
                                      //color: Colors.purple,
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        color: Color.fromRGBO(135, 159, 171, 0.1),
                                        child: Stack(
                                          children: [
                                            Image.network('image/return.png'),
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  readMessage=false;
                                                });
                                              },
                                            )
                                          ],
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
            )
        ),

















        body: Center(
            child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height,
                                          color: Color.fromRGBO(208, 212, 226,
                                              0.1),
                                          margin: EdgeInsets.only(top: 15.0,
                                              bottom: 15.0),
                                          child: Card(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(20.0)),
                                            color: Color.fromRGBO(
                                                179, 179, 179, 0.1),
                                            child: FutureBuilder<List>(

                                                future: _noticeStock.getAllNotice(),
                                                initialData: _MylistMessage,
                                                builder: (context, snapshot) {
                                                  return snapshot.hasData ?
                                                  new ListView.builder(
                                                    padding: const EdgeInsets
                                                        .all(25.0),
                                                    itemCount: snapshot.data.length,
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
                                          )
                                      )
                                  )
                                ]
                            )
                        )
                    )
                  ],
                )
            )
        )
    );
  }


  Widget buildRow(Notice notice) {
    return new InkWell(
        onTap: () {
          //print('tu click');
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReadNotice(value: notice, theUser: user)));

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
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 10,
                      //color: Colors.red,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          color: Color.fromRGBO(10, 101, 137, 1),
                          elevation: 20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                notice.title,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.7,
                                style: new TextStyle(
                                    color: const Color(0xffffffcc),
                                    fontSize: MediaQuery.of(context).size.width / 125,
                                    fontStyle: FontStyle.normal
                                )
                            ),
                          )
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 10,
                      //color: Colors.red,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          color: Color.fromRGBO(10, 101, 137, 1),
                          elevation: 20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                notice.typeContrat,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.7,
                                style: new TextStyle(
                                    color: const Color(0xffffffcc),
                                    fontSize: MediaQuery.of(context).size.width / 125,
                                    fontStyle: FontStyle.normal
                                )
                            ),
                          )
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 10,
                      //color: Colors.red,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          color: Color.fromRGBO(10, 101, 137, 1),
                          elevation: 20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                notice.idSender,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.7,
                                style: new TextStyle(
                                    color: const Color(0xffffffcc),
                                    fontSize: MediaQuery.of(context).size.width / 100,
                                    fontStyle: FontStyle.normal
                                )
                            ),
                          )
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 10,
                      //color: Colors.red,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          color: Color.fromRGBO(10, 101, 137, 1),
                          elevation: 20,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                'Test en : '+notice.category,
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

  createMessage(Message msg) async {

    if(connectUser==true){
      Message text = Message();
      text.message=_messagesend;
      text.to=user.mail;
      text.from=msg.to;
      text.read=false;
      text.fromForTo=text.to+'to'+text.from;
      text.toForFrom=text.from+'for'+text.to;
      _messagebase.addUser(text.toMap());
      _MylistMessage.add(text);

    }
    else if(connectUserE==true){

      Message text = Message();
      text.message=_messagesend;
      text.to=userE.mail;
      text.from=msg.to;
      text.read=false;
      text.fromForTo=text.to+'to'+text.from;
      text.toForFrom=text.from+'for'+text.to;
      _messagebase.addUser(text.toMap());
      _MylistMessage.add(text);

      //await myMessage();

    }
  }

  getMessage()async{
    Future<List<Message>> future = _messagebase.getAllUsers();
    await future.then((value) => handValuelist(value));
  }


  whatThisProfil() async {

    Future<List<User>> future = _firebase.getAllUsers();
    await future.then((value) => handValue(value));

    Future<List<UserEntrepreneur>> futureE = _society.getAllUsers();
    await futureE.then((value) => handValueEntrepreneur(value));

    for(int i = 0 ;i<_userList.length;i++){
      if(user.mail== _userList[i].mail&&user.id == _userList[i].id && user.passWord == _userList[i].passWord){
        _user=_userList[i];
      }
    }
    for(int i = 0 ;i<_userSocityList.length;i++){
      if(userE.mail== _userSocityList[i].mail && userE.matricule == _userSocityList[i].matricule && userE.passWord == _userSocityList[i].passWord){
        _entrepreneur=_userSocityList[i];
      }
    }
  }

  handValue(List<User> value) {
    _userList=value;
  }

  handValueEntrepreneur(List<UserEntrepreneur> value) {
    _userSocityList=value;
  }

  Future<void> myMessage() async {

    await getMessage();


    if(connectUser==true){
      for(int i = 0;i<_listMessage.length;i++){
        print('je test les messages candidat');
        if(_listMessage[i].to ==user.mail || _listMessage[i].from == user.mail ){
          setState(() {
            print('j\'ai ajouter : '+_listMessage[i].message);
            _MylistMessage.add(_listMessage[i]);
          });
        }
      }
    }else if(connectUserE==true){
      for(int i = 0;i<_listMessage.length;i++){
        print('je test les messages entrepreneur');
        if(_listMessage[i].to == userE.mail || _listMessage[i].from == userE.mail){
          setState(() {
            print('j\'ai ajouter : '+_listMessage[i].message);
            _MylistMessage.add(_listMessage[i]);
          });
        }
      }
    }
    print(_MylistMessage.length);
  }
  
  messageread(Message m){
    
    if(m.read==false){
      return 'Non lu';
    }else{
      return 'Lu';
    }
  }

  handValuelist(List<Message> value) {
    _listMessage=value;
  }

  stringMessage(){

    if(_MylistMessage.length==0){
      return 'message vide';
    }else{
      return ' a un message';
    }
  }
}
