import 'package:flutter/material.dart'; 

class customEmail extends StatelessWidget{
  customEmail ({
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
      obscureText: false, 
      decoration: InputDecoration(    
        labelText: formTitle, 
        labelStyle: TextStyle(
          color: Colors.black
        ),
        prefixIcon: customEmailIcon(),  
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50)
        ),      
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber
          ), 
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

class customEmailIcon extends StatelessWidget {
  const customEmailIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconName.emailIcon,
      color: Colors.amber,
    );
  }
}

class iconName{
  static const IconData emailIcon=Icons.email_outlined;
}