import 'package:cinemix_ui/core/common/widgets/button_builder.dart';
import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  static const routeName = '/sign-up-success';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                IconsaxPlusLinear.tick_circle,
                size: 100,
                color: KAppColor.primaryColor,
              ),
              const SizedBox(height: 16),
              Text(
                'Đăng ký thành công',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Chúc mừng bạn đã đăng ký thành công tài khoản! Hãy đăng nhập để trải nghiệm ngay nhé!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              ButtonBuilder.fillButton(
                context,
                onPressed: () {
                  Navigator.of(context).pushNamed(SignInScreen.routeName);
                },
                child: const Text('Đăng nhập ngay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
