import 'package:didax/Page/Home.dart';
import 'package:didax/models/userEntrepreneur.dart';
import 'package:didax/services/firebase.dart';
import 'package:didax/models/user.dart';
import 'package:didax/services/firebaseSociete.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeConnect extends StatefulWidget {



  @override
  _HomeConnectState createState() => _HomeConnectState();
}

class _HomeConnectState extends State<HomeConnect> {

  Firebase _firebase = Firebase();
  FirebaseSociety _society =FirebaseSociety();
  List<User> _users;
  List<UserEntrepreneur> _usersEntrepreneur;

  String identifiant;
  String password;

  User _myUser = User();
  UserEntrepreneur _entrepreneur =UserEntrepreneur();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                              height: MediaQuery.of(context).size.height/1.2,
                              //color: Colors.red,
                              margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                                child:Card(
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                            'Informations',
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
                                                            'Identifiant',
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
                                                      child: TextField(
                                                        obscureText: false,
                                                        onSubmitted: (String string){
                                                          setState(() {
                                                            identifiant =string;
                                                          });
                                                        },
                                                        onChanged: (String string){
                                                          setState(() {
                                                            identifiant =string;
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
                                                )
                                              ],
                                            ),
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
                                                      child: TextField(
                                                        obscureText: true,
                                                        onSubmitted: (String string){
                                                          setState(() {
                                                            password=string;
                                                          });
                                                        },
                                                        onChanged: (String string){
                                                          setState(() {
                                                            password=string;
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
                                                        onPressed: (){takeUser();},
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
                                                      )
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                )
                              )
                          ],
                        ),
                      ),
                  )
                  ],
                ),
              )
        ),
    );
  }
  void handValue(User value)async{
    _myUser = value;
  }

  handleError(error) {
    print(error);
  }

  void handValuelist(List<User> value)async{
    _users = value;
  }


  Future<User> checkidUser(String id)async{

    Future<List<User>> future = _firebase.getAllUsers();
    await future.then((value) => handValuelist(value));

    for(int i=0;i<_users.length;i++){
      if(_users[i].id==id){
        setState(() {
          _myUser=_users[i];
        });
      }
    }
    return _myUser;
  }

  Future<UserEntrepreneur> checkidUserE(String id)async{

    Future<List<UserEntrepreneur>> future2 = _society.getAllUsers();
    await future2.then((value) => handValuelistSociety(value));

    User user = User();

    for(int i=0;i<_usersEntrepreneur.length;i++){
      if(_usersEntrepreneur[i].matricule==id){
        setState(() {
          _entrepreneur=_usersEntrepreneur[i];
        });
      }
    }
    return _entrepreneur;
  }


  void takeUser()async{

    Future<User> check =checkidUser(identifiant);
    await check.then((value) => handValue(value)).catchError((error) => handleError(error));

    if(_myUser.passWord != password){
      print('mauvais mot de passe');
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user:_myUser,userE:new UserEntrepreneur())));
    }
  }

  handValuelistSociety(List<UserEntrepreneur> value) {
    _usersEntrepreneur=value;
  }



}
