import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  NewOrderCubit(NewOrderState initialState) : super(initialState);
}
