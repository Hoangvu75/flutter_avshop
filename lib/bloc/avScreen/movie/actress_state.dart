import 'package:avshop/models/av_actress_response.dart';

abstract class ActressState {}

class ActressLoadingState extends ActressState {}

class ActressLoadedState extends ActressState {
  ActressLoadedState(this.trendingActressList, this.topViewActressList);
  final List<AvActress> trendingActressList;
  final List<AvActress> topViewActressList;
}

class ActressErrorState extends ActressState {
  ActressErrorState(this.error);
  final String error;
}