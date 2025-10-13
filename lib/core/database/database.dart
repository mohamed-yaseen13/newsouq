import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsouq/core/constants/app_constants.dart';

class Database {
  static DocumentReference<Map<String, dynamic>> getEmailRef(String email) =>
      FirebaseFirestore.instance
          .collection(AppConstants.emailsCollection)
          .doc(email);

  static DocumentReference<Map<String, dynamic>> getMerchantRef(String email) =>
      FirebaseFirestore.instance
          .collection(AppConstants.merchantsCollection)
          .doc(email);

  static Future<bool> checkIfEmailExist(String email) async {
    final doc = await getEmailRef(email).get();
    return doc.exists;
  }

  static Future<void> saveOtpToDatabase(String email, String otp) async {
    final expiresAt = DateTime.now().add(const Duration(minutes: 1));
    await getEmailRef(
      email,
    ).update({'otp': otp, "expiresAt": Timestamp.fromDate(expiresAt)});
  }

  static Future<bool> isOtpCorrect(String email, String otp) async {
    final doc = await getEmailRef(email).get();
    final String savedOtp = doc.data()!['otp'];
    final Timestamp expiresAtTs = doc.data()!['expiresAt'];
    final DateTime expiresAt = expiresAtTs.toDate();
    return savedOtp == otp && DateTime.now().isBefore(expiresAt);
  }

  static Future<void> saveEmailAndPasswordToDatabase(
    String email,
    String password,
  ) async {
    await getEmailRef(email).set({'password': password, 'role': 'customer'});
  }

  static Future<String> getPasswordFromDatabase(String email) async {
    final doc = await getEmailRef(email).get();

    return doc['password'] as String;
  }

  static Future<void> savePasswordToDatabase(
    String email,
    String password,
  ) async {
    await getEmailRef(email).update({'password': password});
  }

  static Future<void> deleteOtp(String email) async {
    await getEmailRef(
      email,
    ).update({'otp': FieldValue.delete(), 'expiresAt': FieldValue.delete()});
  }
}
