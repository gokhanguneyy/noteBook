import 'package:flutter/material.dart';
import 'package:notebook/loginnPage/commonWidgets/customElevatedButton.dart';
import 'package:notebook/loginnPage/commonWidgets/customEmailTextField.dart';
import 'package:notebook/loginnPage/commonWidgets/customImage.dart';
import 'package:notebook/loginnPage/commonWidgets/customPasswordTextField.dart';
import 'package:notebook/loginnPage/commonWidgets/customTextButton.dart';
import 'package:notebook/loginnPage/firebaseAuth/firebase_login.dart';
import 'package:notebook/loginnPage/signIn.dart';
import 'package:notebook/navigate.dart';

class signnUp extends StatefulWidget{
  signnUp({Key? key}): super(key: key); 

  @override
  State<signnUp> createState() => _signnUpState();
}

class _signnUpState extends State<signnUp> {
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Form(
                key: formKey, 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // sayfadaki resim 
                    customImage(), 
    
                    // email area, 
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
    
                    _blank(), // just a blank, 
    
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
    
                    _blank(), // just a blank 
    
                    // custom sign up button 
                    Part1customElevatedButtonCenter(
                      text: "Kayıt Ol", 
                      onPressed: () async {
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          final result = await firebaseAuth.kayitOl(email, password);
                          if(result == "success"){
                            navigate().goToPage(context, signIn());
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              _snackBar(result),
                            );
                          }
                        }
    
                      },
                    ), 
    
                    _blank(), // just a blank 
    
                    // comeback button 
                    customTextButton(
                      text: "Geri Dön",
                      onPressed: (){
                        navigate().goToPage(context, signIn());
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
            TextButton(onPressed: (){Navigator.pop(context, true);}, child: Text("YES")),
          ],
        );
      }
    );
  }

  SnackBar _snackBar(result) => SnackBar(content: Text(result, textAlign: TextAlign.center,));

  SizedBox _blank() => SizedBox(height: 20,);
}