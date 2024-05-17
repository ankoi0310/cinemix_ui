import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:cinemix_ui/src/user/domain/repositories/user_repository.dart';

class GetBookingHistory extends UsecaseWithoutParams<List<Invoice>> {
  GetBookingHistory(this._repository);

  final UserRepository _repository;

  @override
  ResultFuture<List<Invoice>> call() {
    return _repository.getBookingHistory();
  }
}
