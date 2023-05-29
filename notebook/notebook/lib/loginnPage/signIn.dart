import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notebook/homePage/homepage/homePage.dart';
import 'package:notebook/loginnPage/commonWidgets/customElevatedButton.dart';
import 'package:notebook/loginnPage/commonWidgets/customEmailTextField.dart';
import 'package:notebook/loginnPage/commonWidgets/customImage.dart';
import 'package:notebook/loginnPage/commonWidgets/customPasswordTextField.dart';
import 'package:notebook/loginnPage/commonWidgets/customTextButton.dart';
import 'package:notebook/loginnPage/firebaseAuth/firebase_login.dart';
import 'package:notebook/loginnPage/signUp.dart';
import 'package:notebook/navigate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class signIn extends StatefulWidget{
  signIn({Key? key}): super(key: key); 

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final formKey = GlobalKey<FormState>();
  late String email, password;
  loginOperations firebaseAuth = new loginOperations();

  @override 
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showMyDialog();
        return shouldPop ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.white, 
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Form(
                key: formKey, 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, 
                  children: [
                    //Image at the page
                    customImage(), 
    
                    // email area 
                    customEmail(
                      formTitle: "E-mail",  
                      validator: (value){
                        if(value!.isEmpty){
                          return "Bilgileri eksiksiz giriniz..."; 
                        }
                      },
                      onSaved: (value){ 
                        email=value!;
                      }, 
                    ),
    
                    _blank(), // just a blank  
    
                    // password area 
                    customPassword(
                      formTitle: "Password", 
                      validator: (value){
                        if(value!.isEmpty){
                          return "Bilgileri eksiksiz giriniz..."; 
                        }
                      },
                      onSaved: (value){
                        password=value!;
                      },
                    ),
    
                    // forgot password area 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, 
                      children: [
                        customTextButton(
                          text: "Şifremi Unuttum", 
                          onPressed: () async {
                            if(formKey.currentState!.validate()){
                              formKey.currentState!.save();
                              final result = await firebaseAuth.sifremiUnuttum(email);
                              if(result == "success"){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  _snackBar("Şifre güncelleme kodu mail adresinize gönderilmiştir..."),
                                 );
                              }
                              else{
                                 ScaffoldMessenger.of(context).showSnackBar(
                                  _snackBar(result),
                                 );
                              }
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                _snackBar("Lütfen boş kutucukları doldurunuz..."),
                              );
                            }
                          },
                        )
                      ],
                    ), 
    
                    _blank(), // just a blank 
    
                    // signIn Button area 
                    Part1customElevatedButtonCenter(
                      text: "Giriş Yap", 
                      onPressed: () async {
                        setState(() {});
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save(); 
                          final result = await firebaseAuth.girisYap(email, password); 
                          if(result == "success"){
                              await FirebaseFirestore.instance.collection("noteBook")
                              .doc(email).set({
                              'email':email, 
                              'password': password,
                            });
                           navigate().goToPage(context, homePage(documentEmail: email));
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              _snackBar(result),
                           );
                          }
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                           _snackBar("Lütfen boş kutucukları doldurunuz..."),
                          );
                        }
                        
                      },
                    ),
    
                    _blank(), // just a blank 
    
                    // signUp area 
                    customTextButton(
                      text: "Kayıt ol", 
                      onPressed:() {
                        navigate().goToPage(context, signnUp());
                      }, 
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
   Future <bool?> showMyDialog(){
    return showDialog<bool>(context: context,
      builder: (context){
        return AlertDialog(
          title:Text("Do you want to go Back?"),
          actions: [
            TextButton(onPressed: (){Navigator.pop(context, false);}, child: Text("CANCEL")),
            TextButton(onPressed: (){
              SystemNavigator.pop();
              }, child: Text("YES")),
          ],
        );
      }
    );
  }
  SnackBar _snackBar(String message) => SnackBar(content: Text(message, textAlign: TextAlign.center,),);
  SizedBox _blank() => SizedBox(height: 20,);
}