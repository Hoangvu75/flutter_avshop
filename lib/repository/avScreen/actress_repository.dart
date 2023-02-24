import 'package:avshop/models/av_actress_response.dart';
import '../../services/api_service.dart';

class ActressRepository {
  Future<List<AvActress>> fetchTrendingAvActress() async {
    final response = await ApiService.create().getTrendingAvActress("", "10");
    final List<AvActress> actressList = response.result!;
    return actressList;
  }

  Future<List<AvActress>> fetchTopViewAvActress() async {
    final List<AvActress> actressList = [];
    final actress_1 = await ApiService.create().getAvActressById("1048468");
    final actress_2 = await ApiService.create().getAvActressById("1030262");
    final actress_3 = await ApiService.create().getAvActressById("26225");
    final actress_4 = await ApiService.create().getAvActressById("25413");
    final actress_5 = await ApiService.create().getAvActressById("1031805");
    actressList.add(actress_1);
    actressList.add(actress_2);
    actressList.add(actress_3);
    actressList.add(actress_4);
    actressList.add(actress_5);
    return actressList;
  }
}