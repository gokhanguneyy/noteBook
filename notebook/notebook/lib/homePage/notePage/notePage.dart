import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notebook/homePage/notePage/notePageAppBar.dart';
import 'package:notebook/homePage/notePage/notePageNoteArea.dart';

class notePage extends StatefulWidget{
  notePage({
    Key? key,
    this.content = "", 
    required this.email, 
    required this.header,
  }): super(key: key);

  final String email, header, content;

  @override
  State<notePage> createState() => _notePageState();
}

class _notePageState extends State<notePage> {
  TextEditingController notePageController = TextEditingController();

  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    notePageController.text=widget.content;
  }

  void ekle(){
    try {
      FirebaseFirestore.instance.collection("noteBook")
      .doc(widget.email).collection("sekme").doc(widget.header)
      .update({
        'kullanıcıNotları': notePageController.text
      });
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async {
        ekle();
        return true;
      },
      child: Scaffold(
        appBar: notePageAppBar(
          widgetHeader: widget.header, 
          onPressed: () async {
            ekle();
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            notePageNoteArea(
              controller: notePageController,
            ),
          ],
        )
      ),
    );
  }
}

