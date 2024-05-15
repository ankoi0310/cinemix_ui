import 'package:cinemix_ui/core/shared/utils/typedefs.dart';

abstract class OnboardingRepository {
  const OnboardingRepository();

  VoidFuture cacheFirstTime();

  ResultFuture<bool> isFirstTime();
}
