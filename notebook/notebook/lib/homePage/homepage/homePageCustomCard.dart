import 'package:flutter/material.dart'; 

class customCardListTile extends StatelessWidget {
  const customCardListTile({
    super.key, 
    required this.title, 
    required this.subtitle, 
    required this.deleteOnPressed, 
    required this.listTileOnPressed,
    });

    final void Function() deleteOnPressed, listTileOnPressed; 
    final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20), right: Radius.circular(20)),
      ),
      color: Colors.amber[50],

      child: customListTile(
        listTileOnPressed: listTileOnPressed,
        title: customListTileHeaders(baslik: title), 
        subtitle: customListTileHeaders(baslik: subtitle), 
        trailing: customListTileIconButton(
          deleteOnPressed: deleteOnPressed,
        ),
      ),

    );
  }
}

class customListTile extends StatelessWidget {
  const customListTile({
    super.key, 
    required this.listTileOnPressed,
    required this.title, 
    required this.subtitle, 
    required this.trailing,
  });
  final void Function() listTileOnPressed;
  final Widget title, subtitle, trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top:20, bottom: 20, left: 10, right: 10), 
      onTap: listTileOnPressed, 
      title: title, 
      subtitle: subtitle,
      trailing: trailing,
    );
  }
}

class customListTileHeaders extends StatelessWidget {
  const customListTileHeaders({
    super.key, 
    required this.baslik,
    });
    final String baslik;

  @override
  Widget build(BuildContext context) {
    return Text(
      baslik
    );
  }
}

class customListTileIconButton extends StatelessWidget {
  const customListTileIconButton({
    super.key,
    required this.deleteOnPressed
    });
  final void Function() deleteOnPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _icon(),
      onPressed: deleteOnPressed,
    );
  }

  Icon _icon() => Icon(Icons.delete, color:Colors.amber);
}