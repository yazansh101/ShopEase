import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService {
  Future<User?> getCurrentUser();
  Stream<User?> get onAuthStateChanged;
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  Future<UserCredential> signInWithGoogle();
}

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  @override
  Stream<User?> get onAuthStateChanged {
    return _auth.userChanges();
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );
    return await _auth.signInWithCredential(credential);
  }
}