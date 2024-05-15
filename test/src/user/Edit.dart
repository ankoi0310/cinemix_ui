import 'dart:convert';

import 'package:board_datetime_picker/board_datetime_picker.dart';

import 'package:date_field/date_field.dart';
import 'package:date_picker_textfield/date_picker_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'Input.dart';

class Edit extends StatefulWidget {
  Edit({super.key});

  @override
  _RegsterState createState() => _RegsterState();
}

class _RegsterState extends State<Edit> {
  int _currentIndex = 0; // Initial index for the bottom navigation
  final name = TextEditingController();
  final Address = TextEditingController();
  final numberphone = TextEditingController();
  final textController = BoardDateTimeTextController();
  String success = '';
  String passwordError = '';
  String conPasswordError = '';
  DateTime? selectedDate;
  String registrationMessage = '';
  TextEditingController date = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Your custom action, e.g., navigate to a desired page
          },
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // Add this line to prevent Column from stretching
              children: [
                Icon(
                  Icons.edit,
                  size: 100,
                  color: Colors.yellow,
                ),
                const SizedBox(height: 30),
                Text(
                  'Chỉnh sửa hồ sơ cá nhân',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 20),
                if (success.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        success,
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                    ),
                  ),
                Input(
                  controller: name,
                  hintText: 'Tên người dùng',
                  obscureText: false,
                ),
                const SizedBox(height: 40),
                Input(
                  controller: Address,
                  hintText: 'địa chỉ',
                  obscureText: false,
                ),
                const SizedBox(height: 40),
                Container(
                  width: 370,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow), // Màu viền vàng
                    borderRadius: BorderRadius.circular(5), // Định dạng viền
                  ),
                  child: Theme(
                    data: ThemeData(
                      textTheme: TextTheme(
                        bodyText1: TextStyle(color: Colors.white), // Màu chữ trắng
                      ),
                    ),
                    child: DatePicker(
                      type: MyDatePickerFieldTypes.all,
                      controller: date,
                      context: context,
                      label: 'Due Date',
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      numberphone.text = phone.completeNumber;
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút
                  },
                  child: Text('Xác nhận'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    textStyle: TextStyle(fontSize: 16.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    // Tăng giá trị cho chiều ngang (horizontal)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Edit(),
  ));
}
