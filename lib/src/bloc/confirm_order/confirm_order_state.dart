part of 'confirm_order_cubit.dart';

abstract class ConfirmOrderState extends Equatable {
  const ConfirmOrderState();

  @override
  List<Object> get props => [];
}

class ConfirmOrderInitial extends ConfirmOrderState {}

class SendingYourOrder extends ConfirmOrderState {}

class SendingOrderFailed extends ConfirmOrderState {
  final String error;
  final BookTrip failedOrder;

  const SendingOrderFailed({
    required this.error,
    required this.failedOrder,
  });
}

class SendingOrderSuccess extends ConfirmOrderState {}
