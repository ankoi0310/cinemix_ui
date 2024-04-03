import 'package:cinemix_ui/core/common/widgets/form_builder.dart';
import 'package:cinemix_ui/core/shared/enums/message_type.dart';
import 'package:cinemix_ui/src/authentication/presentation/widgets/sign_up/confirm_sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _infoFormKey = GlobalKey<FormState>();
  final _accountFormKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _fullNameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  FToast fToast = FToast();
  bool _isObscure = true;
  int currentStep = 0;
  int? errorStep;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _showToast(String message, MessageType type) {
    final Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check),
          const SizedBox(width: 12),
          Text(message),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepTapped: (step) {
              setState(() {
                currentStep = step;
              });
            },
            // onStepContinue: () {
            //   switch (currentStep) {
            //     case 0:
            //       if (_infoFormKey.currentState!.validate()) {
            //         setState(() {
            //           currentStep += 1;
            //         });
            //       } else {
            //         _showToast(
            //           'Vui lòng điền đầy đủ thông tin',
            //           MessageType.error,
            //         );
            //         setState(() {
            //           errorStep = currentStep;
            //         });
            //       }
            //     case 1:
            //       if (_accountFormKey.currentState!.validate()) {
            //         setState(() {
            //           currentStep += 1;
            //         });
            //       } else {
            //         _showToast(
            //             'Vui lòng điền đầy đủ thông tin', MessageType.error);
            //         setState(() {
            //           errorStep = currentStep;
            //         });
            //       }
            //     case 2:
            //       // check otp
            //       _showToast(
            //         'Đăng ký thành công',
            //         MessageType.success,
            //       );
            //   }
            // },
            // onStepCancel: () {
            //   if (currentStep > 0) {
            //     setState(() {
            //       currentStep -= 1;
            //     });
            //   }
            // },
            // onStepTapped: (step) {
            //   if (step < currentStep) {
            //     setState(() {
            //       currentStep = step;
            //     });
            //   } else {
            //     switch (currentStep) {
            //       case 0:
            //         if (_infoFormKey.currentState!.validate()) {
            //           setState(() {
            //             currentStep = step;
            //           });
            //         } else {
            //           _showToast(
            //             'Vui lòng điền đầy đủ thông tin',
            //             MessageType.error,
            //           );
            //           setState(() {
            //             errorStep = currentStep;
            //           });
            //         }
            //       case 1:
            //         if (_accountFormKey.currentState!.validate()) {
            //           setState(() {
            //             currentStep = step;
            //           });
            //         } else {
            //           _showToast(
            //             'Vui lòng điền đầy đủ thông tin',
            //             MessageType.error,
            //           );
            //           setState(() {
            //             errorStep = currentStep;
            //           });
            //         }
            //       case 2:
            //         // check otp
            //         _showToast(
            //           'Đăng ký thành công',
            //           MessageType.success,
            //         );
            //     }
            //   }
            // },
            steps: getSteps(),
          ),
        ),
      ],
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        state: currentStep == 0 ? StepState.editing : StepState.complete,
        isActive: currentStep >= 0,
        title: Text(
          'Thông tin',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        content: Form(
          key: _infoFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilder.fullName(
                controller: _fullNameController,
                focusNode: _fullNameFocusNode,
              ),
              const SizedBox(height: 20),
              FormBuilder.phoneNumber(
                controller: _phoneController,
                focusNode: _phoneFocusNode,
              ),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep < 1
            ? StepState.indexed
            : currentStep == 1
                ? StepState.editing
                : StepState.complete,
        isActive: currentStep >= 1,
        title: Text(
          'Tài khoản',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        content: Form(
          key: _accountFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilder.email(
                controller: _emailController,
                focusNode: _emailFocusNode,
              ),
              const SizedBox(height: 20),
              FormBuilder.password(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                isObscure: _isObscure,
                toggleObscure: _toggleObscure,
              ),
              const SizedBox(height: 20),
              FormBuilder.confirmPassword(
                passwordController: _passwordController,
                confirmPasswordController: _confirmPasswordController,
                focusNode: _confirmPasswordFocusNode,
              ),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep < 2
            ? StepState.indexed
            : currentStep == 2
                ? StepState.editing
                : StepState.complete,
        isActive: currentStep >= 2,
        title: Text(
          'Xác nhận',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        content: const ConfirmSignUp(),
      ),
    ];
  }
}
