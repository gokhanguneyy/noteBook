import 'package:flutter/material.dart'; 

class noteAdd extends StatefulWidget{
  noteAdd({
    Key? key, 
    required this.noteAddController, 
    required this.onPressed,
  }): super(key: key); 

  final TextEditingController noteAddController;
  final void Function() onPressed;

  @override
  State<noteAdd> createState() => _noteAddState();
}

class _noteAddState extends State<noteAdd> with WidgetsBindingObserver {
  double _bottomInset = 0; 
  double _sheetHeight = 150;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _bottomInset=MediaQuery.of(context).viewInsets.bottom;
    });
  }


  @override 
  Widget build(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white,),
      backgroundColor: Colors.amber,
      onPressed: () {
        _noteAddHeader(context, widget.noteAddController, widget.onPressed);
      },
    );
  }

  Future<dynamic> _noteAddHeader(BuildContext context, TextEditingController controller, void Function() onPressed) {
    return showModalBottomSheet(
        context: context, 
        isScrollControlled: true, 
        builder: (context){
          return _sheetContainer(
            height: _bottomInset+_sheetHeight,
            widgetPadding: _sheetPadding(
              widgetColumn: _sheetPaddingColumn(
                widgetText:_sheetHeadTextField(controller: controller),
                widgetButton:_sheetHeadButton(onPressed: onPressed),
              ),
            ),
          );
        }
      );
  }
}

class _sheetContainer extends StatelessWidget{
  _sheetContainer({
    Key? key, 
    required this.height, 
    required this.widgetPadding,
  }): super(key: key); 

  final double height;
  final Widget widgetPadding;
  @override 
  Widget build(BuildContext context){
    return Container(
      height: height,
      child: widgetPadding,
    );
  }
}

class _sheetPadding extends StatelessWidget{
  _sheetPadding({
    Key? key,
    required this.widgetColumn,
  }): super(key: key); 

  final Widget widgetColumn;

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: widgetColumn,
    );
  }
}

class _sheetPaddingColumn extends StatelessWidget{
  _sheetPaddingColumn ({
    Key? key,
    required this.widgetText, 
    required this.widgetButton,
  }): super(key: key); 

  final Widget widgetText, widgetButton;

  @override 
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        widgetText, 
        widgetButton,
      ],
    );
  }
}

class _sheetHeadTextField extends StatelessWidget{
  _sheetHeadTextField({
    Key? key, 
    required this.controller,
  }): super(key: key); 

  // en üstteki noteAddController'a ulaşamıyoruz çünkü aynı kod blogları içerisinde değiliz.
  // Ona ulaşmak için _noteAddHeader'a bu widget'ı eklememiz lazım.
  final TextEditingController controller;
  @override 
  Widget build(BuildContext context){
    return TextField(
      controller : controller,
      maxLength: 40, 
      maxLines: null,
      decoration: InputDecoration(
        hintText: "Başlık ekleyiniz...", 
        border: InputBorder.none,
      ),
    );
  }
}

class _sheetHeadButton extends StatelessWidget{
  _sheetHeadButton ({
    Key? key,
    required this.onPressed,
  }): super(key: key); 

  final void Function() onPressed;
  @override 
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: onPressed, 
      child: _sheetButtonMessage(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber
      )
    );
  }

  Text _sheetButtonMessage() => Text("Oluştur");
}