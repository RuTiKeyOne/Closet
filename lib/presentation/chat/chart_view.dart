import 'package:closet/core/BLoC/cubit/chat_cubit/chat_cubit.dart' as cubit;
import 'package:closet/core/domain/model/message.dart';
import 'package:closet/core/inherit/chat_model.dart';
import 'package:closet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:closet/core/BLoC/cubit/chat_cubit/chat_cubit.dart' as cubit;

class ChatView extends StatelessWidget {
  final cubit.ChatView state;
  const ChatView({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatModel>();
    return WillPopScope(
      onWillPop: () async {
        model.backOnPressed(context, state);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topCenter,
                colors: [
                  Theme.of(context).primaryColorDark,
                  Theme.of(context).primaryColorLight,
                ],
              ),
            ),
            child: Column(
              children: [
                Material(
                  elevation: 4,
                  child: Container(
                    color: Theme.of(context).primaryColorLight,
                    height: 65,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () =>
                                model.backOnPressed(context, state),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 26,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(7.5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/support_chat.svg",
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(S.of(context).support_chat,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontSize: 24)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.messages?.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 20),
                        child: Align(
                          alignment: state.messages![index].isUserMessage
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            constraints: const BoxConstraints(maxWidth: 300),
                            child: Text(
                              state.messages![index].message,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                          child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: model.messageController,
                              onChanged: (value) => model.message = value,
                              cursorColor: Theme.of(context).primaryColorLight,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 18,
                                  ),
                              decoration: InputDecoration(
                                hintText: S.of(context).message,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .color,
                                      fontSize: 18,
                                    ),
                                isDense: true,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            iconSize: 32,
                            icon: const Icon(Icons.send),
                            onPressed: () => model.sendMessage(context, state),
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ],
                      )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
