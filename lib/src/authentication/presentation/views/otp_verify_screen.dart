import 'package:cinemix_ui/core/common/views/circle_loading_view.dart';
import 'package:cinemix_ui/core/common/widgets/button_builder.dart';
import 'package:cinemix_ui/core/res/theme/custom/pin_theme.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({required this.navigatorScreen, super.key});

  static const routeName = '/otp-verify';

  final String navigatorScreen;

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  String _otp = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is VerifyingOTP) {
          setState(() {
            _isLoading = true;
          });
        }

        if (state is OTPVerified) {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushNamedAndRemoveUntil(
            context,
            widget.navigatorScreen,
            (route) => false,
          );
        }

        if (state is OTPVerifyFailed) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
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
                    onChanged: (s) {
                      _otp = s;
                    },
                    onCompleted: (s) {
                      context.read<AuthenticationCubit>().verifyOTP(s);
                    },
                  ),
                ),
                const SizedBox(height: 24),
                ButtonBuilder.fillButton(
                  context,
                  onPressed: _isLoading ? null : handleVerifyOTP,
                  child: _isLoading
                      ? const CircleLoading()
                      : const Text('Xác nhận'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void handleVerifyOTP() {
    if (_otp.length < 6) {
      // alert dialog for invalid OTP
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mã OTP không hợp lệ!'),
        ),
      );
    } else {
      context.read<AuthenticationCubit>().verifyOTP(_otp);
    }
  }
}
