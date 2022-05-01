import 'package:closet/core/data/model/user_model.dart';
import 'package:closet/core/domain/model/user.dart';

class UserMapper {
  static User toUser(UserModel model) {
    return User(
      id: model.id,
      login: model.login,
      password: model.password,
    );
  }

  static UserModel toUserModel(User user) {
    return UserModel(id: user.id, login: user.login, password: user.password);
  }

  static List<User> toListUsers(List<UserModel> list) {
    return list
        .map((e) => User(id: e.id, login: e.login, password: e.password))
        .toList();
  }
}
