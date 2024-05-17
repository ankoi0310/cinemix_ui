import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/core/usecases/usecases.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:cinemix_ui/src/invoice/domain/repositories/invoice_repository.dart';

class GetInvoiceById extends UsecaseWithParams<Invoice, int> {
  const GetInvoiceById(this._invoiceRepository);

  final InvoiceRepository _invoiceRepository;

  @override
  ResultFuture<Invoice> call(int params) async {
    return _invoiceRepository.getInvoiceById(params);
  }
}
