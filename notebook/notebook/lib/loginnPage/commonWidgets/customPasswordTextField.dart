import 'package:flutter/material.dart'; 

class customPassword extends StatelessWidget{
  customPassword({
    Key? key, 
    required this.formTitle, 
    required this.onSaved, 
    required this.validator
    }): super(key: key);

    final String formTitle;
    final String? Function(String?)? onSaved, validator; 

  @override 
  Widget build(BuildContext context){
    return TextFormField(
      cursorColor: Colors.amber,
      validator: validator, 
      onSaved: onSaved,  
      keyboardType: TextInputType.emailAddress,  
      textInputAction: TextInputAction.next, 
      obscureText: true,
      decoration: InputDecoration(
        labelText: formTitle, 
        labelStyle: TextStyle(
          color: Colors.black
        ),
        prefixIcon: customPasswordIcon(),
         enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber
          ), 
          borderRadius: BorderRadius.circular(50)
        ),
         border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber
          ), 
          borderRadius: BorderRadius.circular(50)
        ),
      ), 
    );
  }
}

class customPasswordIcon extends StatelessWidget{
  customPasswordIcon ({
    Key? key, 
  }): super(key: key); 

  @override 
  Widget build(BuildContext context){
    return Icon(
      iconName.passwordIcon,
      color: Colors.amber,
    );
  }
}

class iconName{
  static const IconData passwordIcon = Icons.remove_red_eye_outlined;
}

