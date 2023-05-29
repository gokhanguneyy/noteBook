import 'package:flutter/material.dart'; 

class customImage extends StatelessWidget{
  customImage({
    Key? key
  }): super(key: key); 

  @override 
  Widget build(BuildContext context){
    return Image.asset(
      imageName.name,  
      fit: BoxFit.scaleDown,
    );
  }
}

class imageName{
  static const String name = "assets/images/notDefteri.jpg";
}