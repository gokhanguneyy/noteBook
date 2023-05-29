import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class loginOperations{

  Future kayitOl(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password); 
      return "success";
    } on FirebaseAuthException catch (e) {
      return hataMesajlari(e);
    }
  }

  Future girisYap(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password); 
      return "success";
    } on FirebaseAuthException catch (e) {
      return hataMesajlari(e);
    }
  }

  Future sifremiUnuttum(String email) async {
    try {
      final result = await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
     return "success";
    } on FirebaseAuthException catch (e) {
      return hataMesajlari(e);
    }
  }

  Future cikis() async {
    try {
      await FirebaseAuth.instance.signOut();
      return "success";
    } on FirebaseAuthException catch (e) {
      return hataMesajlari(e);
    }
  }


  String hataMesajlari(dynamic e){
    String res;
    switch (e.code) {
      case "user-not-found":
        res = "Kullanici Bulunamadi";
      break;
      case "email-already-in-use":
        res = "Mail Zaten Kayitli.";
      break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        res = "Gecersiz Mail";
      break;
      case "wrong-password":
        res = "Hatali Sifre";
      break;
      case "user-disabled":
        res = "Kullanici Pasif";
      break;
      default:
        res = "Bir Hata Ile Karsilasildi, Birazdan Tekrar Deneyiniz.";
      break;
    }
    return res;
  }
}