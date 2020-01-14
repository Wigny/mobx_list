import 'package:mobx/mobx.dart';
import 'package:mobx_list/app/models/item_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final listItems = BehaviorSubject<List<ItemModel>>.seeded([]);
  final filter = BehaviorSubject<String>.seeded('');

  ObservableStream<List<ItemModel>> output;

  _HomeControllerBase() {
    output = Rx.combineLatest2<List<ItemModel>, String, List<ItemModel>>(
      listItems.stream,
      filter.stream,
      (list, filter) => (filter.isEmpty)
          ? list
          : list.where((i) => i.title.toLowerCase().contains(filter)).toList(),
    ).asObservable(initalValue: []);
  }

  @action
  addItem(ItemModel item) => listItems.add(
        List<ItemModel>.from(listItems.value)..add(item),
      );

  @action
  removeItem(ItemModel item) => listItems.add(
        List<ItemModel>.from(listItems.value)
          ..removeWhere((i) => i.title == item.title),
      );

  setFilter(String v) => filter.add(v);

  @computed
  int get totalChecked => output.value.where((i) => i.check).length;
}
