import 'package:cinemix_ui/core/common/views/circle_loading_view.dart';
import 'package:cinemix_ui/core/common/widgets/button_builder.dart';
import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/shared/constants/app_constant.dart';
import 'package:cinemix_ui/src/user/data/models/user_profile.dart';
import 'package:cinemix_ui/src/user/presentation/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProfileDetailBody extends StatelessWidget {
  const ProfileDetailBody({
    required this.userProfile,
    super.key,
  });

  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final fullNameController = TextEditingController(
      text: userProfile.fullName,
    );
    final phoneController = TextEditingController(
      text: userProfile.phone,
    );

    final fullNameFocusNode = FocusNode();
    final phoneFocusNode = FocusNode();

    void handleSaveChanges() {
      if (fullNameController.text == userProfile.fullName &&
          phoneController.text == userProfile.phone) {
        Navigator.pop(context);
        return;
      }

      if (formKey.currentState!.validate()) {
        final userProfileRequest = UserProfileRequest(
          fullName: fullNameController.text,
          phone: phoneController.text,
        );

        // update user profile
        context.read<UserCubit>().updateUserProfile(userProfileRequest);
      }
    }

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserProfileUpdated) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                '$kBaseAvatarUrl/${userProfile.email}',
                              ),
                            ),
                            Positioned(
                              bottom: -4,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: KAppColor.textColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  border: Border.all(width: 2),
                                ),
                                child: const Icon(
                                  IconsaxPlusLinear.edit_2,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Họ tên',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: fullNameController,
                        focusNode: fullNameFocusNode,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Email',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        initialValue: userProfile.email,
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          suffix: userProfile.emailVerified
                              ? const Icon(
                                  IconsaxPlusBold.tick_circle,
                                  color: KAppColor.successColor,
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Số điện thoại',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        controller: phoneController,
                        focusNode: phoneFocusNode,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          suffix: userProfile.phoneVerified
                              ? const Icon(
                                  IconsaxPlusBold.tick_circle,
                                  color: KAppColor.successColor,
                                )
                              : InkWell(
                                  onTap: () {
                                    // verify phone number
                                  },
                                  child: const Text(
                                    'Xác thực',
                                    style: TextStyle(
                                      color: KAppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: ButtonBuilder.fillButton(
                context,
                onPressed: handleSaveChanges,
                borderRadius: BorderRadius.circular(50),
                child: state is UpdatingUserProfile
                    ? const CircleLoading()
                    : Text(
                        'Lưu thay đổi',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: KAppColor.onPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
