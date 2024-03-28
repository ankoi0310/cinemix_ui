import 'package:cinemix_ui/core/shared/utils/typedefs.dart';

abstract class OnboardingRepository {
  const OnboardingRepository();

  ResultFuture<void> cacheFirstTime();

  ResultFuture<bool> isFirstTime();
}
