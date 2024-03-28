import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/onboarding/domain/repositories/onbroading_repository.dart';

class CacheFirstTime extends UsecaseWithoutParams<void> {
  const CacheFirstTime(this._repository);

  final OnboardingRepository _repository;

  @override
  ResultFuture<void> call() => _repository.cacheFirstTime();
}
