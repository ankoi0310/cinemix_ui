import 'package:cinemix_ui/core/common/widgets/app_bar.dart';
import 'package:cinemix_ui/core/common/widgets/custom_bottom_nav_bar.dart';
import 'package:cinemix_ui/src/user/presentation/cubit/user_cubit.dart';
import 'package:cinemix_ui/src/user/presentation/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUserProfile();
    return const SafeArea(
      child: Scaffold(
        appBar: KAppBar(title: 'Hồ sơ'),
        body: ProfileBody(),
        bottomNavigationBar: CustomBottomNavBar(
          currentRoute: routeName,
        ),
      ),
    );
  }
}
