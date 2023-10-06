import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static final FirebaseAuthService _instance = FirebaseAuthService._internal();

  factory FirebaseAuthService() {
    return _instance;
  }

  FirebaseAuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get authInstance => _auth;

  User? getCurrentUser() {
    User? user = authInstance.currentUser;

    if (user != null) {
      return user;
    } else {
      print("Nehum usuári logado");
      return null;
    }
  }

  Future<bool> signIn(String email, String password) async {
    authInstance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((firebaseUser) {
      print('Logar  usuário: sucesso!! e-mail: ${firebaseUser.user!.email}');
      return true;
    }).catchError((error) {
      print('Logar usuario usuário: erro: $error');

      return false;
    });
    return false;
  }

  void signOut() {
    authInstance.signOut();
  }

  Future<bool> newUser(String email, String password) async {
    authInstance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((firebaseUser) {
      print('novo usuário: sucesso!! e-mail: ${firebaseUser.user!.email}');
      return true;
    }).catchError((error) {
      print('novo usuário: erro: $error');
      return false;
    });
    return false;
  }
}
