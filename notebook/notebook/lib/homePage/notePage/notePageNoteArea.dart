import 'package:flutter/material.dart'; 

class notePageNoteArea extends StatelessWidget{
  notePageNoteArea ({
    Key? key, 
    required this.controller,
  }): super(key: key); 

  final TextEditingController controller;
  @override 
  Widget build(BuildContext context){
    return Expanded(
      child: notePageNoteAreaPadding(
        widget: notePageNoteAreaTextField(
          controller: controller,
        ),
      ),
    );
  }
}

class notePageNoteAreaPadding extends StatelessWidget {
  const notePageNoteAreaPadding({
    Key ? key, 
    required this.widget,
  }): super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget,
    );
  }
}

class notePageNoteAreaTextField extends StatelessWidget{
  notePageNoteAreaTextField({
    Key? key, 
    required this.controller,
  }): super(key: key);

  final TextEditingController controller;

  @override 
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      maxLines: null, 
      style: Theme.of(context).textTheme.titleLarge,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}