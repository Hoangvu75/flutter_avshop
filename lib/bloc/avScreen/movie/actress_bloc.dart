import 'package:bloc/bloc.dart';

import '../../../repository/avScreen/actress_repository.dart';
import 'actress_event.dart';
import 'actress_state.dart';

class ActressBloc extends Bloc<ActressEvent, ActressState> {
  late final ActressRepository _movieRepository;

  ActressBloc(this._movieRepository) : super(ActressLoadingState()) {
    on<LoadActressEvent>((event, emit) async {
      emit(ActressLoadingState());
      try {
        final trendingActressList = await _movieRepository.fetchTrendingAvActress();
        final topViewActressList = await _movieRepository.fetchTopViewAvActress();
        emit(ActressLoadedState(trendingActressList, topViewActressList));
      } on Exception catch (e) {
        emit(ActressErrorState(e.toString()));
      }
    });
  }
}