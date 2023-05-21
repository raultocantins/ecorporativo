import 'package:ecorporativo/src/features/authentication/data/repositories/get_contracts_repository.dart';
import 'package:ecorporativo/src/features/authentication/data/repositories/login_repository.dart';
import 'package:ecorporativo/src/features/authentication/data/repositories/sign_contract_repository.dart';
import 'package:ecorporativo/src/features/authentication/domain/usecases/get_contracts_usecase.dart';
import 'package:ecorporativo/src/features/authentication/domain/usecases/login_usecase.dart';
import 'package:ecorporativo/src/features/authentication/domain/usecases/sign_contract_usecase.dart';
import 'package:ecorporativo/src/features/authentication/external/get_contracts_datasource.dart';
import 'package:ecorporativo/src/features/authentication/external/login_datasource.dart';
import 'package:ecorporativo/src/features/authentication/external/sign_contract_datasource.dart';
import 'package:ecorporativo/src/features/authentication/presenter/controller/auth_controller.dart';
import 'package:ecorporativo/src/features/home/data/repositories/create_helpdesk_repository.dart';
import 'package:ecorporativo/src/features/home/data/repositories/get_helpdesk_repository.dart';
import 'package:ecorporativo/src/features/home/data/repositories/get_invoices_repository.dart';
import 'package:ecorporativo/src/features/home/data/repositories/trust_release_repository.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/create_helpdesk_usecase.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/get_helpdesk_usecase.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/get_invoices_usecase.dart';
import 'package:ecorporativo/src/features/home/domain/usecases/trust_release_usecase.dart';
import 'package:ecorporativo/src/features/home/external/create_helpdesk_datasource.dart';
import 'package:ecorporativo/src/features/home/external/get_helpdesk_datasource.dart';
import 'package:ecorporativo/src/features/home/external/get_invoices_datasource.dart';
import 'package:ecorporativo/src/features/home/external/trust_release_datasource.dart';
import 'package:ecorporativo/src/features/home/presenter/controllers/invoices_controller.dart';
import 'package:ecorporativo/src/features/home/presenter/controllers/support_controller.dart';
import 'package:ecorporativo/src/shared/utils/dio.dart';

import 'package:get_it/get_it.dart';

registerDependencies() {
  GetIt getIt = GetIt.instance;

//GATEWAY PAYMENTS
  getIt.registerLazySingleton<HttpService>(() => HttpService());

  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecaseImpl(
      loginRepository: LoginRepositoryImpl(
        loginDatasource: LoginDatasourceImpl(),
      ),
    ),
  );
  getIt.registerLazySingleton<GetContracts>(
    () => GetContractsImpl(
      getContractsRepository: GetContractsRepositoryImpl(
        getContractsDatasource: GetContractsDatasourceImpl(),
      ),
    ),
  );
  getIt.registerLazySingleton<SignContract>(
    () => SignContractImpl(
      signContractRepository: SignContractRepositoryImpl(
        signContractDatasource: SignContractDatasourceImpl(),
      ),
    ),
  );
  getIt.registerLazySingleton<GetInvoices>(
    () => GetInvoicesImpl(
      getInvoicesRepository: GetInvoicesRepositoryImpl(
        getInvoicesDatasource: GetInvoicesDatasourceImpl(),
      ),
    ),
  );

  getIt.registerLazySingleton<GetHelpDesk>(
    () => GetHelpDeskImpl(
      getHelpDeskRepository: GetHelpDeskRepositoryImpl(
        getHelpDeskDatasource: GetHelpDeskDatasourceImpl(),
      ),
    ),
  );

  getIt.registerLazySingleton<TrustRelease>(
    () => TrustReleaseImpl(
        trustReleaseRepository: TrustReleaseRepositoryImpl(
      trustReleaseDatasource: TrustReleaseDatasourceImpl(),
    )),
  );

  getIt.registerLazySingleton<CreateHelpDesk>(
    () => CreateHelpDeskImpl(
      createHelpDeskRepository: CreateHelpDeskRepositoryImpl(
        createHelpDeskDatasource: CreateHelpDeskDatasourceImpl(),
      ),
    ),
  );

  //AUTH CONTROLLER
  getIt.registerLazySingleton<AuthController>(
    () => AuthController(
        loginUsecase: getIt(),
        getContractsUsecase: getIt(),
        signContractUsecase: getIt()),
  );

  //INVOICES CONTROLLER
  getIt.registerLazySingleton<InvoicesController>(
    () => InvoicesController(getInvoices: getIt(), trustRelease: getIt()),
  );

  //SUPPORT CONTROLLER
  getIt.registerLazySingleton<SupportController>(
    () => SupportController(
        getHelpDeskUsecase: getIt(), createHelpDeskUsecase: getIt()),
  );
}
