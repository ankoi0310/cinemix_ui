import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/onboarding/domain/repositories/onbroading_repository.dart';

class IsFirstTime extends UsecaseWithoutParams<bool> {
  const IsFirstTime(this._repository);

  final OnboardingRepository _repository;

  @override
  ResultFuture<bool> call() => _repository.isFirstTime();
}
