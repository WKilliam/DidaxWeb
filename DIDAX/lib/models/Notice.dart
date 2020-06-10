import 'package:cloud_firestore/cloud_firestore.dart';

class Notice{

  String title='@';
  String typeContrat='@';
  String idSender='@';
  String mail='@';
  String text='@';

  String nomCreateurQuestion="@";
  String nombreQuestion="@";
  String ref='@';
  String category='@';

  Notice();

  Notice.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> m = documentSnapshot.data;
    title = m['title'];
    typeContrat=m['typeContrat'];
    text=m['text'];
    mail=m['mail'];
    idSender=m['idSender'];
    nombreQuestion=m['nombreQuestion'];
    nomCreateurQuestion=m['nomCreateurQuestion'];
    ref=m['ref'];
    category=m['category'];
  }
  toMap() {
    return <String, dynamic>{
      'idSender': idSender,
      'typeContrat': typeContrat,
      'mail':mail,
      'title':title,
      'text':text,
      'nombreQuestion':nombreQuestion,
      'nomCreateurQuestion':nomCreateurQuestion,
      'ref':ref,
      'category':category
    };
  }
}