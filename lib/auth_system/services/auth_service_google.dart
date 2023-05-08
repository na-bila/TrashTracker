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


    return await FirebaseAuth.instance.signInWithCredential(authCredential);

    //print(firebaseUser.user?.email);
    //print(firebaseUser.user?.displayName);
    //print(firebaseUser.user?.uid);
    //print(firebaseUser.user?.emailVerified);
    //print(firebaseUser.user?.photoURL);
    //print(firebaseUser.user?.phoneNumber);
    //print(firebaseUser.user?.isAnonymous);
  }
}