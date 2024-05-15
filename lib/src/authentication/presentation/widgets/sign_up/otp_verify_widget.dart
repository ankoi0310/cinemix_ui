import 'package:cinemix_ui/core/common/views/circle_loading_view.dart';
import 'package:cinemix_ui/core/common/widgets/button_builder.dart';
import 'package:cinemix_ui/core/res/theme/custom/pin_theme.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OTPVerifyWidget extends StatefulWidget {
  const OTPVerifyWidget({super.key});

  @override
  State<OTPVerifyWidget> createState() => _OTPVerifyWidgetState();
}

class _OTPVerifyWidgetState extends State<OTPVerifyWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is VerifyingAccount) {
          setState(() {
            _isLoading = true;
          });
        }
      },
      builder: (context, state) {
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
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                length: 6,
                validator: (s) {
                  if (s != null && s.length == 6) {
                    context.read<AuthenticationCubit>().verify(s);
                  }

                  return null;
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
            const SizedBox(height: 24),
            ButtonBuilder.fillButton(
              context,
              onPressed: _isLoading ? null : () {},
              child:
                  _isLoading ? const CircleLoading() : const Text('Xác nhận'),
            ),
            const SizedBox(height: 16),
            ButtonBuilder.cancelButton(
              context: context,
              onPressed: _isLoading ? null : () {},
              child: const Text('Quay lại'),
            ),
          ],
        );
      },
    );
  }
}
