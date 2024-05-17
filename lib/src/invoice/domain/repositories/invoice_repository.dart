import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/invoice/data/models/invoice_model.dart';

abstract class InvoiceRepository {
  const InvoiceRepository();

  ResultFuture<InvoiceModel> getInvoiceById(int id);
}
