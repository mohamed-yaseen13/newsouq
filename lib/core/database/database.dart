import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsouq/core/constants/database_constants.dart';

class Database {
  final FirebaseFirestore firestore;

  Database({required this.firestore});

  DocumentReference<Map<String, dynamic>> getEmailRef(String email) =>
      FirebaseFirestore.instance
          .collection(DatabaseConstants.emailsCollection)
          .doc(email);

  DocumentReference<Map<String, dynamic>> getMerchantRef(String email) =>
      FirebaseFirestore.instance
          .collection(DatabaseConstants.merchantsCollection)
          .doc(email);

  Future<bool> checkIfEmailExist(String email) async {
    final doc = await getEmailRef(email).get();
    return doc.exists;
  }

  Future<void> saveOtpToDatabase(String email, String otp) async {
    final expiresAt = DateTime.now().add(const Duration(minutes: 1));
    await getEmailRef(
      email,
    ).update({'otp': otp, "expiresAt": Timestamp.fromDate(expiresAt)});
  }

  Future<bool> isOtpCorrect(String email, String otp) async {
    final doc = await getEmailRef(email).get();
    final String savedOtp = doc.data()!['otp'];
    final Timestamp expiresAtTs = doc.data()!['expiresAt'];
    final DateTime expiresAt = expiresAtTs.toDate();
    return savedOtp == otp && DateTime.now().isBefore(expiresAt);
  }

  Future<void> saveEmailAndPasswordToDatabase(
    String email,
    String password,
  ) async {
    await getEmailRef(email).set({'password': password, 'role': 'customer'});
  }

  Future<String> getPasswordFromDatabase(String email) async {
    final doc = await getEmailRef(email).get();

    return doc['password'] as String;
  }

  Future<void> savePasswordToDatabase(String email, String password) async {
    await getEmailRef(email).update({'password': password});
  }

  Future<void> deleteOtp(String email) async {
    await getEmailRef(
      email,
    ).update({'otp': FieldValue.delete(), 'expiresAt': FieldValue.delete()});
  }
}
