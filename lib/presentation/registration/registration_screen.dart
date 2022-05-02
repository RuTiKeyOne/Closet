import 'package:closet/core/BLoC/cubit/registration_cubit/registration_cubit.dart'
    as cubit;
import 'package:closet/core/inherit/registraction_model.dart';
import 'package:closet/presentation/registration/registration_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RegistrationModel(
              "",
              TextEditingController(text: ""),
              "",
              TextEditingController(text: ""),
              GlobalKey<FormState>(),
            ),
        child: BlocBuilder<cubit.RegistrationCubit, cubit.RegistrationState>(
          builder: (context, state) {
            if (state is cubit.RegistrationView) {
              return RegistrationView(state: state);
            }
            return Container();
          },
        ));
  }
}
