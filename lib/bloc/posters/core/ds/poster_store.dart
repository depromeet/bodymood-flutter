import 'package:freezed_annotation/freezed_annotation.dart';

part 'poster_store.freezed.dart';
part 'poster_store.g.dart';

@freezed
class ImageStore with _$ImageStore {
  factory ImageStore.local(String path) = LocalImageStore;
  factory ImageStore.remote(String path) = RemoteImageStore;
  factory ImageStore.empty() = EmptyImageStore;
  factory ImageStore.fromJson(Map<String, dynamic> json) =>
      _$ImageStoreFromJson(json);
}
