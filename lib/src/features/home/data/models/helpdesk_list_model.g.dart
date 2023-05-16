// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helpdesk_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelpDeskListModel _$HelpDeskListModelFromJson(Map json) => HelpDeskListModel(
      called: (json['helpdesks'] as List<dynamic>)
          .map((e) => HelpDeskModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$HelpDeskListModelToJson(HelpDeskListModel instance) =>
    <String, dynamic>{
      'helpdesks': instance.called.map((e) => e.toJson()).toList(),
    };
