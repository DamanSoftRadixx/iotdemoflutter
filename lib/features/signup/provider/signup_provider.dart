import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Core/Firebase/firebase.dart';

class SignUpProvider {
  Future<UserCredential?> signUp({
    required String email,
    required String password,
    required String username,
    required String surname,
    required String tuyaToken, required String tuyaUid, required String tuyaRefreshedToken
  }) async {
    UserCredential? response = await AuthenticationHelper().signUp(
        email: email, password: password, username: username, surname: surname,
        tuyaToken:tuyaToken,
        tuyaRefreshedToken:tuyaRefreshedToken,
        tuyaUid:tuyaUid);
    return response;
  }
}
