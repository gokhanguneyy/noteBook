import 'package:flutter/material.dart'; 

class Part1customElevatedButtonCenter extends StatelessWidget{
  Part1customElevatedButtonCenter({
    Key? key, 
    required this.text, 
    required this.onPressed
  }): super(key: key); 

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Part2customElevatedButtonSizedBox(
        onPressed: onPressed, 
        text: text,
      ),
    );
  }
}

class Part2customElevatedButtonSizedBox extends StatelessWidget{
  Part2customElevatedButtonSizedBox({
    Key? key, 
    required this.onPressed, 
    required this.text
  }): super(key: key); 
  
  final String text; 
  final void Function() onPressed;
  @override 
  Widget build(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width/2,
      child: Part3customElevatedButton(
        onPressed: onPressed, 
        text: text,
      ),
    );
  }
}

class Part3customElevatedButton extends StatelessWidget{
  Part3customElevatedButton({
    Key? key, 
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  @override 
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        shape: StadiumBorder(),
      ),
      child: Part4customElevatedButtonPadding(text: text),
      onPressed: onPressed,
    );
  }
}

class Part4customElevatedButtonPadding extends StatelessWidget{
  Part4customElevatedButtonPadding({
    Key? key, 
    required this.text
  }): super(key: key);
  
  final String text;

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(18),
      child: Part5customElevatedButtonText(text: text)
    );
  }
}

class Part5customElevatedButtonText extends StatelessWidget{
  Part5customElevatedButtonText({
    Key? key, 
    required this.text
  }): super(key: key);

  final String text; 

  @override 
  Widget build(BuildContext context){
    return Text(
      text, 
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: Colors.black,
      ),
    );
  }
}