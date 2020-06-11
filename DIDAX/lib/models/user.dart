import 'package:cloud_firestore/cloud_firestore.dart';

class User {
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



  User();

  User.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> m = documentSnapshot.data;
    lastName = m['lastName'];
    firstName = m['firstName'];
    city= m['city'];
    mail=m['mail'];
    siretvalue=m['numberSiret'];
    mailActivity=m['numberYearActivityOfEntreprise'];
    dayBorn=m['dayBorn'];
    mouthBorn=m['mouthBorn'];
    yearBorn=m['yearBorn'];
    expvalue =m['experienceActivity'];
    dayBornActivity=m['dayBornActivity'];
    mouthBornActivity=m['mouthBornActivity'];
    yearBornActivity=m['yearBornActivity'];
    id = m['id'];
    passWord = m['passWord'];
    confirmPW=m['confirmPassWord'];
  }


  toMap() {
    return <String, dynamic>{
      'id': id,
      'passWord': passWord,
      'lastName':lastName,
      'firstName':firstName,
      'city':city,
      'mail': mail,
      'siretvalue':siretvalue,
      'mailActivity':mailActivity,
      'dayBorn':dayBorn,
      'mouthBorn':mouthBorn,
      'yearBorn':yearBorn,
      'expvalue':expvalue,
      'dayBornActivity':dayBornActivity,
      'mouthBornActivity':mouthBornActivity,
      'yearBornActivity':yearBornActivity,
      'confimPass':confirmPW
    };
  }
}