import 'package:cinemix_ui/core/common/views/circle_loading_view.dart';
import 'package:cinemix_ui/core/common/widgets/button_builder.dart';
import 'package:cinemix_ui/core/common/widgets/form_builder.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({
    required this.onPressed,
    super.key,
  });

  final void Function({
    required String email,
    required String password,
  }) onPressed;

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isObscure = true;
  bool _isLoading = false;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SigningUp) {
          setState(() {
            _isLoading = true;
          });
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              'Bạn đã sẵn sàng để trải nghiệm chưa?',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Nhập email và mật khẩu để tạo tài khoản nhé!',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 24),
            FormBuilder.email(
              controller: _emailController,
              focusNode: _emailFocusNode,
              onFieldSubmitted: _passwordFocusNode.requestFocus,
            ),
            const SizedBox(height: 16),
            FormBuilder.password(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              isObscure: _isObscure,
              toggleObscure: _toggleObscure,
              onFieldSubmitted: () {
                widget.onPressed(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              },
            ),
            const SizedBox(height: 16),
            ButtonBuilder.fillButton(
              context,
              onPressed: () {
                widget.onPressed(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              },
              child: _isLoading
                  ? const CircleLoading()
                  : Text(
                      'Tiếp tục'.toUpperCase(),
                    ),
            ),
            const Spacer(flex: 2),
          ],
        );
      },
    );
  }
}
