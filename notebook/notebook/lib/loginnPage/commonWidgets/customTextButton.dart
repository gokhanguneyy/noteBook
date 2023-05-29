import 'package:flutter/material.dart'; 

class customTextButton extends StatelessWidget{
  customTextButton({
    Key? key, 
    required this.onPressed,
    required this.text
  }): super(key: key); 
  
  final String text;
  final void Function() onPressed;
  @override 
  Widget build(BuildContext context){
    return TextButton(
      onPressed: onPressed, 
      child: _customText(text: text),
    );
  }
}

class _customText extends StatelessWidget {
  _customText({
    Key? key, 
    required this.text,
  }): super(key: key); 

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: Colors.black,
      ),
    );
  }
}