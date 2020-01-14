import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  _ItemModelBase({@required this.title, this.check = false});

  @observable
  String title;

  @observable
  bool check;

  @action
  setTitle(String v) => title = v;

  @action
  setCheck(bool v) => check = v;
}
