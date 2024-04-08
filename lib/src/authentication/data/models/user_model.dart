import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class UserProfile extends Equatable {
  const UserProfile({
    required this.fullName,
    required this.email,
    required this.phone,
    // required this.gender,
    required this.birthday,
  });

  UserProfile.fromMap(DataMap map)
      : fullName = map['fullName'] as String,
        email = map['email'] as String,
        phone = map['phone'] as String,
        // gender = map['gender'] as String,
        birthday = DateFormat('dd-MM-yyyy').parse(map['birthday'] as String);

  UserProfile.empty()
      : fullName = '',
        email = '',
        phone = '',
        // gender = '',
        birthday = DateTime.now();

  final String fullName;
  final String email;
  final String phone;
  // final String gender;
  final DateTime birthday;

  DataMap toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'birthday': DateFormat('dd-MM-yyyy').format(birthday),
    };
  }

  @override
  List<Object?> get props => [fullName, email, phone, birthday];
}
