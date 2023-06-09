import 'package:dio/dio.dart';
import 'package:fitness_calculator/core/networking/api_exceptions.dart';
import 'package:fitness_calculator/core/networking/response/api_response.dart';
import 'package:fitness_calculator/core/widget/loading_overlay/loading_overlay.dart';
import 'package:fitness_calculator/model/daily_calorie/daily_calorie.dart';
import 'package:fitness_calculator/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewModel with ChangeNotifier {
  HomeRepository repository = HomeRepository();
  ApiResponse<DailyCalorie> dailyCalorie = ApiResponse<DailyCalorie>.none();
  late LoadingProvider loadingProvider;
  
  
  HomeViewModel(BuildContext context) {
    loadingProvider = context.read<LoadingProvider>();
  }

  void _setDailyCalorie(ApiResponse<DailyCalorie> response) {
    dailyCalorie = response;
    notifyListeners();
  }

  Future<void> calculateCalorie() async {
    // _setDailyCalorie(ApiResponse.loading());
    // overlay.show();
    loadingProvider.setLoad(true);
    await repository
        .getDailyCalorie()
        .then((dailyCalorie) => _setDailyCalorie(ApiResponse<DailyCalorie>.success(dailyCalorie)))
        .onError((error, stackTrace) {
      final errorMessage = ApiExceptions.fromDioError(error as DioError).toString();
      _setDailyCalorie(ApiResponse.failed(errorMessage));
    });
    // overlay.hide();
    loadingProvider.setLoad(false);

  }

  String getTestText() {
    return "test test";
  }
}
