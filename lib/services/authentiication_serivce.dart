import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:glowchat/constants/user.dart';
import 'package:glowchat/services/firestore_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../locator.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User _currentUser;
  String verificationId;
  User get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _currentUser =
          User(id: authResult.user.uid, email: email, fullname: fullName);

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future sendPasswordResetEmail({
    @required String email,
  }) async {
    try {
      return _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return e.message;
    }
  }

  // ignore: missing_return
  Future<String> loginUserWithGoogle() async {
    // ignore: unused_local_variable
    String retVal = "error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      AuthResult _authResult =
          await _firebaseAuth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo.isNewUser)
        _currentUser =
            User(id: _authResult.user.uid, email: _authResult.user.email);
      await _firestoreService.createUser(_currentUser);
      retVal = "success";
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
  

  Future<void> verifyPhone({
    @required String phoneNo,
    @required String smsCode,
  }) async {
    String verificationId;
    try {
      final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
        this.verificationId = verId;
      };
      final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
        this.verificationId = verId;
       
      };
      final PhoneVerificationCompleted verifiedSuccess =
          (AuthCredential credential) {
        print('Verified');
      };
      final PhoneVerificationFailed verifiFailed = (AuthException exception) {
        print('${exception.message}');
      };

      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNo,
          timeout: const Duration(seconds: 30),
          verificationCompleted: verifiedSuccess,
          verificationFailed: verifiFailed,
          codeSent: smsCodeSent,
          codeAutoRetrievalTimeout: autoRetrieve);
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      AuthResult _authResult =
          await _firebaseAuth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo.isNewUser)
        _currentUser = User(
          id: _authResult.user.uid,
        );
      await _firestoreService.createUser(_currentUser);
    } catch (e) {
      return e.message;
    }
  }


}
