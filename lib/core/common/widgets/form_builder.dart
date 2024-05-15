import 'package:cinemix_ui/core/shared/utils/app_util.dart';
import 'package:flutter/material.dart';

class FormBuilder {
  static TextFormField fullName({
    required TextEditingController controller,
    required FocusNode focusNode,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(
        labelText: 'Họ tên',
        hintText: 'Họ và tên của bạn',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Hãy nhập họ tên của bạn';
        }
        return null;
      },
    );
  }

  static TextFormField phoneNumber({
    required TextEditingController controller,
    required FocusNode focusNode,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(
        labelText: 'Số điện thoại',
        hintText: 'Số điện thoại của bạn là...',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Hãy nhập số điện thoại của bạn';
        }

        if (!AppUtil.isPhoneNumber(value)) {
          return 'Số điện thoại không hợp lệ';
        }
        return null;
      },
    );
  }

  static TextFormField email({
    required TextEditingController controller,
    required FocusNode focusNode,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Hãy nhập email của bạn';
        }

        if (!AppUtil.isEmail(value)) {
          return 'Email không hợp lệ';
        }
        return null;
      },
    );
  }

  static TextFormField password({
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool isObscure,
    required void Function() toggleObscure,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: 'Mật khẩu',
        suffixIcon: IconButton(
          icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
          onPressed: toggleObscure,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Hãy nhập mật khẩu của bạn';
        }
        return null;
      },
    );
  }

  static TextFormField confirmPassword({
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required FocusNode focusNode,
  }) {
    return TextFormField(
      controller: confirmPasswordController,
      focusNode: focusNode,
      decoration: const InputDecoration(labelText: 'Xác nhận mật khẩu'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui lòng nhập lại mật khẩu';
        }
        if (value != passwordController.text) {
          return 'Mật khẩu không khớp';
        }
        return null;
      },
    );
  }

  static TextFormField username({
    required TextEditingController controller,
    required FocusNode focusNode,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(labelText: 'Email hoặc số điện thoại'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Hãy nhập email hoặc số điện thoại của bạn';
        }

        if (!AppUtil.isEmail(value) && !AppUtil.isPhoneNumber(value)) {
          return 'Dữ liệu không hợp lệ';
        }
        return null;
      },
    );
  }
}
