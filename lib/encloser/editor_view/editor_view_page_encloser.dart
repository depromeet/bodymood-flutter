import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../interactor/editor_view/editor_page_interactor.dart';
import '../app_view/app_view_interactor_encloser.dart';

final editorViewPageEncloser = ChangeNotifierProvider.autoDispose((ref) {
  final appViewInteractor = ref.watch(appViewPageEncloser.notifier);
  return EditorViewPageInteractor(appViewInteractor: appViewInteractor);
});
