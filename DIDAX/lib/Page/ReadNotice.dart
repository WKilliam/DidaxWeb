import 'package:didax/Page/StartTest.dart';
import 'package:didax/models/Notice.dart';
import 'package:didax/models/Questionnaire.dart';
import 'package:didax/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadNotice extends StatefulWidget {

  Notice value;
  User theUser;
  ReadNotice({this.value,this.theUser});

  @override
  _ReadNoticeState createState() => _ReadNoticeState(value,theUser);
}

class _ReadNoticeState extends State<ReadNotice> {

  var goodvalide = true;
  Notice value;
  User theUser;


  _ReadNoticeState(this.value,this.theUser);

  bool whoread=true;

  @override
  void initState() {

    if(theUser.id=='@'){
      setState(() {
        whoread=false;
      });
    }
  }

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
                    child: whoread==true?
                    Column(
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
                                                      child: Text(
                                                          value.title,
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
                                                      child: Text(
                                                          value.typeContrat,
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
                                                      child: Text(
                                                          value.text,
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
                                              child: RaisedButton(
                                                onPressed: (){
                                                setState(() {
                                                  QuestionList q = QuestionList();
                                                  q.ref=value.ref;
                                                  q.category=value.category;
                                                  q.nomCreateur=value.nomCreateurQuestion;
                                                  q.nombreQuestion=value.nombreQuestion;

                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => StartTest(refData: q ,userTested:theUser)));
                                                });},
                                                color: Color.fromRGBO(135, 171, 144, 1),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      'Commencer le test',
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
                    ):
                    Column(
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
                                                      child: Text(
                                                          value.title,
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
                                                      child: Text(
                                                          value.typeContrat,
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
                                                      child: Text(
                                                          value.text,
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
                                                )
                                              ],
                                            ),
                                          ]
                                      )
                                  )
                              ),
                            )
                        ),
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
}
