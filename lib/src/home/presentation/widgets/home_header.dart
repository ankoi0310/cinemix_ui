import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  if (state is GetSignInInfoSuccess) {
                    return Text.rich(
                      TextSpan(
                        text: 'Xin chào, ',
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          TextSpan(
                            text: state.signInInfo.welcomeName,
                            style: const TextStyle(
                              color: KAppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            children: const [
                              WidgetSpan(child: SizedBox(width: 4)),
                              TextSpan(text: '👋'),
                            ],
                          ),
                        ],
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
              Text(
                'Chào mừng trở lại!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const Icon(IconsaxPlusBold.notification),
        ],
      ),
    );
  }
}
