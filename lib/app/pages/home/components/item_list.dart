import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_list/app/models/item_model.dart';

class ItemList extends StatelessWidget {
  final ItemModel item;
  final Function removeClicked;

  const ItemList({Key key, this.item, this.removeClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => ListTile(
        leading: Checkbox(
          onChanged: item.setCheck,
          value: item.check,
        ),
        title: Text(item.title),
        trailing: IconButton(
          icon: Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
          onPressed: removeClicked,
        ),
      ),
    );
  }
}
