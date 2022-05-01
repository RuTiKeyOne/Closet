import 'package:closet/core/inherit/authorization_model.dart';
import 'package:closet/presentation/authorization/autorization_view.dart';
import 'package:flutter/material.dart';
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
      ),
      child: const AuthorizationView(),
    );
  }
}
