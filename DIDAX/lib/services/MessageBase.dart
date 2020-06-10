import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:didax/models/Message.dart';
import 'package:didax/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Messagebase {
  // Instances
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  static final Firestore dbInstance = Firestore.instance;
  static final StorageReference storageInstance = FirebaseStorage.instance.ref();


  // Collections
  final CollectionReference dbUsers = dbInstance.collection('Messages');

  Future<List<Message>> getAllUsers() async {
    QuerySnapshot querySnapshot = await dbUsers.getDocuments();
    List<DocumentSnapshot> docs = querySnapshot.documents;
    List<Message> message = [];
    docs.forEach((doc) {
      message.add(Message.fromFirestore(doc));
    });
    return message;
  }


  Future<User> getUser(String name) async {
    QuerySnapshot querySnapshot =
    await dbUsers.where('id', isEqualTo: name).getDocuments();
    DocumentSnapshot documentSnapshot = querySnapshot.documents.first;
    return User.fromFirestore(documentSnapshot);
  }


  Future<void> addUser(Map<String, dynamic> map) =>
      dbUsers.document().setData(map);

  Future<void> deleteUser(String name) async {
    QuerySnapshot querySnapshot =
    await dbUsers.where('name', isEqualTo: name).getDocuments();
    await dbUsers.document(querySnapshot.documents.first.documentID).delete();
  }


}