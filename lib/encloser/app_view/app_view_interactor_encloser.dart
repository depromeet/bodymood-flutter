import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../interactor/app_view/app_view_interactor.dart';

final appViewPageEncloser = ChangeNotifierProvider((_) => AppViewInteractor());
