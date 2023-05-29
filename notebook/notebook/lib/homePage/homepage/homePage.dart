import 'package:flutter/material.dart';
import 'package:notebook/homePage/homepage/homePageAppBar.dart';
import 'package:notebook/homePage/homepage/homePageCustomCard.dart';
import 'package:notebook/homePage/homepage/homePageNoteAdd.dart';
import 'package:notebook/homePage/notePage/notePage.dart';
import 'package:notebook/loginnPage/firebaseAuth/firebase_login.dart';
import 'package:notebook/loginnPage/signIn.dart';
import 'package:notebook/navigate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homePage extends StatefulWidget{
  homePage({Key? key, required this.documentEmail}): super(key: key);
  final documentEmail; // başarılı giriş yapan kullanıcının email ve şifre bilgilerini 
  // veri tabanına kaydetmek için alıyoruz.
  
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with WidgetsBindingObserver {
  final loginOperations firebaseAuth = new loginOperations();
  
  final TextEditingController controller = TextEditingController();

  // notların başlığını oluşturduğumuz tarih
  String time(){
    final DateTime now = DateTime.now();
    String date = "${now.day}/${now.month}/${now.year}";
    return date;
  }

  // başlık uyarı mesajı
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Icon(Icons.info_outline_rounded),
          content: Text("Lütfen notunuza başlık ekleyiniz..."),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Close", style: TextStyle(color: Colors.black),))
          ]
        );
      },
    );
  }

   Future <bool?> logout2(){
    return showDialog<bool>(context: context,
      builder: (context){
        return AlertDialog(
          title:Text("Çıkış yapmak istediğinizden emin misiniz?"),
          actions: [
            TextButton(onPressed: (){Navigator.pop(context, false);}, child: Text("HAYIR")),
            TextButton(onPressed: () async {
               final result = await firebaseAuth.cikis();
                if(result == "success"){
               navigate().goToPage(context, signIn());
              }
              }, child: Text("EVET")),
          ],
        );
      }
    );
  }
  
  @override 
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async {
        final youSure = await logout2();
        return youSure??false;
      },
      child: Scaffold(
        // appBar of project
        appBar: homePageAppBar(
          onPressed: () async {
            final result = await firebaseAuth.cikis();
            if(result=="success"){
              logout2();
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(
                _snackBar(result),
              );
            }
          },
        ),
      
        floatingActionButton:noteAdd(
          noteAddController: controller, 
          onPressed: () async {
            setState(() {});
            if((controller.text=="")){
              _showDialog();
            }
            else{
              Navigator.pop(context); 
              try {
                await FirebaseFirestore.instance.collection("noteBook")
                .doc(widget.documentEmail).collection("sekme")
                .doc(controller.text).set({
                  'header' : controller.text, 
                  'time' : time(), 
                  'kullanıcıNotları' : "",
                });
                navigate().goToPage(context, notePage(email: widget.documentEmail, header: controller.text,));
                controller.clear();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  _snackBar(e.toString()),
                );
              }
            }
          },
        ),
    
        body: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('noteBook').doc(widget.documentEmail).collection("sekme").snapshots(),
          builder: (BuildContext context, snapshot) {
            return !snapshot.hasData ? Text("Yükleniyor..."):ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                DocumentSnapshot myPost =snapshot.data!.docs[index];
                return customCardListTile(
                  title: myPost['header'], 
                  subtitle: myPost['time'], 
                  deleteOnPressed: () async {
                  
                    await FirebaseFirestore.instance.collection("noteBook").doc(widget.documentEmail).collection("sekme")
                    .where('header', isEqualTo: myPost['header']).get().then((value){
                      value.docs.forEach((doc){
                        doc.reference.delete();
                      });
                    } );
                    
                      setState(() { 
                    });
                  }, 
                  listTileOnPressed: (){
                    String content = myPost['kullanıcıNotları'];
                    String baslik = myPost['header'];
                    navigate().goToPage(
                      context, 
                      notePage(email: widget.documentEmail, 
                      content: content, header: baslik)
                    );
                  }

                );
              },
            );
          }
        ),
        )
       
    
      ),
    );
  }
  SnackBar _snackBar(result) => SnackBar(content: Text(result, textAlign: TextAlign.center,));
}
