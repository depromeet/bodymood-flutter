import '../../../bloc/posters/core/ds/poster_store.dart';
import '../riverpod/photo_provider.dart';
import '../../../resources/resources.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'title.dart';

class PosterPhotoSelector extends ConsumerWidget {
  const PosterPhotoSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ItemSelectorTitle(
            itemTitle: '사진을 선택하세요.',
          ),
          const SizedBox(height: 16),
          _buildPhotoSelector(ref),
        ],
      ),
    );
  }

  Widget _buildPhotoSelector(WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCameraButton(ref),
        const SizedBox(width: 32),
        _buildAlbumButton(ref),
      ],
    );
  }

  _ChoosePhotoButton _buildAlbumButton(WidgetRef ref) {
    return _ChoosePhotoButton(
      onTap: () => _handleImagePicker(ImageSource.gallery, ref),
      child: SvgPicture.asset(
        EditPosterImages.fromAlbumIcon,
        fit: BoxFit.contain,
      ),
    );
  }

  _ChoosePhotoButton _buildCameraButton(WidgetRef ref) {
    return _ChoosePhotoButton(
      onTap: () => _handleImagePicker(ImageSource.camera, ref),
      child: SvgPicture.asset(
        EditPosterImages.fromCameraIcon,
        fit: BoxFit.contain,
      ),
    );
  }

  _handleImagePicker(ImageSource source, WidgetRef ref) async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(
      source: source,
      maxWidth: 800,
    );
    final photoProvider = ref.read(selectedPhotoProvider.notifier);
    photoProvider.updatePhoto(
      image?.path == null ? EmptyImageStore() : LocalImageStore(image!.path),
    );
  }
}

class _ChoosePhotoButton extends StatelessWidget {
  const _ChoosePhotoButton({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  final Function() onTap;
  final SvgPicture child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 40,
        height: 40,
        child: child,
      ),
    );
  }
}
