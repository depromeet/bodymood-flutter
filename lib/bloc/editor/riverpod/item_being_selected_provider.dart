import '../model/item_being_selected.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemBeingSelectedProvider =
    StateProvider<ItemBeingSelected>((_) => NothingBeingSelected());
