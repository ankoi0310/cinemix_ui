import 'package:cinemix_ui/core/common/widgets/app_bar.dart';
import 'package:cinemix_ui/src/user/data/models/user_profile.dart';
import 'package:cinemix_ui/src/user/presentation/widgets/profile_detail_body.dart';
import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({
    required this.userProfile,
    super.key,
  });

  static const routeName = '/profile-detail';

  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const KAppBar(title: 'Thông tin cá nhân'),
        resizeToAvoidBottomInset: false,
        body: ProfileDetailBody(userProfile: userProfile),
      ),
    );
  }
}
