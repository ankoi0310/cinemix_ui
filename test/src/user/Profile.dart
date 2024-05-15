import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final email =  'not yet provided';
    final birthdate =  'not yet provided';
    final address =  'not yet provided';
    final phone =  'not yet provided';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trang cá nhân',
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {

            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'doi_mat_khau',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Đổi mật khẩu'),
                ),
              ),
              // Thêm các mục tùy chọn khác nếu cần
            ],
          ),
        ],
      ),
      // Body of Scaffold where the rest of your UI would be defined
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: const Image(
                    image: AssetImage('images/Account-User-PNG.png'),
                  ),
                ),
              ), // SizedBox
              const SizedBox(height: 10),
              Text(
                email,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16.0,
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: 200,

              ), // SizedBox
              const SizedBox(height: 30),
              const Divider(),
              // ... more widgets might follow
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0), // Added vertical padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Email :',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    SizedBox(width: 18), // You can add a SizedBox for additional spacing between the label and the email
                    Text(
                      email,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0), // Added vertical padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Tên người dùng :',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    SizedBox(width: 18), // You can add a SizedBox for additional spacing between the label and the email
                    Text(
                      birthdate,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0), // Added vertical padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Addrress :',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    SizedBox(width: 18), // You can add a SizedBox for additional spacing between the label and the email
                    Text(
                      address,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0), // Added vertical padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text(
                      'Number phone:',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    SizedBox(width: 18), // You can add a SizedBox for additional spacing between the label and the email
                    Text(
                      phone,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16.0,
                      ),
                    ),

                  ],

                ),
              ),
              const SizedBox(height: 50),
              // LogOut(onTap: logout ),
            ],
          ),
        ),
      ), // SingleChildScrollView

    );
  }



}
void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}