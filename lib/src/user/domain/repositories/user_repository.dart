import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/user/data/models/user_profile.dart';

abstract class UserRepository {
  ResultFuture<UserProfile> getProfile();
  ResultFuture<UserProfile> updateProfile(UserProfileRequest params);
}
