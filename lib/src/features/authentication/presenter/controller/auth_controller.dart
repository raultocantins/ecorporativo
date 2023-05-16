import 'package:ecorporativo/src/features/authentication/domain/entities/contract_item_entity.dart';
import 'package:ecorporativo/src/features/authentication/domain/entities/contracts_entity.dart';
import 'package:ecorporativo/src/features/authentication/domain/entities/user_entity.dart';
import 'package:ecorporativo/src/features/authentication/domain/usecases/get_contracts_usecase.dart';
import 'package:ecorporativo/src/features/authentication/domain/usecases/login_usecase.dart';
import 'package:ecorporativo/src/features/authentication/domain/usecases/sign_contract_usecase.dart';
import 'package:ecorporativo/src/shared/config/navigation.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

// ignore: library_private_types_in_public_api
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final SignContract signContractUsecase;
  final LoginUsecase loginUsecase;
  final GetContracts getContractsUsecase;
  _AuthControllerBase(
      {required this.loginUsecase,
      required this.getContractsUsecase,
      required this.signContractUsecase});

  @observable
  bool isLoading = false;

  @observable
  UserEntity? user;

  @observable
  ContractsEntity? contractsList;

  @action
  changeIsLoading(bool value) {
    isLoading = value;
  }

  @action
  changeUser(UserEntity value) {
    user = value;
  }

  @action
  changeContractsList(ContractsEntity value) {
    contractsList = value;
  }

  List<ContractItemEntity> get unsignedContracts {
    return contractsList?.contracts
            .where((element) => element.isSigned != true)
            .toList() ??
        [];
  }

  void login({required String login, required String password}) async {
    changeIsLoading(true);
    var result = await loginUsecase(login: login, password: password);
    result.fold((l) => {changeIsLoading(false)}, (r) {
      changeUser(r);
      getContracts();
    });
  }

  void getContracts() async {
    var result = await getContractsUsecase(userid: user?.id ?? 0);
    result.fold((l) => {changeIsLoading(false)}, (r) {
      changeContractsList(r);
      validateContracts();
    });
  }

  void validateContracts() {
    List<ContractItemEntity> contracts = contractsList?.contracts
            .where((element) => element.isSigned != true)
            .toList() ??
        [];
    if (contracts.isNotEmpty) {
      NavigationCustom.currentState.pushNamed("/contract_acceptance");
    } else {
      NavigationCustom.currentState.pushNamed("/home");
    }
    changeIsLoading(false);
  }

  void signContract(int id) async {
    changeIsLoading(true);
    final result = await signContractUsecase(contractId: id);

    result.fold((l) => null, (r) {
      List<ContractItemEntity> list = contractsList?.contracts ?? [];
      for (ContractItemEntity e in list) {
        if (e.id == id) {
          e.isSigned = true;
        }
      }
      changeContractsList(ContractsEntity(contracts: list));

      List<ContractItemEntity> unsignedContracts = contractsList?.contracts
              .where((element) => element.isSigned != true)
              .toList() ??
          [];
      if (unsignedContracts.isNotEmpty) {
        NavigationCustom.currentState.pop();
      } else {
        NavigationCustom.currentState
            .pushReplacementNamed('/contract_acceptance/success');
      }
    });
    changeIsLoading(false);
  }

  @action
  dispose() {
    isLoading = false;
    contractsList = null;
    user = null;
  }
}
