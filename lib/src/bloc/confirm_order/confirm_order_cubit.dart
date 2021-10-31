import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/API/search_query_service.dart';
import '../../data/models/book_trip.dart';

part 'confirm_order_state.dart';

class ConfirmOrderCubit extends Cubit<ConfirmOrderState> {
  final BaseTripsQueryService _tripsQueryService;
  ConfirmOrderCubit(this._tripsQueryService) : super(ConfirmOrderInitial());

  Future<void> confirmOrder(BookTrip bookTripOrder) async {
    emit(SendingYourOrder());
    try {
      await _tripsQueryService.confirmOrder(bookTripOrder);
      emit(SendingOrderSuccess());
    } catch (e) {
      emit(SendingOrderFailed(error: e.toString(), failedOrder: bookTripOrder));
    }
  }
}
