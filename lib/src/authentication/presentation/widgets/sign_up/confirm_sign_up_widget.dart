import 'package:cinemix_ui/core/res/theme/custom/pin_theme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class ConfirmSignUp extends StatefulWidget {
  const ConfirmSignUp({super.key});

  @override
  State<ConfirmSignUp> createState() => _ConfirmSignUpState();
}

class _ConfirmSignUpState extends State<ConfirmSignUp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Xác thực OTP',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Pinput(
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            validator: (s) {
              return s == '2222' ? null : 'Pin is incorrect';
            },
            onCompleted: print,
          ),
        ),
        Text.rich(
          TextSpan(
            text: 'Bằng việc nhấn vào Xác nhận, bạn đã đồng ý với ',
            children: [
              TextSpan(
                text: 'Điều khoản sử dụng',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' và '),
              TextSpan(
                text: 'Chính sách bảo mật',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' của chúng tôi.'),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Xác nhận'),
        ),
      ],
    );
  }
}
