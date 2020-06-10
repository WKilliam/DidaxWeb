import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:didax/models/Questionnaire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class QuestionData{

  // Instances
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  static final Firestore dbInstance = Firestore.instance;
  static final StorageReference storageInstance = FirebaseStorage.instance.ref();


  // Collections
  final CollectionReference dbUsers = dbInstance.collection('Questions');

  Future<List<Question>> getAllUsers() async {
    QuerySnapshot querySnapshot = await dbUsers.getDocuments();
    List<DocumentSnapshot> docs = querySnapshot.documents;
    List<Question> users = [];
    docs.forEach((doc) {
      users.add(Question.fromFirestore(doc));
    });
    return users;
  }


  Future<Question> getUser(String name) async {
    QuerySnapshot querySnapshot =
    await dbUsers.where('Questions', isEqualTo: name).getDocuments();
    DocumentSnapshot documentSnapshot = querySnapshot.documents.first;
    return Question.fromFirestore(documentSnapshot);
  }

  Future<void> addUser(Map<String, dynamic> map) =>
      dbUsers.document().setData(map);

  Future<void> deleteUser(String name) async {
    QuerySnapshot querySnapshot =
    await dbUsers.where('name', isEqualTo: name).getDocuments();
    await dbUsers.document(querySnapshot.documents.first.documentID).delete();
  }
}



class QuestionDataRef{

  // Instances
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  static final Firestore dbInstance = Firestore.instance;
  static final StorageReference storageInstance = FirebaseStorage.instance.ref();


  // Collections
  final CollectionReference dbUsers = dbInstance.collection('QuestionsRef');

  Future<List<QuestionList>> getAllUsers() async {
    QuerySnapshot querySnapshot = await dbUsers.getDocuments();
    List<DocumentSnapshot> docs = querySnapshot.documents;
    List<QuestionList> users = [];
    docs.forEach((doc) {
      users.add(QuestionList.fromFirestore(doc));
    });
    return users;
  }


  Future<QuestionList> getUser(String name) async {
    QuerySnapshot querySnapshot =
    await dbUsers.where('QuestionsRef', isEqualTo: name).getDocuments();
    DocumentSnapshot documentSnapshot = querySnapshot.documents.first;
    return QuestionList.fromFirestore(documentSnapshot);
  }

  Future<void> addUser(Map<String, dynamic> map) =>
      dbUsers.document().setData(map);

  Future<void> deleteUser(String name) async {
    QuerySnapshot querySnapshot =
    await dbUsers.where('name', isEqualTo: name).getDocuments();
    await dbUsers.document(querySnapshot.documents.first.documentID).delete();
  }
}