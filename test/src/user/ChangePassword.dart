import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Đổi mật khẩu', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Đổi mật khẩu:',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Mật khẩu cũ',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'mật khẩu mới',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'xác nhận mật khẩu',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
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
                padding: EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChangePassword(),
  ));
}
