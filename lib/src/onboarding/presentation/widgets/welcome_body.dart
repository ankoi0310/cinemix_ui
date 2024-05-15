import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/res/media/media.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_up_screen.dart';
import 'package:flutter/material.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({super.key});

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: <Color>[
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            blendMode: BlendMode.darken,
            child: Image.asset(
              KAppMedia.welcome,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          left: 16,
          right: 16,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Tận hưởng trải nghiệm đặt vé phim nhanh chóng và tiện lợi',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: KAppColor.textColor,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 52),
                child: Text(
                  'Đặt vé ở mọi nơi, mọi lúc chỉ với vài thao tác đơn giản',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: KAppColor.textColor),
                ),
              ),
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  textStyle:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(SignUpScreen.routeName);
                },
                child: const Text('Bắt đầu ngay'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
