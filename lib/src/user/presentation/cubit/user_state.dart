part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial();
}

final class LoadingUserProfile extends UserState {
  const LoadingUserProfile();
}

final class UserProfileLoaded extends UserState {
  const UserProfileLoaded(this.userProfile);

  final UserProfile userProfile;

  @override
  List<Object> get props => [userProfile];
}

final class GetUserProfileFailed extends UserState {
  const GetUserProfileFailed(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class UpdatingUserProfile extends UserState {
  const UpdatingUserProfile();
}

final class UserProfileUpdated extends UserState {
  const UserProfileUpdated(this.userProfile);

  final UserProfile userProfile;

  @override
  List<Object> get props => [userProfile];
}

final class UpdateUserProfileFailed extends UserState {
  const UpdateUserProfileFailed(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class LoadingBookingHistory extends UserState {
  const LoadingBookingHistory();
}

final class BookingHistoryLoaded extends UserState {
  const BookingHistoryLoaded(this.bookingHistory);

  final List<Invoice> bookingHistory;

  @override
  List<Object> get props => [bookingHistory];
}

final class GetBookingHistoryFailed extends UserState {
  const GetBookingHistoryFailed(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
