import 'package:bloc/bloc.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:cinemix_ui/src/invoice/domain/usecases/get_invoice_by_id.dart';
import 'package:equatable/equatable.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit({
    required GetInvoiceById getInvoiceById,
  })  : _getInvoiceById = getInvoiceById,
        super(const InvoiceInitial());

  final GetInvoiceById _getInvoiceById;

  Future<void> getInvoiceById(int id) async {
    emit(const InvoiceLoading());
    final result = await _getInvoiceById(id);

    result.fold(
      (l) => emit(InvoiceError(l.message)),
      (r) => emit(InvoiceLoaded(r)),
    );
  }
}
