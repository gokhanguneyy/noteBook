import 'package:flutter/material.dart'; 

class notePageAppBar extends AppBar{
  final String widgetHeader; 
  final void Function() onPressed;
  notePageAppBar({
    Key?key, 
    required this.onPressed, 
    required this.widgetHeader,
  }): super(
    backgroundColor: Colors.transparent, 
    elevation: 0,
    centerTitle: true,
    title: customAppBarTitle(widgetHeader: widgetHeader), 
    leading: customAppBarIconButton(onPressed: onPressed),
  );
}

class customAppBarTitle extends StatelessWidget {
  const customAppBarTitle({ 
    required this.widgetHeader, 
    super.key
  });

  final String widgetHeader;
  @override
  Widget build(BuildContext context) {
    return Text(
      widgetHeader,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: Colors.amber, 
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class customAppBarIconButton extends StatelessWidget {
  const customAppBarIconButton({required this.onPressed, super.key});

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed, 
      icon: customAppBarIcon(),
      iconSize: 30,
    );
  }
}

class customAppBarIcon extends StatelessWidget {
  const customAppBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.chevron_left_outlined, 
      color: Colors.amber, 
      size: 30,
    );
  }
}