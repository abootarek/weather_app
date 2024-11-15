import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  // Const on APi services
  WeatherService weatherService;
  WeatherModel? weatherModel;
  Future<void> getWeather({required cityname}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityname);
      emit(WeatherLoaded());
    } on Exception catch (e) {
      
      emit(WeatherError());
    }
  }
}
