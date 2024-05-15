import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:shared_preferences/shared_preferences.dart';

final key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1');
final iv = encrypt.IV.fromLength(16);

abstract class AuthenticationLocalDataSource {
  Future<void> setSignIn();
  Future<bool> isSignedIn();
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
  Future<void> setSignIn() async {
    await _sharedPreferences.setBool('isSignedIn', true);
  }

  @override
  Future<bool> isSignedIn() async {
    return _sharedPreferences.containsKey('isSignedIn');
  }

  @override
  Future<void> signOut() async {
    await _sharedPreferences.remove('isSignedIn');
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
    await _sharedPreferences.remove('password');
  }
}
