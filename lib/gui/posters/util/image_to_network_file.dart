import 'dart:io';
import 'package:bodymood/bloc/posters/model/poster_image.dart';
import 'package:intl/intl.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:path_provider/path_provider.dart';

Future<NetworkToFileImage> posterToNetworkFile(PosterImage image) async {
  final path = await getImageTempFilePath(image);
  final file = File(path);
  return NetworkToFileImage(
    url: image.imageUrl,
    file: file,
  );
}

Future<String> getImageTempFilePath(PosterImage image) async {
  final tempdir = await getTemporaryDirectory();
  final filename = getImageDateString(image).replaceAll(' ', '-');
  final ext = image.imageUrl.split('.').last;
  return tempdir.path + '/' + filename + '.' + ext;
}

String getImageDateString(PosterImage image) {
  return DateFormat('yyyy년 M월 d일').format(image.createdAt);
}
