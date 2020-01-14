import 'package:mobx/mobx.dart';
import 'package:mobx_list/app/models/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: 'Item 1', check: true),
    ItemModel(title: 'Item 2', check: false),
    ItemModel(title: 'Item 3', check: false),
  ].asObservable();

  @action
  addItem(ItemModel item) => listItems.add(item);

  @action
  removeItem(ItemModel item) => listItems.removeWhere(
        (i) => i.title == item.title,
      );

  @computed
  int get totalChecked => listItems.where((i) => i.check).length;
}
