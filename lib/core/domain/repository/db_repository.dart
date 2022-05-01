import 'package:closet/core/domain/model/user.dart';

abstract class DbRepository {
  Future<List<User>> getUsers();

  Future add(User user);

  Future remove(int id);

  Future update(User user);
}
