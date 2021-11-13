import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetched_image.g.dart';

@JsonSerializable()
class FetchedImage {
  final int photoId;
  final String imageUrl;
  final String createdAt;
  final String updatedAt;

  FetchedImage(this.photoId, this.imageUrl, this.createdAt, this.updatedAt);

  Map<String, dynamic> toJson() => _$FetchedImageToJson(this);
  factory FetchedImage.fromJson(Map<String, dynamic> json) =>
      _$FetchedImageFromJson(json);
}
