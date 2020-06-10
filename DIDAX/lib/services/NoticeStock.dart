import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:didax/models/Notice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NoticeStock{
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  static final Firestore dbInstance = Firestore.instance;
  static final StorageReference storageInstance = FirebaseStorage.instance.ref();
  final CollectionReference dbUsers = dbInstance.collection('NoticeStock');

  Future<List<Notice>> getAllNotice() async {
    QuerySnapshot querySnapshot = await dbUsers.getDocuments();
    List<DocumentSnapshot> docs = querySnapshot.documents;
    List<Notice> notice = [];
    docs.forEach((doc) {
      notice.add(Notice.fromFirestore(doc));
    });
    return notice;
  }
  Future<void> addNotice(Map<String, dynamic> map) =>
      dbUsers.document().setData(map);
}