import 'package:closet/core/BLoC/cubit/authorization_cubit/authorization_cubit.dart'
    as cubit;
import 'package:closet/core/inherit/authorization_model.dart';
import 'package:closet/presentation/authorization/autorization_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthorizationModel(
        "",
        TextEditingController(text: ""),
        "",
        TextEditingController(text: ""),
        GlobalKey<FormState>(),
        AutovalidateMode.disabled,
      ),
      child: BlocBuilder<cubit.AuthorizationCubit, cubit.AuthorizationState>(
        builder: (context, state) {
          if (state is cubit.AuthorizationView) {
            return AuthorizationView(state: state);
          }
          return Container();
        },
      ),
    );
  }
}
