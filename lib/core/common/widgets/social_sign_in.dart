import 'package:cinemix_ui/core/common/widgets/social_button.dart';
import 'package:cinemix_ui/core/res/media/media.dart';
import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                child: const Divider(height: 40),
              ),
            ),
            Text(
              'Hoặc tiếp tục với',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                child: const Divider(height: 40),
              ),
            ),
          ],
        ),
        SocialButton(
          icon: KAppMedia.iconFacebook,
          text: 'Facebook',
          onPressed: () {},
        ),
        const SizedBox(height: 12),
        SocialButton(
          icon: KAppMedia.iconGoogle,
          text: 'Google',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
