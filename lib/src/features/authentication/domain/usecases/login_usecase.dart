import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/authentication/domain/entities/user_entity.dart';

import '../repositories/login_repository.dart';

abstract class LoginUsecase {
  Future<Either<String, UserEntity>> call({
    required String login,
    required String password,
  });
}

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository loginRepository;

  LoginUsecaseImpl({required this.loginRepository});

  @override
  Future<Either<String, UserEntity>> call({
    required String login,
    required String password,
  }) async {
    return await loginRepository(login: login, password: password);
  }
}
