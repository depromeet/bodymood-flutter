import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class BodymoodUser {
  final String name;
  final String? profileUrl;

  BodymoodUser(this.name, this.profileUrl);
  factory BodymoodUser.fromJson(Map<String, dynamic> json) =>
      _$BodymoodUserFromJson(json);
  Map<String, dynamic> toJson() => _$BodymoodUserToJson(this);

  bool get isEmpty => name.isEmpty && (profileUrl?.isEmpty ?? true);
}
