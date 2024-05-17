part of 'invoice_cubit.dart';

sealed class InvoiceState extends Equatable {
  const InvoiceState();

  @override
  List<Object> get props => [];
}

final class InvoiceInitial extends InvoiceState {
  const InvoiceInitial();
}

final class InvoiceLoading extends InvoiceState {
  const InvoiceLoading();
}

final class InvoiceLoaded extends InvoiceState {
  const InvoiceLoaded(this.invoice);

  final Invoice invoice;

  @override
  List<Object> get props => [invoice];
}

final class InvoiceError extends InvoiceState {
  const InvoiceError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
