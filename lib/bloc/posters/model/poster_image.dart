import 'package:freezed_annotation/freezed_annotation.dart';

part 'poster_image.g.dart';

@JsonSerializable()
class PosterImage {
  PosterImage({
    required this.id,
    required this.imageUrl,
    required this.createdAt,
  });
  final int id;
  final String imageUrl;
  final DateTime createdAt;
  Map<String, dynamic> toJson() => _$PosterImageToJson(this);
  factory PosterImage.fromJson(Map<String, dynamic> json) =>
      _$PosterImageFromJson(json);
}
