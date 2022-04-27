import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  bool? isVisible = true;

  UserModel({this.userId, this.id, this.title, this.body});

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
