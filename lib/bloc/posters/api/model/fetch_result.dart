import 'fetched_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_result.g.dart';

@JsonSerializable()
class FetchedResult {
  final String code;
  final String message;
  final FetchedData data;

  FetchedResult(this.code, this.message, this.data);
  Map<String, dynamic> toJson() => _$FetchedResultToJson(this);
  factory FetchedResult.fromJson(Map<String, dynamic> json) =>
      _$FetchedResultFromJson(json);
}

@JsonSerializable()
class FetchedData {
  final int totalCount;
  final int pageTotalCount;
  final int pagePosition;
  final List<FetchedImage> posters;

  FetchedData(
      this.totalCount, this.pageTotalCount, this.pagePosition, this.posters);
  factory FetchedData.fromJson(Map<String, dynamic> json) =>
      _$FetchedDataFromJson(json);
  Map<String, dynamic> toJson() => _$FetchedDataToJson(this);
}
