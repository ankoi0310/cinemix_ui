import 'package:cinemix_ui/src/authentication/domain/usecases/sign_up.dart';
import 'package:cinemix_ui/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:cinemix_ui/src/authentication/presentation/widgets/sign_up/account_form.dart';
import 'package:cinemix_ui/src/authentication/presentation/widgets/sign_up/info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  SignUpParams signUpParams = const SignUpParams.empty();

  bool _switchToInfoForm = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _switchToInfoForm
            ? InfoForm(
                onPressed: ({
                  required String fullName,
                  required String phone,
                }) {
                  if (_formKey.currentState!.validate()) {
                    signUpParams = signUpParams.copyWith(
                      fullName: fullName,
                      phone: phone,
                    );

                    context.read<AuthenticationCubit>().signUp(signUpParams);
                  }
                },
                onPressedBack: () {
                  setState(() {
                    _switchToInfoForm = false;
                  });
                },
              )
            : AccountForm(
                onPressed: ({
                  required String email,
                  required String password,
                }) {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _switchToInfoForm = true;
                    });

                    signUpParams = signUpParams.copyWith(
                      email: email,
                      password: password,
                    );
                  }
                },
              ),
      ),
    );
  }
}
