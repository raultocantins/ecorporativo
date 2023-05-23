import 'package:ecorporativo/src/features/authentication/domain/entities/user_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class UserModel {
  final int id;
  @JsonKey(name: "nome_completo")
  final String fullname;
  @JsonKey(name: "cpf_cnpj")
  final String? documento;
  UserModel({required this.id, required this.fullname, this.documento});
  factory UserModel.fromJson(dynamic json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
        id: model.id, fullname: model.fullname, documento: model.documento);
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
        id: entity.id, fullname: entity.fullname, documento: entity.documento);
  }
}
