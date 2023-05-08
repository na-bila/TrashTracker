

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/auth_system/square_tile.dart';

class AuthService{
  signinwith_google() async {
    final _googleSignIn = GoogleSignIn();
    final googleAccount = await _googleSignIn.signIn();
    final googleCredential = await googleAccount?.authentication;
    final authCredential = GoogleAuthProvider.credential(
        idToken: googleCredential?.idToken,
        accessToken: googleCredential?.accessToken
    );
    final firebaseUser = await FirebaseAuth.instance.signInWithCredential(
        authCredential);
    addUserDetails(
      firebaseUser.user?.displayName ?? '',
      firebaseUser.user?.email ?? '',
      firebaseUser.user?.phoneNumber,
      firebaseUser.user?.uid ?? '',
    );
    return await FirebaseAuth.instance.signInWithCredential(authCredential);

    //print(firebaseUser.user?.email);
    //print(firebaseUser.user?.displayName);
    //print(firebaseUser.user?.uid);
    //print(firebaseUser.user?.emailVerified);
    //print(firebaseUser.user?.photoURL);
    //print(firebaseUser.user?.isAnonymous);
  }
  Future addUserDetails(String displayName,String email,String? phone,String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': email,
      'displayName': displayName,
      'phoneNumber': int.tryParse(phone.toString()),
    });
  }
}