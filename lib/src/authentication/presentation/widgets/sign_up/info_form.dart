import 'package:cinemix_ui/core/common/widgets/button_builder.dart';
import 'package:cinemix_ui/core/common/widgets/form_builder.dart';
import 'package:flutter/material.dart';

class InfoForm extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController();
    final phoneNumberController = TextEditingController();

    final fullNameFocusNode = FocusNode();
    final phoneNumberFocusNode = FocusNode();

    return Column(
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
        ),
        const SizedBox(height: 16),
        FormBuilder.phoneNumber(
          controller: phoneNumberController,
          focusNode: phoneNumberFocusNode,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ButtonBuilder.cancelButton(
                context: context,
                onPressed: onPressedBack,
                child: Text('Quay lại'.toUpperCase()),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ButtonBuilder.fillButton(
                context,
                onPressed: () {
                  onPressed(
                    fullName: fullNameController.text,
                    phone: phoneNumberController.text,
                  );
                },
                child: Text('Xác nhận'.toUpperCase()),
              ),
            ),
          ],
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
