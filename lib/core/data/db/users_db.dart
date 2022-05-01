import 'package:closet/core/data/model/user_model.dart';

abstract class UserDatabase {
  Future<List<UserModel>> getUsers();

  Future<int> add(UserModel user);

  Future<int> remove(int id);

  Future<int> update(UserModel user);
}
