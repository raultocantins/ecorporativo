import 'package:ecorporativo/src/features/authentication/data/models/user_model.dart';

abstract class LoginDatasource {
  Future<UserModel> call({
    required String login,
    required String password,
  });
}
