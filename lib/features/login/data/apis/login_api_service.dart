import 'package:firebase_auth/firebase_auth.dart';

class LoginApiService {
  final FirebaseAuth auth;

  LoginApiService({required this.auth});

  Future<UserCredential> login(String email, String password) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
