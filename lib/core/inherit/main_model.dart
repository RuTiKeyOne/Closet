import 'package:closet/core/BLoC/cubit/chat_cubit/chat_cubit.dart';
import 'package:closet/core/domain/model/message.dart';
import 'package:closet/core/domain/model/order.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/navigation/route.dart' as navigation;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';

class MainModel extends ChangeNotifier {
  final ChatCubit chatCubit;

  MainModel(this.chatCubit);

  void openMapsSheet(BuildContext context) async {
    final coords = Coords(54.716823, 20.367838);
    final title = S.of(context).closet;
    final availableMaps = await MapLauncher.installedMaps;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  for (var map in availableMaps)
                    ListTile(
                      onTap: () {
                        map.showMarker(coords: coords, title: title);
                        Navigator.of(context).pop();
                      },
                      title: Text(
                        map.mapName,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            color:
                                Theme.of(context).textTheme.headline4!.color),
                      ),
                      leading: SvgPicture.asset(
                        map.icon,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void openChat(BuildContext context) {
    if (chatCubit.state is ChatView) {
      final state = (chatCubit.state as ChatView);
      final List<Message> messages = state.messages ?? [];
      if (messages.isEmpty) {
        chatCubit.emitNewMessage(
            state,
            Message(
                isUserMessage: false, message: S.of(context).welcome_message));
      }
    }
    Navigator.of(context).pushNamed(getIt.get<navigation.Chat>().route);
  }

  void openNewOrder(BuildContext context, User user) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        getIt.get<navigation.NewOrder>().route, (Route<dynamic> route) => false,
        arguments: user);
  }

  void openOrders(BuildContext context, User user) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        getIt.get<navigation.Orders>().route, (Route<dynamic> route) => false,
        arguments: user);
  }
}
