import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/seat/domain/usecases/cache_selected_options.dart';

abstract class TicketPriceRepository {
  const TicketPriceRepository();

  VoidFuture cacheSelectedOptions(OptionsParams params);

  ResultFuture<Map<int, int>> getSelectedOptions();

  VoidFuture clearSelectedOptions();
}
