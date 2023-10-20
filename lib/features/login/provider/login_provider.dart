import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Core/Firebase/firebase.dart';

class LoginProvider {
  Future<UserCredential?> login(
      {required String email, required String password}) async {
    UserCredential? response =
        await AuthenticationHelper().login(email: email, password: password);
    return response;
  }
}
