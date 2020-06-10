import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionList{

  String nomCreateur="@";
  String nombreQuestion="@";
  String ref='@ref@2020-06-09 20:51:31.000Z';
  String category='@';

  QuestionList();

  QuestionList.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> m = documentSnapshot.data;
    nombreQuestion=m['nombreQuestion'];
    nomCreateur=m['nomCreateur'];
    ref=m['ref'];
    category=m['category'];
  }
  toMap() {
    return <String, dynamic>{
      'nombreQuestion':nombreQuestion,
      'nomCreateur':nomCreateur,
      'ref':ref,
      'category':category
    };
  }

}

class Question{

  String question='@';
  String good='@';
  String bad='@';
  String bad1='@';
  String bad2='@';
  String category='@';
  String ref='@';


  Question();

  Question.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> m = documentSnapshot.data;
    question=m['question'];
    good=m['good'];
    bad=m['bad'];
    bad1=m['bad1'];
    bad2=m['bad2'];
    category=m['category'];
    ref=m['ref'];
  }
  toMap() {
    return <String, dynamic>{
      'question':question,
      'good':good,
      'bad':bad,
      'bad1':bad1,
      'bad2':bad2,
      'category':category,
      'ref':ref
    };
  }
}