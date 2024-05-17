import 'package:cinemix_ui/core/shared/utils/app_util.dart';
import 'package:flutter/material.dart';

class FormBuilder {
  static TextFormField fullName({
    required TextEditingController controller,
    required FocusNode focusNode,
    required void Function() onFieldSubmitted,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(
        labelText: 'Họ tên',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Hãy nhập họ tên của bạn';
        }
        return null;
      },
      onFieldSubmitted: (_) => onFieldSubmitted(),
    );
  }

  static TextFormField phoneNumber({
    required TextEditingController controller,
    required FocusNode focusNode,
    required void Function() onFieldSubmitted,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(
        labelText: 'Số điện thoại',
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
      onFieldSubmitted: (_) => onFieldSubmitted(),
    );
  }

  static TextFormField email({
    required TextEditingController controller,
    required FocusNode focusNode,
    required void Function() onFieldSubmitted,
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
      onFieldSubmitted: (_) => onFieldSubmitted(),
    );
  }

  static TextFormField password({
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool isObscure,
    required void Function() toggleObscure,
    required void Function() onFieldSubmitted,
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
      onFieldSubmitted: (_) => onFieldSubmitted(),
    );
  }

  static TextFormField username({
    required TextEditingController controller,
    required FocusNode focusNode,
    required void Function() onFieldSubmitted,
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
      onFieldSubmitted: (_) => onFieldSubmitted(),
    );
  }
}
