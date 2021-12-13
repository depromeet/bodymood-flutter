import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/auth/controller/auth_token_manager_provider.dart';
import '../../../bloc/auth/controller/ds/auth_token.dart';
import '../../../bloc/posters/api/poster_delete_api.dart';
import '../../../bloc/posters/riverpod/poster_album_provider.dart';
import '../../../resources/resources.dart';
import '../../constants/color.dart';
import '../../widgets/snackbar/bodymood_snackbar.dart';

class PosterDeleteButton extends ConsumerWidget {
  const PosterDeleteButton({
    Key? key,
    required this.posterId,
  }) : super(key: key);
  final int posterId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          final confirmed = await showDialog<bool?>(
            context: context,
            builder: (context) {
              return const _ConfirmDialog();
            },
          );
          if (confirmed ?? false) {
            final token = (ref.read(authTokenManagerProvider).authToken
                    as ServerAuthTokenAuthorized)
                .accessToken;
            await BodymoodPosterDeleteApi(accessToken: token).delete(posterId);
            ScaffoldMessenger.of(context).showSnackBar(
              BodymoodSnackbar(
                message: '포스터를 삭제하였습니다.',
                bottom: 156,
              ),
            );
            ref.read(posterAlbumProvider).refresh();
            Navigator.pop(context);
          }
        },
        child: SizedBox(
          width: 56,
          child: Center(
            child: SvgPicture.asset(
              BodymoodImages.deleteIcon,
              color: clPrimaryWhite,
              height: 28,
            ),
          ),
        ),
      ),
    );
  }
}

class _ConfirmDialog extends ConsumerWidget {
  const _ConfirmDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('포스터 삭제하기'),
      content: const Text('삭제된 포스터는 복구할 수 없습니다.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text(
            '취소',
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text(
            '삭제',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
