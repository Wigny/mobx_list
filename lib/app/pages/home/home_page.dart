import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_list/app/models/item_model.dart';
import 'package:mobx_list/app/pages/home/components/item_list.dart';
import 'package:mobx_list/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Pesquisar",
          ),
        ),
        actions: <Widget>[
          Observer(
            builder: (BuildContext context) => IconButton(
              icon: Text('${controller.totalChecked}'),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (BuildContext context) => ListView.builder(
          itemCount: controller.listItems.length,
          itemBuilder: (context, index) {
            ItemModel item = controller.listItems[index];

            return ItemList(
              item: item,
              removeClicked: () => controller.removeItem(item),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _dialog,
      ),
    );
  }

  _dialog() {
    var item = ItemModel();

    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text('Adicionar item'),
          content: TextField(
            onChanged: item.setTitle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Novo item',
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                controller.addItem(item);
                Navigator.pop(c);
              },
              child: Text('Salvar'),
            ),
            FlatButton(
              onPressed: () => Navigator.pop(c),
              child: Text('Cancelar'),
            )
          ],
        );
      },
    );
  }
}
