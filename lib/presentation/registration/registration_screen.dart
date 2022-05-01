import 'package:closet/core/inherit/registraction_model.dart';
import 'package:closet/generated/l10n.dart';
import 'package:closet/presentation/registration/registration_view.dart';
import 'package:flutter/material.dart';
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
        child: const RegistrationView());
  }
}
