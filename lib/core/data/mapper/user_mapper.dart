import 'package:closet/core/data/model/order_model.dart';
import 'package:closet/core/data/model/user_model.dart';
import 'package:closet/core/domain/enums/order_enums.dart';
import 'package:closet/core/domain/model/order.dart';
import 'package:closet/core/domain/model/user.dart';

class UserMapper {
  static User toUser(UserModel model) {
    return User(
      id: model.id,
      login: model.login,
      password: model.password,
      email: model.email,
      telephone: model.telephone,
      orders: model.orders
          ?.map((e) => Order(
                id: e.id,
                weekValue: e.weekValue,
                typeDelivery:
                    typeOfDeliveryToTheWarehouse.values[e.typeDeliveryIndex],
                typeWarehouse: warehouseType.values[e.typeWarehouseIndex],
                sizeValue: e.sizeValue,
                cost: e.cost,
                typeOrder: orderType.values[e.typeOrderIndex],
                status: orderStatus.values[e.statusIndex],
                contractFileName: e.contractFileName,
                contractPath: e.contractPath,
              ))
          .toList(),
    );
  }

  static UserModel toUserModel(User user) {
    return UserModel(
      id: user.id,
      login: user.login,
      password: user.password,
      email: user.email,
      telephone: user.telephone,
      orders: user.orders
          ?.map((e) => OrderModel(
                id: e.id,
                typeDeliveryIndex: e.typeDelivery.index,
                typeWarehouseIndex: e.typeWarehouse.index,
                sizeValue: e.sizeValue,
                weekValue: e.weekValue,
                cost: e.cost,
                typeOrderIndex: e.typeOrder.index,
                statusIndex: e.status.index,
                contractFileName: e.contractFileName,
                contractPath: e.contractPath,
              ))
          .toList(),
    );
  }

  static List<User> toListUsers(List<UserModel> list) {
    return list
        .map((e) => User(
              id: e.id,
              login: e.login,
              password: e.password,
              email: e.email,
              telephone: e.telephone,
              orders: e.orders
                  ?.map((e) => Order(
                        id: e.id,
                        weekValue: e.weekValue,
                        typeDelivery: typeOfDeliveryToTheWarehouse
                            .values[e.typeDeliveryIndex],
                        typeWarehouse:
                            warehouseType.values[e.typeWarehouseIndex],
                        sizeValue: e.sizeValue,
                        cost: e.cost,
                        typeOrder: orderType.values[e.typeOrderIndex],
                        status: orderStatus.values[e.statusIndex],
                        contractFileName: e.contractFileName,
                        contractPath: e.contractPath,
                      ))
                  .toList(),
            ))
        .toList();
  }
}
