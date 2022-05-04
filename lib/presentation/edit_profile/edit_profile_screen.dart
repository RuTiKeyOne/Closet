import 'package:closet/core/BLoC/cubit/authorization_cubit/authorization_cubit.dart';
import 'package:closet/core/BLoC/cubit/edit_cubit/edit_cubit.dart';
import 'package:closet/core/domain/model/user.dart';
import 'package:closet/core/inherit/edit_profile_model.dart';
import 'package:closet/core/internal/db_di/db_controller.dart';
import 'package:closet/core/internal/locator.dart';
import 'package:closet/presentation/edit_profile/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return BlocBuilder<EditCubit, EditState>(
      builder: (context, state) {
        if (state is EditView) {
          return ChangeNotifierProvider(
            create: (context) => EditProfileModel(
              authorizationCubit: getIt.get<AuthorizationCubit>(),
              dbController: getIt.get<DbController>(),
              user: user,
              formKey: GlobalKey<FormState>(),
            ),
            child: EditProfileView(
              user: user,
              users: state.users,
            ),
          );
        }
        return Container();
      },
    );
  }
}
