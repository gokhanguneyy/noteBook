import 'package:flutter/material.dart';

class navigate{
  void goToPage(BuildContext context, Widget pageName){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context){
          return pageName;
        }
      ),
    );
  }
}