import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/user/data/models/user_profile.dart';
import 'package:cinemix_ui/src/user/domain/repositories/user_repository.dart';

class GetUserProfile extends UsecaseWithoutParams<UserProfile> {
  const GetUserProfile(this._repository);

  final UserRepository _repository;

  @override
  ResultFuture<UserProfile> call() async {
    return _repository.getProfile();
  }
}
