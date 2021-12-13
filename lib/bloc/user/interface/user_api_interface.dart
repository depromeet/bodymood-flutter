import '../model/user.dart';

abstract class UserApiInterface {
  Future<BodymoodUser> user();
}
