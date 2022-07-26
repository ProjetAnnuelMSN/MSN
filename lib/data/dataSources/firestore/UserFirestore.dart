
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../entities/MsnUser.dart';

class UserFirestore {

  static UserFirestore? _instance;

  // On initialise l'instance du Cloud Firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static late final _msnUserRef;

  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static UserFirestore getInstance() {
    if(_instance == null) {
      _msnUserRef = _firebaseFirestore
          .collection('msnusers')
          .withConverter<MsnUser>(
          fromFirestore: (snapshot, _) => MsnUser.fromJson(snapshot.data()!),
          toFirestore: (msnuser, _) => msnuser.toJson()
      );
    }

    _instance = UserFirestore._();
    return _instance!;
  }

  UserFirestore._();

  Future<UserCredential> signInWithCredentials({required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    return userCredential;
  }

  Future<UserCredential> signUp({required String email, required String password}) async {

    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );

    return userCredential;
  }

  /*
  static Stream<List<MsnUser>> getUsers() => FirebaseFirestore.instance
      .collection('msnusers')
      .orderBy(MsnUser.lastMessageTime, descending: true)
      .snapshots()
      .transform();

   */
}