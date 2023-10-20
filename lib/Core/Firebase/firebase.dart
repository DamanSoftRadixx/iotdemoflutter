import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:iotdemoflutter/Core/common_ui/snackbar/snackbar.dart';
import 'dart:io';

import 'package:iotdemoflutter/Core/storage/local_storage.dart';

class FirebaseInit {
  onIint() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isAndroid) {
      print("Android");
      // await Firebase.initializeApp(
      //     options: const FirebaseOptions(
      //   apiKey: 'AIzaSyChJXyNevyTnv7OxnFovEKigOKAKuwDRrk',
      //   appId: '1:749299147906:android:c0bff14bd0cd9f2054809b',
      //   messagingSenderId: '749299147906',
      //   projectId: 'fluttersmartlighting',
      // ));
      await Firebase.initializeApp();
    } else {
      print("Ios");
      await Firebase.initializeApp();
      // await Firebase.initializeApp(
      //     options: const FirebaseOptions(
      //   apiKey: 'AIzaSyChJXyNevyTnv7OxnFovEKigOKAKuwDRrk',
      //   appId: '1:749299147906:ios:39ac11bf6c8203ba54809b',
      //   messagingSenderId: '749299147906',
      //   projectId: 'fluttersmartlighting',
      // ));
    }
  }
}

class AuthenticationHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

  get user => auth.currentUser;

  //SIGN UP METHOD
  Future<UserCredential?> signUp({
    required String email,
    required String password,
    required String username,
    required String surname, required String tuyaToken, required String tuyaUid, required String tuyaRefreshedToken,
  }) async {
    try {
      var response = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        'uid': user.uid,
        'email': email,
        'username': username,
        'password': password,
        'role': 'user',
        'surname': surname,
        "tuyaToken":tuyaToken,
        "tuyaUid":tuyaUid,
        "tuyaRefreshedToken":tuyaRefreshedToken,
      }).then((value) async{
        await Prefs.write(Prefs.password,password);
        await Prefs.write(Prefs.surname,surname);
        await Prefs.write(Prefs.username,username);
        await Prefs.write(Prefs.email,email);
        await Prefs.write(Prefs.tuyaUid,tuyaUid);

        await Prefs.write(Prefs.token,response.user?.uid??'');
      }).onError((error, stackTrace) {
        snackbar(error.toString());
      });
      return response;
    } on FirebaseAuthException catch (e) {
      snackbar(e.code);
    }
  }

  //SIGN IN METHOD
  Future<UserCredential?> login(
      {required String email, required String password}) async {
    try {
      var response = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return response;
    } on FirebaseAuthException catch (e) {
      snackbar(e.code);
    }
  }

  Future<QuerySnapshot?> getProfile({required String userEmail}) async {
    try {
      final QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .get();
      return snap;
    } on FirebaseAuthException catch (e) {
      snackbar(e.code);
    }
  }

  Future<DocumentReference?> addDevices(
      {required String devicename, required String deviceid}) async {
    try {
      final DocumentReference result = await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .collection("devices")
          .add({
        "devicename": devicename,
        "deviceid": deviceid,
        "status": false,
      });
      await FirebaseFirestore.instance.collection("users")
          .doc(user.uid)
          .collection("devices")
          .doc(result.id)
          .update({
        "uid": result.id,
      });
      return result;
    } on FirebaseAuthException catch (e) {
      snackbar(e.code);
    }
  }

  Future<QuerySnapshot?> getAllDeviceDocumentData() async {
    try {
      final QuerySnapshot data = await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .collection("devices")
          .get();
      return data;
    } on FirebaseAuthException catch (e) {
      snackbar(e.code);
    }
  }

  updateDevices(
      {required String devicename,
      required String deviceid,
      required String deviceuid}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection("devices")
          .doc(deviceuid)
          .update({
        "devicename": devicename,
        "deviceid": deviceid,
      });
      return response;
    } on FirebaseAuthException catch (e) {
      snackbar(e.code);
    }
  }

  updateDevicesStatus({required String deviceuid, required bool status}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection("devices")
          .doc(deviceuid)
          .update({
        "status": status,
      });
      return response;
    } on FirebaseAuthException catch (e) {
      snackbar(e.code);
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    try {
      await auth.signOut();
      print('signout');
    } on FirebaseAuthException catch (e) {
      snackbar(e.code);
    }
  }
}
