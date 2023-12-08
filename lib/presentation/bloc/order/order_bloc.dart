import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abc/data/models/order.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderInitialState()) {
    on<FetchOrdersEvent>(_onFetchOrdersEvent);
  }
  void _onFetchOrdersEvent(
      FetchOrdersEvent event, Emitter<OrderState> emitter) async {
// Change the state to LoadingState
    emitter(const OrderLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    List<Order> demoOrders =
        demoOrder.where((order) => (order.id >= 1)).toList();
    if (demoOrders.length >= 0) {
      emitter(OrderSuccessFetchDataState(orders: demoOrders));
    } else {
      emitter(const OrderErrorFetchDataState(
          errorMessage: "Something went wrong please try again!"));
    }
  }
}
