import 'package:cinemix_ui/core/common/views/circle_loading_view.dart';
import 'package:cinemix_ui/core/common/widgets/button_builder.dart';
import 'package:cinemix_ui/core/common/widgets/form_builder.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_model.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isLoading = false;
  bool _isSavePassword = false;
  bool _isObscure = true;
  int currentStep = 0;
  int? errorStep;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  void initState() {
    context.read<AuthenticationCubit>().loadingSavePassword();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SigningIn) {
          setState(() {
            _isLoading = true;
          });
        }

        if (state is SignInSuccess) {
          setState(() {
            _isLoading = false;
          });

          if (_isSavePassword) {
            context.read<AuthenticationCubit>().savePassword(
                  password: _passwordController.text,
                );
          }

          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        }

        if (state is SignInFailed) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

        if (state is SavePasswordStatus) {
          setState(() {
            _isSavePassword = state.isSave;
            _passwordController.text = state.savedPassword;
          });
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              'Chào mừng bạn trở lại 👋',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Hãy nhập thông tin đăng nhập của bạn để tiếp tục!',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 24),
            FormBuilder.username(
              controller: _usernameController,
              focusNode: _usernameFocusNode,
              onFieldSubmitted: _passwordFocusNode.requestFocus,
            ),
            const SizedBox(height: 20),
            FormBuilder.password(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              isObscure: _isObscure,
              toggleObscure: _toggleObscure,
              onFieldSubmitted: handleSignIn,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isSavePassword,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onChanged: (value) {
                          if (_isSavePassword) {
                            context
                                .read<AuthenticationCubit>()
                                .removeSavedPassword();
                          }
                          context
                              .read<AuthenticationCubit>()
                              .setSavePassword(value: value ?? false);
                          setState(() {
                            _isSavePassword = value ?? false;
                          });
                        },
                      ),
                      const Text('Lưu mật khẩu'),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ButtonBuilder.fillButton(
              context,
              onPressed: _isLoading ? null : handleSignIn,
              child: _isLoading
                  ? const CircleLoading(color: Colors.white)
                  : const Text('Đăng nhập'),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  void handleSignIn() {
    if (_formKey.currentState!.validate()) {
      final params = SignInRequest(
        username: _usernameController.text,
        password: _passwordController.text,
      );

      context.read<AuthenticationCubit>().signIn(params);
    }
  }
}
