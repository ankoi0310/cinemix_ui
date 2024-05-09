import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/seat/domain/repositories/ticket_price_repository.dart';
import 'package:equatable/equatable.dart';

class CacheSelectedOptions extends UsecaseWithParams<void, OptionsParams> {
  const CacheSelectedOptions(this._repository);

  final TicketPriceRepository _repository;

  @override
  VoidFuture call(OptionsParams params) {
    return _repository.cacheSelectedOptions(params);
  }
}

class OptionsParams extends Equatable {
  const OptionsParams({
    required this.ticketPriceId,
    required this.quantity,
  });

  final int ticketPriceId;
  final int quantity;

  @override
  List<Object?> get props => [ticketPriceId, quantity];
}
