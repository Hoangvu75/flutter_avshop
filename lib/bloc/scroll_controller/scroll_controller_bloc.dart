import 'package:avshop/bloc/scroll_controller/scroll_controller_event.dart';
import 'package:avshop/bloc/scroll_controller/scroll_controller_state.dart';
import 'package:bloc/bloc.dart';

class ScrollControllerBloc extends Bloc<ScrollControllerEvent, ScrollControllerState> {
  ScrollControllerBloc() : super(ScrollControllerInitialState()) {
    on<ScrollControllerEvent>((event, emit) {
      if (event is OnTopEvent) {
        emit(ScrollControllerState(isOnTop: true));
        print("dm");
      } else {
        emit(ScrollControllerState(isOnTop: false));
      }
    });
  }
}
