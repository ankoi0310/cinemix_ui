import 'package:cinemix_ui/core/common/views/circle_loading_view.dart';
import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/onboarding/presentation/views/welcome_screen.dart';
import 'package:cinemix_ui/src/user/presentation/cubit/user_cubit.dart';
import 'package:cinemix_ui/src/user/presentation/views/profile_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserProfileUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cập nhật thông tin thành công'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingUserProfile) {
          return const CircleLoading();
        }

        if (state is GetUserProfileFailed) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is UserProfileLoaded || state is UserProfileUpdated) {
          final userProfile = (state is UserProfileLoaded)
              ? state.userProfile
              : (state as UserProfileUpdated).userProfile;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          '$kBaseAvatarUrl/${userProfile.email}',
                        ),
                      ),
                      Positioned(
                        bottom: -4,
                        right: 6,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: KAppColor.textColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            border: Border.all(width: 2),
                          ),
                          child: const Icon(
                            IconsaxPlusLinear.edit_2,
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    userProfile.fullName,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        IconsaxPlusLinear.award,
                        color: KAppColor.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        userProfile.role,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: KAppColor.primaryColor,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      buildMenuItem(
                        context,
                        title: 'Thông tin cá nhân',
                        iconLeading: IconsaxPlusLinear.user,
                        iconTrailing: IconsaxPlusLinear.arrow_right_3,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProfileDetailScreen.routeName,
                            arguments: {
                              'userProfile': userProfile,
                              'userCubit': context.read<UserCubit>(),
                            },
                          );
                        },
                      ),
                      buildMenuItem(
                        context,
                        title: 'Cài đặt',
                        iconLeading: IconsaxPlusLinear.setting_2,
                        iconTrailing: IconsaxPlusLinear.arrow_right_3,
                        onTap: () {},
                      ),
                      buildMenuItem(
                        context,
                        title: 'Trợ giúp',
                        iconLeading: IconsaxPlusLinear.info_circle,
                        iconTrailing: IconsaxPlusLinear.arrow_right_3,
                        onTap: () {},
                      ),
                      buildMenuItem(
                        context,
                        title: 'Chính sách và quyền riêng tư',
                        iconLeading: IconsaxPlusLinear.lock_1,
                        iconTrailing: IconsaxPlusLinear.arrow_right_3,
                        onTap: () {},
                      ),
                      buildMenuItem(
                        context,
                        title: 'Đăng xuất',
                        iconLeading: IconsaxPlusLinear.logout_1,
                        iconTrailing: IconsaxPlusLinear.arrow_right_3,
                        onTap: () {
                          context
                              .read<AuthenticationCubit>()
                              .signOut()
                              .then((_) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              WelcomeScreen.routeName,
                              (route) => false,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  Container buildMenuItem(
    BuildContext context, {
    required String title,
    required IconData iconLeading,
    required IconData iconTrailing,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: KAppColor.textColor.withOpacity(0.2),
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        leading: Icon(
          iconLeading,
          color: KAppColor.textColor,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: Icon(
          iconTrailing,
          color: KAppColor.textColor,
        ),
      ),
    );
  }
}
