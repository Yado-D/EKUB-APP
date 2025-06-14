import 'package:ekub_application/features/home_page/domain/entity/equb_entity.dart';
import 'package:flutter/foundation.dart';

class EqubModel extends EqubEntity {
  EqubModel({
    required super.name,
    required super.id,
    required super.members_no,
    required super.cycle_progress,
  });

  factory EqubModel.fromJson(Map<String, dynamic> json) {
    return EqubModel(
      name: json["name"],
      id: json['id'],
      members_no: json["members_no"],
      cycle_progress: json["cycle_progress"],
    );
  }
}
