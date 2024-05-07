import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/seat/domain/repositories/ticket_price_repository.dart';

class GetSelectedOptions extends UsecaseWithoutParams<Map<int, int>> {
  const GetSelectedOptions(this._repository);

  final TicketPriceRepository _repository;

  @override
  ResultFuture<Map<int, int>> call() {
    return _repository.getSelectedOptions();
  }
}
