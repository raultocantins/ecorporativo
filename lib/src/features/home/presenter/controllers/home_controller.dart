import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

// ignore: library_private_types_in_public_api
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase();

  @observable
  bool isLoading = false;

  @action
  changeIsLoading(bool value) {
    isLoading = value;
  }

  @action
  dispose() {
    isLoading = false;
  }
}
