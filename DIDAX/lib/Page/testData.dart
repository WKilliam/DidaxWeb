import 'package:didax/models/Message.dart';
import 'package:didax/models/Questionnaire.dart';
import 'package:didax/services/MessageBase.dart';
import 'package:didax/services/QuestionData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestData extends StatefulWidget {
  @override
  _TestDataState createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {

  QuestionList q = QuestionList();
  QuestionDataRef _questionDataRef = QuestionDataRef();
  Question qs = Question();
  QuestionData _questionData = QuestionData();




  @override
  Widget build(BuildContext context) {
    return Center(
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
                                        onPressed: (){setState(() {
                                          data();
                                        });},
                                        color: Color.fromRGBO(135, 171, 144, 1),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                              'Runneur',
                                              textAlign: TextAlign.center,
                                              textScaleFactor: 1.7,
                                              style: new TextStyle(
                                                  color: const Color(0xffffffcc),
                                                  fontSize: 20.0,
                                                  fontStyle: FontStyle.normal
                                              )
                                          ),
                                        ),
                                      )
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
            ]
        )
      )
    );
  }
  void data(){

    Message message = Message();
    Messagebase messagebase = Messagebase();


    message.to='my2';
    message.from='you2';
    message.fromForTo=message.from+'for'+message.to;
    message.toForFrom=message.to+'for'+message.from;
    message.message='je test un truc';

    messagebase.addUser(message.toMap());


    /*qs.question='combien font 2X2';
    qs.good='4';
    qs.bad='3';
    qs.bad1='2';
    qs.bad2='9';
    qs.category='C';
    qs.ref='e';
    _questionData.addUser(qs.toMap());

    q.category='lol';
    q.ref='@';
    q.nomCreateur='byteddy';
    q.nombreQuestion='3';
    _questionDataRef.addUser(q.toMap());*/

  }
}
