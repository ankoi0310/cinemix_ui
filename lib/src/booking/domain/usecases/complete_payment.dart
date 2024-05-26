import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/booking/domain/repositories/booking_repository.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';

class CompletePayment extends UsecaseWithParams<Invoice, int> {
  const CompletePayment(this._repository);

  final BookingRepository _repository;

  @override
  ResultFuture<Invoice> call(int params) async {
    return _repository.completePayment(params);
  }
}
