import 'package:closet/core/data/db/user_db_impl.dart';
import 'package:closet/core/data/mapper/user_mapper.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/domain/repository/db_repository.dart';

class DbRepositoryImpl extends DbRepository {
  UserDatabaseImpl userDb;

  DbRepositoryImpl({required this.userDb});

  @override
  Future add(User user) {
    final model = UserMapper.toUserModel(user);
    return userDb.add(model);
  }

  @override
  Future<List<User>> getUsers() async {
    final _habitsModel = await userDb.getUsers();
    final _habits = UserMapper.toListUsers(_habitsModel);

    return _habits;
  }

  @override
  Future remove(int id) {
    return userDb.remove(id);
  }

  @override
  Future<int> update(User user) {
    final model = UserMapper.toUserModel(user);
    return userDb.update(model);
  }
}
