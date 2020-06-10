import 'package:cloud_firestore/cloud_firestore.dart';

class Message {

  String to='@';
  String from='@';
  String toForFrom='@';
  String fromForTo='@';
  String message='@';
  bool read=false;

  Message();

  Message.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> m = documentSnapshot.data;
    to=m['to'];
    from=m['from'];
    toForFrom=m['toForFrom'];
    fromForTo=m['fromForTo'];
    message=m['message'];
    read=m['read'];
  }
  toMap() {
    return <String, dynamic>{
      'to':to,
      'from':from,
      'toForFrom':toForFrom,
      'fromForTo':fromForTo,
      'message':message,
      'read':read
    };
  }

}