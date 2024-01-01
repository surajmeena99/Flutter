import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:myeapp/consts/consts.dart';

class AuthController extends GetxController {

  var emailcontroller =TextEditingController();
  var passcontroller =TextEditingController();

   var isloading = false.obs;


  Future<UserCredential?> LoginMethod({ context}) async {
    UserCredential? userCredential;
    try {
      await auth.signInWithEmailAndPassword(email: emailcontroller.text, password: passcontroller.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  ///Signing Methode
  Future<UserCredential?> siginMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  ///storing Data Method
  storeUserData({name, password, email}) async {
    DocumentReference store =
        await firestore.collection(userCollection).doc(currentuser!.uid);
    store.set(
        {'name': name, 'email': email, 'password': password, 'imageurl': '','id':currentuser!.uid});
  }

  ///Signout Method
  SignoutMethod({context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
