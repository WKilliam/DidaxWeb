import 'package:didax/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Testmove extends StatefulWidget {

  User _usr;
  @override
  _TestmoveState createState() => _TestmoveState(_usr);
}

class _TestmoveState extends State<Testmove> {

  User _usr;

_TestmoveState(_usr);

  String id = '@';
  String passWord='@';
  String confirmPW='@';
  String lastName='@';
  String firstName='@';
  String city='@';
  String mail='@';
  String siretvalue ='@';
  String mailActivity='@';
  int dayBorn=0;
  int mouthBorn=0;
  int yearBorn=0;
  int expvalue=0;
  int dayBornActivity=0;
  int mouthBornActivity=0;
  int yearBornActivity=0;
  String _informationUser="test";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                            child: Container(
                                width: MediaQuery.of(context).size.width/1.1,
                                height: MediaQuery.of(context).size.height*2,
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
                                                height: MediaQuery.of(context).size.height*1.5,
                                                //color: Colors.red,
                                                //margin: EdgeInsets.only(left:10,top: 15.0,bottom: 15.0),
                                                child: Card(
                                                    elevation: 10,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                    ),
                                                    color: Color.fromRGBO(135, 159, 171, 0.5),
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                          _informationUser,
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
                                        ],
                                      )
                                  ),
                                )
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
                                                  onPressed: (){setState(() {
                                                    _informationUser=messageprint(new User());
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
              )
            ],
          ),
        ),
      ),
    );
  }
  String messageprint(User user){
    
    return 
            """My user have : \n'
            'User id : """+user.id+"""'"\n'+
            'User first Name : """+user.firstName+""""\n'+
            'User last Name : """+user.lastName+"""'\n'+
            'User Password : """+user.passWord+"""'\n'+
            'User PasswordConfirm : '"""+user.confirmPW+"""'\n'+
            'User siret : '"""+user.siretvalue+"""'\n'+
            'User mail activity : '"""+user.mailActivity+"""'\n'+
            'User mail : '"""+user.mail+"";
    
  }
  
  User usercreate(){
    User usr = User();
    usr.siretvalue='siret';
    usr.mail='mail';
    usr.passWord='pass';
    usr.city='city';
    usr.mailActivity='mail Activity';
    usr.id='iduser';
    usr.lastName='last name';
    usr.firstName='first name';
    usr.yearBornActivity=9999;
    usr.mouthBornActivity=12;
    usr.dayBornActivity=31;
    usr.dayBorn=31;
    usr.mouthBorn=12;
    usr.yearBorn=9999;
    usr.expvalue=0;
    usr.confirmPW='confirm pass';
  }
}
