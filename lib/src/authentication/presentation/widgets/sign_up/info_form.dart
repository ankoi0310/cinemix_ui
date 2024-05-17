import 'package:cinemix_ui/core/common/views/circle_loading_view.dart';
import 'package:cinemix_ui/core/common/widgets/button_builder.dart';
import 'package:cinemix_ui/core/common/widgets/form_builder.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/otp_verify_screen.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/sign_up_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoForm extends StatefulWidget {
  const InfoForm({
    required this.onPressed,
    required this.onPressedBack,
    super.key,
  });

  final void Function({
    required String fullName,
    required String phone,
  }) onPressed;
  final void Function() onPressedBack;

  @override
  State<InfoForm> createState() => _InfoFormState();
}

class _InfoFormState extends State<InfoForm> {
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final fullNameFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fullNameFocusNode.requestFocus();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    fullNameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SigningUp) {
          setState(() {
            _isLoading = true;
          });
        }

        if (state is SignUpSuccess) {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacementNamed(
            context,
            OTPVerifyScreen.routeName,
            arguments: SignUpSuccessScreen.routeName,
          );
        }

        if (state is SignUpFailed) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Text(
            'Chúng tôi muốn biết thêm về bạn 😍',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Hãy nhập họ tên và số điện thoại của bạn!',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 24),
          FormBuilder.fullName(
            controller: fullNameController,
            focusNode: fullNameFocusNode,
            onFieldSubmitted: phoneNumberFocusNode.requestFocus,
          ),
          const SizedBox(height: 16),
          FormBuilder.phoneNumber(
            controller: phoneNumberController,
            focusNode: phoneNumberFocusNode,
            onFieldSubmitted: () {
              widget.onPressed(
                fullName: fullNameController.text,
                phone: phoneNumberController.text,
              );
            },
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: ButtonBuilder.cancelButton(
                  context: context,
                  onPressed: _isLoading ? null : widget.onPressedBack,
                  child: Text('Quay lại'.toUpperCase()),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ButtonBuilder.fillButton(
                  context,
                  onPressed: _isLoading
                      ? null
                      : () => widget.onPressed(
                            fullName: fullNameController.text,
                            phone: phoneNumberController.text,
                          ),
                  child: _isLoading
                      ? const CircleLoading()
                      : Text('Xác nhận'.toUpperCase()),
                ),
              ),
            ],
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
