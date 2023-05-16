import 'package:dartz/dartz.dart';
import 'package:ecorporativo/src/features/authentication/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<Either<String, UserEntity>> call({
    required String login,
    required String password,
  });
}
