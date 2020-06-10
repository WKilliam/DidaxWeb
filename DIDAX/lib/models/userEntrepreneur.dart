import 'package:cloud_firestore/cloud_firestore.dart';


class UserEntrepreneur {

  String nomSociete='@';
  String siret='@';
  String matricule='@';
  String mail='@';
  String city='@';
  String secteurActiviter='@';
  String passWord='@';
  String passWordConfirm='@';


  UserEntrepreneur();
  UserEntrepreneur.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> m = documentSnapshot.data;
    city= m['city'];
    mail=m['mail'];
    nomSociete= m['nomSociete'];
    siret= m['siret'];
    matricule= m['matricule'];
    secteurActiviter= m['secteur'];
    passWord=m['passWord'];
    passWordConfirm=m['passWordConfirm'];

  }
  toMap() {
    return <String, dynamic>{

      'city': city,
      'mail': mail,
      'nomSociete': nomSociete,
      'siret':siret,
      'matricule':matricule,
      'secteurActiviter': secteurActiviter,
      'passWord':passWord,
      'passWordConfirm':passWordConfirm

    };
  }
}