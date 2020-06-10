import 'package:didax/Page/Home.dart';
import 'package:didax/models/Questionnaire.dart';
import 'package:didax/models/user.dart';
import 'package:didax/services/QuestionData.dart';
import 'package:didax/services/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartTest extends StatefulWidget {

  QuestionList refData;
  User userTested;
  StartTest({this.refData,this.userTested});
  @override
  _StartTestState createState() => _StartTestState(this.refData,userTested);
}

class _StartTestState extends State<StartTest> {

  QuestionList refData;
  User userTested;
  _StartTestState(this.refData,this.userTested);

  bool getStart = false;
  String _message='@';

  Firebase _firebase =Firebase();
  List<User> _listUser = List();

  QuestionData _questionData = QuestionData();

  List<Question> _list =List();
  List<Question> _listClean =List();


  List<String> _reponse = List();
  bool changeFont =false;

  int _goodResult=0;
  int _badResult=0;

  var _num=0;
  int _count = 0;

  @override
  void initState() {
    finalCheck();

  }


  @override
  Widget build(BuildContext context) {
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
                          child: new Image.network('image/mycode.jpg', fit: BoxFit.cover
                          )
                      )
                    )
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getStart==false ?
                          Container(
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height/2,
                              //color: Colors.red,
                              margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Color.fromRGBO(165, 183, 192, 0.5),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.2,
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
                                                    'Instruction :',
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
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.2,
                                          height: MediaQuery.of(context).size.height/5,
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
                                                    _message,
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
                                              child: InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    shuffquestion(_listClean[_count]);
                                                    getStart=true;
                                                  });
                                                },
                                                  child:Align(
                                                      alignment: Alignment.center,
                                                      child: Text('Mauvaise Réponse :',
                                                          textAlign: TextAlign.center,
                                                          textScaleFactor: 1.7,
                                                          style: new TextStyle(color: const Color(0xffffffcc),
                                                              fontSize: MediaQuery.of(context).size.width/180,
                                                              fontStyle: FontStyle.normal
                                                          )
                                                      )
                                                ),
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ):
                          changeFont==false ?
                          Container(
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height/1.5,
                              //color: Colors.red,
                              margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Color.fromRGBO(165, 183, 192, 0.5),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.2,
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
                                                    _listClean[_count].question,
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
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.2,
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
                                                    if((_count+1)==_num){
                                                      checkGoodNotGood(_listClean[_count],_reponse[0]);
                                                      changeFont=true;
                                                    }else{
                                                      checkGoodNotGood(_listClean[_count],_reponse[0]);
                                                      _count++;
                                                      cleanReponse();
                                                      shuffquestion(_listClean[_count]);
                                                    }
                                                  });
                                                },
                                                  child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      _reponse[0],
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor: 1.7,
                                                    style: new TextStyle(
                                                        color: const Color(0xffffffcc),
                                                        fontSize: MediaQuery.of(context).size.width/100,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),
                                              )
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.2,
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
                                                      if((_count+1)==_num){
                                                        checkGoodNotGood(_listClean[_count],_reponse[1]);
                                                        changeFont=true;
                                                      }else{
                                                        checkGoodNotGood(_listClean[_count],_reponse[1]);
                                                        _count++;
                                                        print(_count);
                                                        cleanReponse();
                                                        shuffquestion(_listClean[_count]);
                                                      }
                                                    });
                                                  },
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        _reponse[1],
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: MediaQuery.of(context).size.width/100,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.2,
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
                                                      if((_count+1)==_num){
                                                        checkGoodNotGood(_listClean[_count],_reponse[2]);
                                                        changeFont=true;
                                                      }else{
                                                        checkGoodNotGood(_listClean[_count],_reponse[2]);
                                                        _count++;
                                                        print(_count);
                                                        cleanReponse();
                                                        shuffquestion(_listClean[_count]);
                                                      }
                                                    });
                                                  },
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        _reponse[2],
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: MediaQuery.of(context).size.width/100,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.2,
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
                                                      if((_count+1)==_num){
                                                        checkGoodNotGood(_listClean[_count],_reponse[3]);
                                                        changeFont=true;
                                                      }else{
                                                        checkGoodNotGood(_listClean[_count],_reponse[3]);
                                                        _count++;
                                                        print(_count);
                                                        cleanReponse();
                                                        shuffquestion(_listClean[_count]);
                                                      }
                                                    });
                                                  },
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        _reponse[3],
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(
                                                            color: const Color(0xffffffcc),
                                                            fontSize: MediaQuery.of(context).size.width/100,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    ),
                                                  )
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ):
                          Container(
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height/2,
                              //color: Colors.red,
                              margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Color.fromRGBO(165, 183, 192, 0.5),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.2,
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
                                                    'Bonne reponse obtenue : '+_goodResult.toString(),
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
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/1.2,
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
                                                    'Mauvaise reponse obtenue : '+_badResult.toString(),
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
                                              child: InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: userTested,userE: null,)));
                                                  });
                                                },
                                                child:Align(
                                                    alignment: Alignment.center,
                                                    child: Text('Envoyer Resultat',
                                                        textAlign: TextAlign.center,
                                                        textScaleFactor: 1.7,
                                                        style: new TextStyle(color: const Color(0xffffffcc),
                                                            fontSize: MediaQuery.of(context).size.width/180,
                                                            fontStyle: FontStyle.normal
                                                        )
                                                    )
                                                ),
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          )
                        ]
                    ),
                  ),
                )
              ]
            ),
          )
      ),
    );
  }


  takeQuestion() async {
    Future<List<Question>> future = _questionData.getAllUsers();
    await future.then((value) => handQuestion(value));
  }

  handQuestion(List<Question> value) {
    _list=value;
  }

  compareQuestion(){

    for(int i = 0 ;i<_list.length;i++){
      if(_list[i].ref==refData.ref){
        _listClean.add(_list[i]);
      }
    }
  }

  cleanReponse(){

    _reponse.clear();
  }

  shuffquestion(Question qs){

    _reponse.add(qs.good);
    _reponse.add(qs.bad);
    _reponse.add(qs.bad1);
    _reponse.add(qs.bad2);
    _reponse.shuffle();

  }

  finalCheck() async {
    await takeQuestion();
    compareQuestion();
    setState(() {
      _num=_listClean.length;
    });
  }

  void checkGoodNotGood(Question listClean, String reponse) {

    if(listClean.good==reponse){
      _goodResult++;
    }else{
      _badResult++;
    }
  }

  handUser(List<User> value) {
    _listUser=value;
  }
}

