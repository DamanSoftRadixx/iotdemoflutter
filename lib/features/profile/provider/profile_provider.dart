import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iotdemoflutter/Core/Firebase/firebase.dart';

class ProfileProvider {
  Future<QuerySnapshot?> getProfile(String email) {
    var response = AuthenticationHelper().getProfile(userEmail: email);
    return response;
  }
  signOut(){
    AuthenticationHelper().signOut();
  }
}
