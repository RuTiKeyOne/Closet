import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/domain/repository/db_repository.dart';
import 'package:closet/core/internal/locator.dart';

class DbController {
  Future<int> add(User user) async {
    return await getIt.get<DbRepository>().add(user);
  }

  Future<List<User>> getUsers() async {
    return await getIt.get<DbRepository>().getUsers();
  }

  Future<int> update(User user) async {
    return await getIt.get<DbRepository>().update(user);
  }

  Future<int> remove(int id) async {
    return await getIt.get<DbRepository>().remove(id);
  }
}
