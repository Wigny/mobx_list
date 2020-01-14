import 'package:mobx/mobx.dart';
import 'package:mobx_list/app/models/item_model.dart';
import 'package:rxdart/subjects.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: 'Item 1', check: true),
    ItemModel(title: 'Item 2', check: false),
    ItemModel(title: 'Item 3', check: false),
  ].asObservable();

  @observable
  String filter = '';

  @action
  addItem(ItemModel item) => listItems.add(item);

  @action
  removeItem(ItemModel item) => listItems.removeWhere(
        (i) => i.title == item.title,
      );

  @action
  setFilter(String v) => filter = v;

  @computed
  int get totalChecked => listItems.where((i) => i.check).length;

  @computed
  List<ItemModel> get listFiltered => (filter.isEmpty)
      ? listItems
      : listItems
          .where(
            (i) => i.title.toLowerCase().contains(filter),
          )
          .toList();
}
