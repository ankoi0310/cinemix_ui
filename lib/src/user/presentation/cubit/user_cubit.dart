import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/user/data/models/user_profile.dart';
import 'package:cinemix_ui/src/user/domain/usecases/get_user_profile.dart';
import 'package:cinemix_ui/src/user/domain/usecases/update_user_profile.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required GetUserProfile getUserProfile,
    required UpdateUserProfile updateUserProfile,
  })  : _getUserProfile = getUserProfile,
        _updateUserProfile = updateUserProfile,
        super(const UserInitial());

  final GetUserProfile _getUserProfile;
  final UpdateUserProfile _updateUserProfile;

  Future<void> getUserProfile() async {
    emit(const LoadingUserProfile());
    final result = await _getUserProfile();

    result.fold(
      (l) => emit(GetUserProfileFailed(l.message)),
      (r) => emit(UserProfileLoaded(r)),
    );
  }

  Future<void> updateUserProfile(UserProfileRequest params) async {
    emit(const UpdatingUserProfile());
    final result = await _updateUserProfile(params);

    result.fold(
      (l) => emit(UpdateUserProfileFailed(l.message)),
      (r) => emit(UserProfileUpdated(r)),
    );
  }
}
