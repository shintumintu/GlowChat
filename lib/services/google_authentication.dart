import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  // Dependencies
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future googleSignIn() async {
    var googleSignInAccount = await _googleSignIn.signIn();
    var googleSignInAuth = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAccount.id);
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    final FirebaseUser currentUser = await _auth.currentUser();
    if (currentUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection('users')
          .where("id", isEqualTo: currentUser.uid)
          .getDocuments();

      final List<DocumentSnapshot> document = result.documents;
      if (document.length == 0) {
        Firestore.instance
            .collection('users')
            .document(currentUser.uid)
            .setData({'id': currentUser.uid, 'email': currentUser.email});
      } else {}
    }
    return user;
  }
}
