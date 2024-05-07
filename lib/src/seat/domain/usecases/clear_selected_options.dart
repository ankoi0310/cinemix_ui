import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/seat/domain/repositories/ticket_price_repository.dart';

class ClearSelectedOptions extends UsecaseWithoutParams<void> {
  ClearSelectedOptions(this.repository);

  final TicketPriceRepository repository;

  @override
  VoidFuture call() {
    return repository.clearSelectedOptions();
  }
}
