import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/booking/data/models/payos_model.dart';

abstract class PayOSRepository {
  const PayOSRepository();

  ResultFuture<LinkCreationResponse> createPaymentLink(
    LinkCreationRequest params,
  );
}
