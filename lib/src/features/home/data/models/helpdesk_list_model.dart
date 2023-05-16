import 'package:ecorporativo/src/features/home/data/models/helpdesk_model.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/helpdesk_list_entity.dart';

part 'helpdesk_list_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class HelpDeskListModel {
  @JsonKey(name: "helpdesks")
  final List<HelpDeskModel> called;

  HelpDeskListModel({
    required this.called,
  });
  factory HelpDeskListModel.fromJson(dynamic json) =>
      _$HelpDeskListModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelpDeskListModelToJson(this);

  static HelpDeskListEntity toEntity(HelpDeskListModel model) {
    return HelpDeskListEntity(
        called: model.called.map((e) => HelpDeskModel.toEntity(e)).toList());
  }

  static HelpDeskListModel toModel(HelpDeskListEntity entity) {
    return HelpDeskListModel(
        called: entity.called.map((e) => HelpDeskModel.toModel(e)).toList());
  }
}
