import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glowchat/constants/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final StreamController<List<User>> _postsController =
      StreamController<List<User>>.broadcast();

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  Stream listenToPOstREALtime() {
    _usersCollectionReference.snapshots().listen((event) {
      if (event.documents.isNotEmpty) {
        var userdetails = event.documents
            .map((snapshot) => User.fromData(
                  snapshot.data,
                ))
            .where((element) => element.fullname != null)
            .toList();
        _postsController.add(userdetails);
      }
    });
    return _postsController.stream;
  }
}
