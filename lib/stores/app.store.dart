// Store padrao da aplicação
import 'package:mobx/mobx.dart';
import 'package:todos/models/todo-item.model.dart';
part 'app.store.g.dart';

//Convesão de nomenclatura no MOBX
class AppStore = _AppStore with _$AppStore;

// Ao final executar o comando "flutter packages pub run build_runner build" para gerar o arquivo  "*.g.dart"
// e NO SEGUNDO STORE executar o comando "flutter packages pub run build_runner CLEAN" para gerar o arquivo  "*.g.dart"
// "_" = classe private
// abstract = Não pode ser instanciada. Somente pode ser herdada. Assim conseguimos bloquear o dev de instanciar a classe errada
abstract class _AppStore with Store {
  @observable
  String currentState = 'none';

  @observable
  bool busy = false;

  @observable
  ObservableList<TodoItem> todos = new ObservableList<TodoItem>();

  @action
  void changeSelected(String state) {
    currentState = state;
  }

  @action
  void add(TodoItem value) {
    todos.add(value);
  }

  @action
  void setTodos(List<TodoItem> items) {
    todos.addAll(items);
  }

  @action
  void clearTodos() {
    todos = new ObservableList<TodoItem>();
  }
}
