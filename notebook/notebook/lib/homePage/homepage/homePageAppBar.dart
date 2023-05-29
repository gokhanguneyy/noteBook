import 'package:flutter/material.dart';

class homePageAppBar extends AppBar{
  final void Function() onPressed;
  homePageAppBar({
    required this.onPressed, 
    Key? key
  }): super( 
    title: _appBarPadding(child: _appBarPageIcon(iconName: Icons.folder)),
    actions: [ _appBarPadding(child: _appBarActionIconButton(onPressed:onPressed))], 
    centerTitle: true, 
    leading: null, 
    automaticallyImplyLeading: false, 
    backgroundColor: Colors.transparent, 
    elevation: 0
  );
} 

// ------------------------------------------------
class _appBarPageIcon extends StatelessWidget{
  _appBarPageIcon({Key? key, required this.iconName}): super(key: key);

  final IconData iconName;

  @override
  Widget build(BuildContext context){
    return Icon(
      iconName, 
      size:35, 
      color: Colors.amber
    );
  }
}

// ------------------------------------------------

class _appBarActionIconButton extends StatelessWidget{
  _appBarActionIconButton({
    Key? key, 
    required this.onPressed,
  }): super(key:key); 

  final void Function() onPressed;

  @override 
  Widget build(BuildContext context){
    return IconButton(
      iconSize: 35,
      icon: _appBarPageIcon(iconName: Icons.logout_outlined), 
      onPressed: onPressed,
    );
  }
}

// ------------------------------------------------

class _appBarPadding extends StatelessWidget{
  _appBarPadding({Key? key, required this.child}): super(key: key);

  final Widget child;
  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(0), 
      child: child,
    );
  }
}