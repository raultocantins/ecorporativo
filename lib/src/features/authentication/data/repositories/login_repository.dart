import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/authentication/data/models/user_model.dart';
import 'package:ecorporativo/src/features/authentication/domain/entities/user_entity.dart';
import 'package:ecorporativo/src/features/authentication/domain/repositories/login_repository.dart';

import '../datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource loginDatasource;

  LoginRepositoryImpl({required this.loginDatasource});
  @override
  Future<Either<String, UserEntity>> call({
    required String login,
    required String password,
  }) async {
    try {
      final result = await loginDatasource(login: login, password: password);
      UserEntity userEntity = UserModel.toEntity(result);
      return Right(userEntity);
    } catch (e) {
      return const Left("Aconteceu um erro inesperado");
    }
  }
}
