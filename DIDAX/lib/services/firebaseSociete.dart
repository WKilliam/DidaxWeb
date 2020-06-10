import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:didax/models/user.dart';
import 'package:didax/models/userEntrepreneur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseSociety {
  // Instances
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  static final Firestore dbInstance = Firestore.instance;
  static final StorageReference storageInstance = FirebaseStorage.instance.ref();


  // Collections
  final CollectionReference dbUsers = dbInstance.collection('usersSociety');

  Future<List<UserEntrepreneur>> getAllUsers() async {
    QuerySnapshot querySnapshot = await dbUsers.getDocuments();
    List<DocumentSnapshot> docs = querySnapshot.documents;
    List<UserEntrepreneur> users = [];
    docs.forEach((doc) {
      users.add(UserEntrepreneur.fromFirestore(doc));
    });
    return users;
  }


  Future<UserEntrepreneur> getUser(String name) async {
    QuerySnapshot querySnapshot =
    await dbUsers.where('matricule', isEqualTo: name).getDocuments();
    DocumentSnapshot documentSnapshot = querySnapshot.documents.first;
    return UserEntrepreneur.fromFirestore(documentSnapshot);
  }

  Future<void> addUser(Map<String, dynamic> map) =>
      dbUsers.document().setData(map);

  Future<void> deleteUser(String name) async {
    QuerySnapshot querySnapshot =
    await dbUsers.where('name', isEqualTo: name).getDocuments();
    await dbUsers.document(querySnapshot.documents.first.documentID).delete();
  }


}