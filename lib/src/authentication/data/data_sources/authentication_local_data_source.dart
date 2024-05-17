import 'dart:convert';

import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/authentication/data/models/sign_in_model.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:shared_preferences/shared_preferences.dart';

final key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1');
final iv = encrypt.IV.fromLength(16);

abstract class AuthenticationLocalDataSource {
  const AuthenticationLocalDataSource();

  Future<void> setSignInInfo(SignInInfo signInResponse);
  Future<bool> isSignedIn();
  Future<SignInInfo> getSignInInfo();
  Future<void> signOut();
  Future<void> setSavePassword({required bool value});
  Future<bool> isSavePassword();
  Future<void> savePassword(String password);
  Future<String> getSavedPassword();
  Future<void> removeSavedPassword();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  const AuthenticationLocalDataSourceImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> setSignInInfo(SignInInfo signInResponse) async {
    await _sharedPreferences.setBool('isSignedIn', true);

    // encode the SignInInfo object to a json string
    final map = signInResponse.toMap();
    final jsonString = utf8.encode(jsonEncode(map));

    // save the json string to shared preferences
    await _sharedPreferences.setString('signInInfo', base64Encode(jsonString));
  }

  @override
  Future<bool> isSignedIn() async {
    return _sharedPreferences.containsKey('isSignedIn');
  }

  @override
  Future<SignInInfo> getSignInInfo() async {
    final jsonString = _sharedPreferences.getString('signInInfo');
    final decodedJson = base64Decode(jsonString!);
    final decodedString = utf8.decode(decodedJson);
    final map = jsonDecode(decodedString) as DataMap;

    return SignInInfo.fromMap(map);
  }

  @override
  Future<void> signOut() async {
    await _sharedPreferences.remove('isSignedIn');
    await _sharedPreferences.remove('signInInfo');
  }

  @override
  Future<void> setSavePassword({required bool value}) async {
    await _sharedPreferences.setBool('savePassword', value);
  }

  @override
  Future<bool> isSavePassword() async {
    if (!_sharedPreferences.containsKey('savePassword')) {
      return false;
    }

    return _sharedPreferences.getBool('savePassword') ?? false;
  }

  @override
  Future<void> savePassword(String password) async {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encryptedPassword = encrypter.encrypt(password, iv: iv);
    await _sharedPreferences.setString('password', encryptedPassword.base64);
  }

  @override
  Future<String> getSavedPassword() async {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encryptedPassword = _sharedPreferences.getString('password');

    if (encryptedPassword == null) {
      return '';
    }

    return encrypter.decrypt64(encryptedPassword, iv: iv);
  }

  @override
  Future<void> removeSavedPassword() async {
    if (_sharedPreferences.containsKey('password')) {
      await _sharedPreferences.remove('password');
    }
  }
}
