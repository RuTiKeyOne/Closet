import 'package:closet/core/domain/model/user.dart';
import 'package:closet/presentation/profile/profile_view.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return ProfileView(
      user: user,
    );
  }
}
