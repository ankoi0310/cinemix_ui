import 'package:cinemix_ui/core/common/widgets/button_builder.dart';
import 'package:cinemix_ui/core/common/widgets/form_builder.dart';
import 'package:flutter/material.dart';

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

  bool _isObscure = true;
  int currentStep = 0;
  int? errorStep;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
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
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormBuilder.username(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                ),
                const SizedBox(height: 20),
                FormBuilder.password(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  isObscure: _isObscure,
                  toggleObscure: _toggleObscure,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            value: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (value) {},
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text('Đăng nhập'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
