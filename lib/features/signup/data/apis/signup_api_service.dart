import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq/core/database/database.dart';

class SignupApiService {
  final FirebaseAuth auth;

  SignupApiService({required this.auth});

  Future<UserCredential> signup(String email, String password) async {
    final response = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await Database.saveEmailAndPasswordToDatabase(email, password);

    return response;
  }
}
