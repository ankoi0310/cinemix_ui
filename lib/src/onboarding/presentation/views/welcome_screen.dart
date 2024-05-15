import 'package:cinemix_ui/src/authentication/presentation/views/sign_in_screen.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_up_screen.dart';
import 'package:cinemix_ui/src/onboarding/presentation/widgets/welcome_body.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const routeName = '/welcome';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 16,
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          title: FittedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'CINEMIX',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Quyền riêng tư'.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(SignInScreen.routeName);
                  },
                  child: Text(
                    'Đăng nhập'.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SignUpScreen.routeName);
              },
              icon: const Icon(IconsaxPlusLinear.info_circle),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: const WelcomeBody(),
      ),
    );
  }
}
