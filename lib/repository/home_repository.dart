import 'package:dio/dio.dart';
import 'package:fitness_calculator/core/networking/api_service.dart';
import 'package:fitness_calculator/core/networking/endpoints.dart';
import 'package:fitness_calculator/core/networking/response/api_response.dart';
import 'package:fitness_calculator/model/daily_calorie/daily_calorie.dart';

class HomeRepository {
  final ApiService apiService = ApiService();

  Future<DailyCalorie> getDailyCalorie() async {
    try {
      Map<String, dynamic> param = {
        "age": 25,
        "gender": 'male',
        "height": 180,
        "weight": 70,
        "activitylevel": 'level_1'
      };
      final Response responseJson =
          await apiService.get(Endpoints.dailyCalorie, queryParameters: param);
      ResponseFormat response = ResponseFormat.fromJson(responseJson.data);
      DailyCalorie dailyCalorie = DailyCalorie.fromJson(response.data!);
      return dailyCalorie;
    } catch (e) {
      rethrow;
    }
  }
}
