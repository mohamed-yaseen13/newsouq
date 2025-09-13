import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsouq/core/database/database.dart';

class SignupApiService {
  final FirebaseAuth auth;
  final Database database;

  SignupApiService({required this.auth, required this.database});

  Future<UserCredential> signup(String email, String password) async {
    final response = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await Database.saveEmailAndPasswordToDatabase(email, password);

    return response;
  }
}
